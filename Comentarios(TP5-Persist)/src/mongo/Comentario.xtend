package mongo

import org.eclipse.xtend.lib.annotations.Accessors
import com.mongodb.BasicDBObject

@Accessors

class Comentario {

	String comentario   
	String calificacion
	String privacidad
	String patente
	
	new (BasicDBObject dBObjectComentario) {
		this.calificacion = dBObjectComentario.getString("calificacion")
		this.comentario = dBObjectComentario.getString("comentario")
		this.privacidad = dBObjectComentario.getString("privacidad")
		this.patente = 	dBObjectComentario.getString("patente")
		
	}
	
	new(String comentario, model.Calificacion calificacion, Privacidad privacidad, String patente){
		this.calificacion = calificacion.toString
		this.comentario = comentario
		this.privacidad = privacidad.toString
		this.patente = patente
	}	
	
	
	def esPrivado(){
		return(privacidad.toString=="SOLO_YO") 
	}
	
	def esAmigo(){
		return(privacidad.toString=="AMIGOS")
	}
}