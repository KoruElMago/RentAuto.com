package services

import home.SessionManager
import home.UsuarioHome
import java.util.Date
import model.Usuario

class UsuarioService {
	
	def consultarUsuario(int id) {
		SessionManager.runInSession([
			new UsuarioHome().get(id)
		])
	}

	def crearUsuario(String user, String nombre, String apellido, String email, Date fechaNacimiento, String password) {
		SessionManager.runInSession([
			var usuario = new Usuario(user,nombre,apellido,email,fechaNacimiento,password);
			new UsuarioHome().save(usuario)
			usuario
		]);
	}
	
}