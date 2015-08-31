package CreadorDeMails

import Usuario.Usuario

class GeneradorDeCodigo {
	
	def final generarCodigo(Usuario user){
		user.nombreUsuario.hashCode.toString
	}
	
}