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
		
		}
	
	def esAmigo(Usuario usuario){
		return amigos.contains(usuario)
	}
	
	def verComentario(Usuario usuario){
		var comentarios = new ArrayList<Comentario>()
		comentarios.addAll(baseDeComentarios.verComentarios(usuario))
		
		for(Comentario c :comentarios){
			if (!c.autor.equals(this.usuario)){
						comentarios.remove(c)
					}
				
			if (!this.esAmigo(usuario)){
				if (c.privacidad.equals(Privacidad.AMIGOS)){
						comentarios.remove(c)
				}
			}
		}
		return comentarios
	}
	
	def publicarComentario(Comentario comentario){
		this.baseDeComentarios.guardarComentario(this.usuario,comentario)
	}
		
}
