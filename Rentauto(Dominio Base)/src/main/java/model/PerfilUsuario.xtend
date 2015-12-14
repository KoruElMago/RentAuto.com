package model

import home.SistemDB
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import services.AmigoService

@Accessors
class PerfilUsuario {
	Usuario usuario
	SistemDB baseDeComentarios
	AmigoService amigos
	
	new(Usuario usuario)
		{
			this.usuario = usuario
			this.baseDeComentarios = new SistemDB;
			this.amigos = new AmigoService;
		}
	
	
	def verComentario(Usuario usuario){
		
		var comentarios = new ArrayList<Comentario>()
		//obtengo todos los comentarios de la base de datos
		comentarios.addAll(baseDeComentarios.verComentarios(usuario))
		
		for(Comentario c :comentarios){
		//Filtro solo los del autor
			if (!c.autor.equals(this.usuario)){
						comentarios.remove(c)
					}
		//Filtro por si no es el usuario quien desea ver el comentario			
			if (!c.autor.equals(this.usuario)){
				if (c.privacidad.equals(Privacidad.SOLO_YO)){
					comentarios.remove(c)
				}
		//Filtro por si no es Amigo del Autor 					
				if (!amigos.esAmigoDe(this.usuario,usuario)){
					if (c.privacidad.equals(Privacidad.AMIGOS)){
							comentarios.remove(c)
					}
				}
			
			}
		}
		return comentarios
	}
	
	def publicarComentario(Comentario comentario){
		this.baseDeComentarios.guardarComentario(this.usuario,comentario)
	}
	
	
		
}
