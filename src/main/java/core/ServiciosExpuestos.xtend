package core

import exceptions.NuevaPasswordInvalida
import exceptions.UsuarioNoExiste
import exceptions.UsuarioYaExisteException
import exceptions.ValidacionException

class ServiciosExpuestos {
	
	var Home repositorio
	
	new(Home newHome) {
		repositorio = newHome
	}
	
	def void registrarUsuario (Usuario usuarioNuevo) {
		
		var user = repositorio.buscarUsuario(usuarioNuevo.nombreUsuario)
		if (user != null) {
			throw new UsuarioYaExisteException
		}
		repositorio.guardarUsuario(usuarioNuevo)
		
	}

	def void validarCuenta (String codigoValidacion) throws ValidacionException{
		
		var user = repositorio.buscarUsuarioPorCodigo(codigoValidacion)
		if (user == null){
			throw new ValidacionException
		}
		user.validar
		repositorio.guardarUsuario(user)
		
	}
	
	def Usuario ingresarUsuario ( String userName, String password) throws UsuarioNoExiste{
		
		var user = repositorio.buscarUsuario(userName)
		if (user == null) {
			throw new UsuarioNoExiste
		}
		//repositorio.ingresarUsuario(userName,password)
		
	}
	
	def void cambiarPassword ( String userName, String password, String nuevaPassword) throws NuevaPasswordInvalida{
		
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