package ServicioExpuestos

import Usuario.Usuario

class ServiciosExpuestos {
	
	var Home repositorio = new Home(); 
	
	def void RegistrarUsuario (Usuario usuarioNuevo) throws UsuarioYaExisteException {
		
		
	}

	def void ValidarCuenta (int codigoValidación) throws ValidaciónException{
		
	}
	
	def Usuario IngresarUsuario ( String userName, String password) throws UsuarioNoExiste{
		
	}
	
	def void CambiarPassword ( String userName, String password, String nuevaPassword) throws NuevaPasswordInválida{
		
	}
	
	}