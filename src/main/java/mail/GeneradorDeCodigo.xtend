package mail

import core.Usuario

class GeneradorDeCodigo {
	
	def final generarCodigo(Usuario user){
		user.nombreUsuario.hashCode.toString
	}
	
}