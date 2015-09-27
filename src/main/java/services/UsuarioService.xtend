package services

import model.Usuario
import home.SessionManager
import home.UsuarioHome

class UsuarioService {
	
	def consultarUsuario(int id) {
		SessionManager.runInSession([
			new UsuarioHome().get(id)
		])
	}

	def crearJugador(String user, String nombre, String apellido, String email, String fechaNacimiento, String password) {
		SessionManager.runInSession([
			var usuario = new Usuario(user,nombre,apellido,email,fechaNacimiento,password);
			new UsuarioHome().save(usuario)
			usuario
		]);
	}
	
}