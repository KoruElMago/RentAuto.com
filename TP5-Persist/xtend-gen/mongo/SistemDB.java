package mongo;

import com.google.common.base.Objects;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import java.rmi.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Calificacion;
import model.Usuario;
import mongo.Collection;
import mongo.Comentario;
import mongo.PerfilUsuario;
import mongo.Privacidad;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.mongojack.JacksonDBCollection;

@Accessors
@SuppressWarnings("all")
public class SistemDB {
  private static SistemDB INSTANCE;
  
  private MongoClient mongoClient;
  
  private DB db;
  
  private DBCollection comentariosCollection;
  
  public static synchronized SistemDB instance() {
    boolean _equals = Objects.equal(SistemDB.INSTANCE, null);
    if (_equals) {
      SistemDB _sistemDB = new SistemDB();
      SistemDB.INSTANCE = _sistemDB;
    }
    return SistemDB.INSTANCE;
  }
  
  public SistemDB() {
    try {
      MongoClient _mongoClient = new MongoClient("localhost", 27017);
      this.mongoClient = _mongoClient;
    } catch (final Throwable _t) {
      if (_t instanceof UnknownHostException) {
        final UnknownHostException e = (UnknownHostException)_t;
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    DB _dB = this.mongoClient.getDB("persistencia");
    this.db = _dB;
    DBCollection _collection = this.db.getCollection("comentarios");
    this.comentariosCollection = _collection;
  }
  
  public <T extends Object> Collection<T> collection(final Class<T> entityType) {
    Collection<T> _xblockexpression = null;
    {
      String _simpleName = entityType.getSimpleName();
      final DBCollection dbCollection = this.db.getCollection(_simpleName);
      JacksonDBCollection<T, String> _wrap = JacksonDBCollection.<T, String>wrap(dbCollection, entityType, String.class);
      _xblockexpression = new Collection<T>(_wrap);
    }
    return _xblockexpression;
  }
  
  public BasicDBObject toDBObjectComentario(final Usuario u, final Comentario coment) {
    BasicDBObject dBObjectComentario = new BasicDBObject();
    String _nombre = u.getNombre();
    dBObjectComentario.append("usuario", _nombre);
    String _patente = coment.getPatente();
    dBObjectComentario.append("auto", _patente);
    String _comentario = coment.getComentario();
    dBObjectComentario.append("comentario", _comentario);
    String _calificacion = coment.getCalificacion();
    dBObjectComentario.append("calificacion", _calificacion);
    String _privacidad = coment.getPrivacidad();
    String _string = _privacidad.toString();
    dBObjectComentario.append("privacidad", _string);
    return dBObjectComentario;
  }
  
  public WriteResult guardarComentario(final Usuario usuario, final Comentario coment) {
    WriteResult _xblockexpression = null;
    {
      MongoClient _mongoClient = new MongoClient("localhost", 27017);
      this.mongoClient = _mongoClient;
      BasicDBObject _dBObjectComentario = this.toDBObjectComentario(usuario, coment);
      _xblockexpression = this.comentariosCollection.insert(_dBObjectComentario);
    }
    return _xblockexpression;
  }
  
  public List<Comentario> verComentarios(final PerfilUsuario perfilUsuario, final String usuarioLocal) {
    List<Comentario> coments = null;
    DBObject query = null;
    Usuario _usuario = perfilUsuario.getUsuario();
    String _nombreUsuario = _usuario.getNombreUsuario();
    BasicDBObject _basicDBObject = new BasicDBObject("$regex", _nombreUsuario);
    BasicDBObject _basicDBObject_1 = new BasicDBObject("usuario", _basicDBObject);
    query = _basicDBObject_1;
    DBCursor cursor = this.comentariosCollection.find(query);
    try {
      while (cursor.hasNext()) {
        {
          DBObject _next = cursor.next();
          Comentario comentario = new Comentario(((BasicDBObject) _next));
          coments.add(comentario);
        }
      }
    } finally {
      cursor.close();
    }
    Usuario _usuario_1 = perfilUsuario.getUsuario();
    String _nombreUsuario_1 = _usuario_1.getNombreUsuario();
    boolean _equals = Objects.equal(_nombreUsuario_1, usuarioLocal);
    if (_equals) {
      return coments;
    } else {
      boolean _esAmigo = perfilUsuario.esAmigo(usuarioLocal);
      if (_esAmigo) {
        return this.comentariosParaAmigo(coments);
      } else {
        return this.comentariosParaExtraño(coments);
      }
    }
  }
  
  public List<Comentario> comentariosParaAmigo(final List<Comentario> coments) {
    for (final Comentario c : coments) {
      boolean _esPrivado = c.esPrivado();
      if (_esPrivado) {
        coments.remove(c);
      }
    }
    return coments;
  }
  
  public List<Comentario> comentariosParaExtraño(final List<Comentario> coments) {
    for (final Comentario c : coments) {
      boolean _or = false;
      boolean _esPrivado = c.esPrivado();
      if (_esPrivado) {
        _or = true;
      } else {
        boolean _esAmigo = c.esAmigo();
        _or = _esAmigo;
      }
      if (_or) {
        coments.remove(c);
      }
    }
    return coments;
  }
  
  /**
   * def actualizarComentario(PerfilUsuario usuario, Comentario comentario, String patente, Privacidad privacidadDeseada){
   * // PASO 4.3: "UPDATE" -> Actualizamos la edad de los jugadores.
   * //DBObject find = new BasicDBObject("edad", new BasicDBObject("$gt", 30));
   * var DBObject find = new BasicDBObject("usuario", new BasicDBObject("$regex", usuario.usuario.nombreUsuario));
   * var DBObject updated = new BasicDBObject().append("$inc", new BasicDBObject().append("edad", 100));
   * collection.update(find, updated, false, true);
   * 
   * }
   */
  public void eliminar() {
    DBObject findDoc = new BasicDBObject("usuario", "Lucio");
    this.comentariosCollection.remove(findDoc);
  }
  
  public void leer() {
    DBCursor cursor = this.comentariosCollection.find();
    try {
      while (cursor.hasNext()) {
        DBObject _next = cursor.next();
        String _string = _next.toString();
        System.out.println(_string);
      }
    } finally {
      cursor.close();
    }
  }
  
  public static void main(final String[] args) {
    try {
      Comentario com = new Comentario("mal auto", Calificacion.MALO, Privacidad.AMIGOS, "NG123");
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      String dateInString = "1992-07-07";
      Date fecha = sdf.parse(dateInString);
      Usuario usuario = new Usuario("Luper", "Lucio", "Quintana", "un Email", fecha, "false123");
      SistemDB sist = new SistemDB();
      sist.guardarComentario(usuario, com);
      sist.leer();
      sist.eliminar();
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  @Pure
  public MongoClient getMongoClient() {
    return this.mongoClient;
  }
  
  public void setMongoClient(final MongoClient mongoClient) {
    this.mongoClient = mongoClient;
  }
  
  @Pure
  public DB getDb() {
    return this.db;
  }
  
  public void setDb(final DB db) {
    this.db = db;
  }
  
  @Pure
  public DBCollection getComentariosCollection() {
    return this.comentariosCollection;
  }
  
  public void setComentariosCollection(final DBCollection comentariosCollection) {
    this.comentariosCollection = comentariosCollection;
  }
}
