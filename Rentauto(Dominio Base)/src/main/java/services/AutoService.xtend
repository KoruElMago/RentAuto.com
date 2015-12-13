package services

import home.AutoHome
import home.SessionManager
import model.Auto
import model.Categoria
import model.Ubicacion
import org.hibernate.Session

class AutoService {
	
	def consultarAuto(String patente) {
		SessionManager.runInSession([
			new AutoHome().get(patente)
		])
	}

	def crearAuto(Auto auto) {
		SessionManager.runInSession([
			new AutoHome().save(auto)
			Auto
		]);
	}
	
	def getAllAuto(){
		SessionManager.runInSession([
		return (new AutoHome().getAll())
		
		]);
     
	}
	
	def borrar(){
		SessionManager.runInSession([
			new AutoHome().borrar()
			Auto
		])
	}
}