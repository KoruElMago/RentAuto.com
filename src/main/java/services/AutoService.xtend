package services

import home.AutoHome
import home.SessionManager
import model.Auto
import model.Categoria
import model.Ubicacion

class AutoService {
	
	def consultarAuto(int id) {
		SessionManager.runInSession([
			new AutoHome().get(id)
		])
	}

	def crearAuto(Auto auto) {
		SessionManager.runInSession([
			new AutoHome().save(auto)
			Auto
		]);
	}
	
}