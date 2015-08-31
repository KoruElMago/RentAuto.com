package CreadorDeMails

class GeneradorDeCodigo {
	
	def generarCodigo(Usuario user){
		return user.nombreUsuario.hashCode;
	}
	
}