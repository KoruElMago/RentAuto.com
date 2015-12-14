package comentario;

import com.google.common.base.Objects;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import comentario.Collection;
import comentario.Comentario;
import comentario.PerfilUsuario;
import java.rmi.UnknownHostException;
import java.util.List;
import model.Usuario;
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
    return coments;
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
