package mongo

import com.mongodb.DB
import com.mongodb.MongoClient
import com.mongodb.BasicDBObject;
import com.mongodb.BulkWriteOperation;
import com.mongodb.BulkWriteResult;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.ParallelScanOptions;
import com.mongodb.ServerAddress;

import java.util.List;
import java.util.Set;

import static java.util.concurrent.TimeUnit.SECONDS;



import java.rmi.UnknownHostException
import org.mongojack.JacksonDBCollection
import model.Usuario
import model.Calificacion
import java.text.SimpleDateFormat
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SistemDB {
static SistemDB INSTANCE;
MongoClient mongoClient;
DB db;
DBCollection comentariosCollection
//DBCollection comentariosCollection = db.getCollection("comentarios");
//SistemDB.instance().collection(Producto)


	synchronized def static SistemDB instance() {
		if (INSTANCE == null) {
			INSTANCE = new SistemDB();
		}
		return INSTANCE;
	}

	
	public new() {
		try {
			mongoClient = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			throw new RuntimeException(e);
		}
		db = mongoClient.getDB("persistencia");
		comentariosCollection = db.getCollection("comentarios")
	}
	
	
	def <T> Collection<T> collection(Class<T> entityType){
		val dbCollection = db.getCollection(entityType.getSimpleName());
		new Collection<T>(JacksonDBCollection.wrap(dbCollection, entityType, String));
	}
	
	def BasicDBObject toDBObjectComentario(Usuario u, Comentario coment) {

    // Creamos una instancia BasicDBObject
    var BasicDBObject dBObjectComentario = new BasicDBObject();

	dBObjectComentario.append("usuario", u.nombre);
    dBObjectComentario.append("auto", coment.patente);
    dBObjectComentario.append("comentario", coment.comentario);
    dBObjectComentario.append("calificacion", coment.calificacion);
    dBObjectComentario.append("privacidad", coment.privacidad.toString);

    return dBObjectComentario;
}
	
	
	
	
	//Guardar el comentario ya creado en la db
	def guardarComentario(Usuario usuario, Comentario coment ){
		
		mongoClient = new MongoClient("localhost" , 27017);
		
		comentariosCollection.insert(toDBObjectComentario(usuario,coment));
		
		}
	
	def verComentarios(PerfilUsuario perfilUsuario, String usuarioLocal){
		var List<Comentario> coments;
		var DBObject query
			query = new BasicDBObject( "usuario", new BasicDBObject("$regex", perfilUsuario.usuario.nombreUsuario));
			var cursor = comentariosCollection.find(query)
try {
	while (cursor.hasNext()) {
		var Comentario comentario = new Comentario(cursor.next() as BasicDBObject)
		coments.add(comentario);
		
	}
} finally {
	cursor.close();	
}

if(perfilUsuario.usuario.nombreUsuario == usuarioLocal)
	{
	return coments	
	}
	else
	if(perfilUsuario.esAmigo(usuarioLocal))
			return comentariosParaAmigo(coments)
			
			else
			
			return comentariosParaExtraño(coments)
			
		}
		
		def comentariosParaAmigo(List<Comentario>coments){
			for(Comentario c : coments){
				if(c.esPrivado)
					coments.remove(c)
			}
			return coments
		}
	
		def comentariosParaExtraño(List<Comentario>coments){
			for(Comentario c : coments){
				if(c.esPrivado || c.esAmigo)
					coments.remove(c)
			}
			return coments	
		}
		
		
		/*
		def actualizarComentario(PerfilUsuario usuario, Comentario comentario, String patente, Privacidad privacidadDeseada){
			// PASO 4.3: "UPDATE" -> Actualizamos la edad de los jugadores.
//DBObject find = new BasicDBObject("edad", new BasicDBObject("$gt", 30));
var DBObject find = new BasicDBObject("usuario", new BasicDBObject("$regex", usuario.usuario.nombreUsuario));
var DBObject updated = new BasicDBObject().append("$inc", new BasicDBObject().append("edad", 100));
collection.update(find, updated, false, true);
			
		}
		
		
		* 
		*/
		
		def void eliminar(){
			var DBObject findDoc = new BasicDBObject("usuario", "Lucio")
			comentariosCollection.remove(findDoc)
		}
		
		def void leer(){
			var DBCursor cursor = comentariosCollection.find();
try {
	while (cursor.hasNext()) {
	    System.out.println(cursor.next().toString());
    }
} finally {
	cursor.close();
}
		}
		
		
		
		
	def static void main(String[] args){
		var com = new Comentario("mal auto", Calificacion.MALO, Privacidad.AMIGOS, "NG123")
		
		var SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		var String dateInString="1992-07-07" 
		var Date fecha = sdf.parse(dateInString)

		
		var usuario = new Usuario("Luper","Lucio", "Quintana", "un Email", fecha, "false123")
		
		
		var SistemDB sist = new SistemDB()
		//sist.toDBObjectComentario(usuario, com)
		sist.guardarComentario(usuario, com)
		sist.leer()
		sist.eliminar()
	
		
	}
		
	}