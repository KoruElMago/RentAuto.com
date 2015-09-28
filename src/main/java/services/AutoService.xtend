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

	def crearAuto(String marca, String modelo, int anio,String patente, Categoria categoria, Double costoBase, Ubicacion ubicacionInicial) {
		SessionManager.runInSession([
			var auto = new Auto(marca,
								   modelo,
								   anio,
								   patente,
								   categoria,
								   costoBase,
								   ubicacionInicial
			);
			new AutoHome().save(auto)
			Auto
		]);
	}
	
}