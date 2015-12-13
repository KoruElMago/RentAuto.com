package services

import home.SessionManager
import model.Reserva
import home.ReservaHome
import java.util.Date
import model.Ubicacion
import model.Categoria

class ReservaService {
	def consultarReserva(int id) {
		SessionManager.runInSession([
			new ReservaHome().get(id)
		])
	}

	def crearReserva(Reserva reserva) {
		SessionManager.runInSession([
			new ReservaHome().save(reserva, reserva.auto)
			Reserva
		]);
	}
	
	def consultarReservas(){}
	
	def consultarAutosDisponiblesPara(Ubicacion ubicacion, Date aDate){
		SessionManager.runInSession([
			new ReservaHome().getReservasDisponibles(ubicacion, aDate)
			
		]);
	}
	
	def consultarReservaDeAutos(Ubicacion origen,Ubicacion destino,Date inicio,Date fin, Categoria categoriaDeseada){
		SessionManager.runInSession([
			new ReservaHome().getInfoAutosPara(origen,destino,inicio,fin,categoriaDeseada)
		]);
	}
	
	def borrar(){
		SessionManager.runInSession([
			new ReservaHome().borrar()
			Reserva
		])
		
	}
	
	
}