package comentario

import com.mongodb.BasicDBObject
import java.util.ArrayList
import model.Calificacion
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Comentario {

	String comentario   
	String calificacion
	String privacidad
	String patente
  	String autor

	
	new (BasicDBObject dBObjectComentario) {
		this.calificacion = dBObjectComentario.getString("calificacion")
		this.comentario = dBObjectComentario.getString("comentario")
		this.privacidad = dBObjectComentario.getString("privacidad")
		this.patente = 	dBObjectComentario.getString("patente")
		
	}
	
	new(String comentario, Calificacion calificacion, Privacidad privacidad, String patente, Usuario autor){
		this.calificacion = calificacion.toString
		this.comentario = comentario
		this.privacidad = privacidad.toString
		this.patente = patente
		this.autor = autor.nombreUsuario
	}	
}
