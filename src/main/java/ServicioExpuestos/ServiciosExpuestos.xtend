package ServicioExpuestos

import Exceptions.NuevaPasswordInvalida
import Exceptions.UsuarioNoExiste
import Exceptions.UsuarioYaExisteException
import Exceptions.ValidacionException
import Usuario.Usuario

class ServiciosExpuestos {
	
	var Home repositorio
	
	new(Home newHome) {
		repositorio = newHome
	}
	
	def void RegistrarUsuario (Usuario usuarioNuevo) {
		
		var user = repositorio.buscarUsuario(usuarioNuevo.nombreUsuario)
		if (user.nombreUsuario != null) {
			throw new UsuarioYaExisteException
		}
		repositorio.guardarUsuario(usuarioNuevo)
		
	}

	def void ValidarCuenta (String codigoValidacion) throws ValidacionException{
		
		var user = repositorio.buscarUsuarioPorCodigo(codigoValidacion)
		if (user.nombreUsuario == null){
			throw new ValidacionException
		}
		user.validar
		repositorio.guardarUsuario(user)
		
	}
	
	def Usuario IngresarUsuario ( String userName, String password) throws UsuarioNoExiste{
		
		var user = repositorio.buscarUsuario(userName)
		if (user.nombreUsuario == null) {
			throw new UsuarioNoExiste
		}
		//repositorio.ingresarUsuario(userName,password)
		
	}
	
	def void CambiarPassword ( String userName, String password, String nuevaPassword) throws NuevaPasswordInvalida{
		
		if (password == nuevaPassword) {
			throw new NuevaPasswordInvalida
		}
		if (nuevaPassword.length < 4) {
			throw new NuevaPasswordInvalida
		}
		var user = repositorio.buscarUsuario(userName)
		user.setPassword(nuevaPassword)
		repositorio.guardarUsuario(user)
		
	}
	
	}