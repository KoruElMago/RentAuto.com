package home

import com.mongodb.BasicDBObject
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.DBObject
import com.mongodb.MongoClient
import java.rmi.UnknownHostException
import java.util.List
import model.Comentario
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SistemDB {
static SistemDB INSTANCE;
MongoClient mongoClient;
DB db;
DBCollection comentariosCollection


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
	
	
	
	def BasicDBObject toDBObjectComentario(Comentario coment) {

    // Creamos una instancia BasicDBObject
    var BasicDBObject dBObjectComentario = new BasicDBObject();

	dBObjectComentario.append("usuario", coment.autor);
    dBObjectComentario.append("auto", coment.patente);
    dBObjectComentario.append("comentario", coment.comentario);
    dBObjectComentario.append("calificacion", coment.calificacion);
    dBObjectComentario.append("privacidad", coment.privacidad.toString);

    return dBObjectComentario;
}
	
	
	
	
	//Guardar el comentario ya creado en la db
	def guardarComentario(Usuario usuario, Comentario coment ){
		
		 
		mongoClient = new MongoClient("localhost" , 27017);
		
		comentariosCollection.insert(toDBObjectComentario(coment));
		
		}
	
	def verComentarios(Usuario usuario){
		var List<Comentario> coments;
		var DBObject query
			query = new BasicDBObject( "usuario", new BasicDBObject("$regex", usuario.nombreUsuario));
			var cursor = comentariosCollection.find(query)
		try {
			while (cursor.hasNext()) {
				var Comentario comentario = new Comentario(cursor.next() as BasicDBObject)
				coments.add(comentario);
		
			}
		} 
		finally {
		cursor.close();	
		}
		return coments
	}
	
	}
