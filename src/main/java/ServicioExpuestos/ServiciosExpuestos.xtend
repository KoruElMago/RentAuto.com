package ServicioExpuestos

import Usuario.Usuario

class ServiciosExpuestos {
	
	var Home repositorio
	
	new(Home newHome) {
		repositorio = newHome
	}
	
	def void RegistrarUsuario (Usuario usuarioNuevo) throws UsuarioYaExisteException {
		repositorio.registrarUsuario(usuarioNuevo)
		
	}

	def void ValidarCuenta (int codigoValidacion) throws ValidaciónException{
		repositorio.validarCuenta(codigoValidacion)
	}
	
	def Usuario IngresarUsuario ( String userName, String password) throws UsuarioNoExiste{
		
	}
	
	def void CambiarPassword ( String userName, String password, String nuevaPassword) throws NuevaPasswordInválida{
		repositorio.cambiarPassword(userName,password,nuevaPassword)
	}
	
	}