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
		//busco si el usuario ya existe, y sino lo guardo como usuario nuevo
		if (repositorio.buscarUsuario(usuarioNuevo.nombreUsuario) != Null) {
			throw new UsuarioYaExisteException
		}
		repositorio.guardarUsuario(usuarioNuevo)
	}

	def void ValidarCuenta (String codigoValidacion) throws ValidacionException{
		if (repositorio.buscarUsuarioPorCodigo(codigoValidacion) == Null){
			throw new ValidacionException
		}
		repositorio.validarCuenta(codigoValidacion)
	}
	
	def Usuario IngresarUsuario ( String userName, String password) throws UsuarioNoExiste{
		if (repositorio.buscarUsuario(userName) == Null) {
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