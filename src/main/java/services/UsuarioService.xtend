package services

import home.SessionManager
import home.UsuarioHome
import model.Usuario

class UsuarioService {
	
	def consultarUsuario(int id) {
		SessionManager.runInSession([
			new UsuarioHome().get(id)
		])
	}

	def crearUsuario(Usuario user) {
		SessionManager.runInSession([
			new UsuarioHome().save(user)
			Usuario
		]);
	}
	
	def obtenerUsuarios() {
		SessionManager.runInSession([
			new UsuarioHome().obtenerUsuarios()
			
		]);
	}
	
	def borrar() {
		SessionManager.runInSession([
			new UsuarioHome().borrarUsuarios()
			Usuario
		]);
	}
	
}