package CreadorDeMails

class GeneradorDeCodigo {
	
	def generarCodigo(Usuario user){
		user.nombreUsuario.hashCode
	}
	
}