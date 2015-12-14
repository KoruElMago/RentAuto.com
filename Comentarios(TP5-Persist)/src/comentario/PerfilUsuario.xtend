package comentario

import java.util.ArrayList
import java.util.List
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PerfilUsuario {
	Usuario usuario
	List<Usuario> amigos
	SistemDB baseDeComentarios
	
	new(Usuario usuario)
		{
			this.usuario = usuario
			this.baseDeComentarios = new SistemDB;
		}
	
	def esAmigo(Usuario usuario){
		return amigos.contains(usuario)
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
				if (!this.esAmigo(usuario)){
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
