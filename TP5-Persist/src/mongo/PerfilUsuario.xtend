package mongo

import java.util.ArrayList
import java.util.List
import model.Calificacion
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PerfilUsuario {
	Usuario usuario
	List<Usuario> amigos
	
	new(Usuario usuario)
		{
			this.usuario = usuario
		
		}
	
	def esAmigo(String nombreUsuario){
		return amigos.contains(nombreUsuario)
	}
	
}