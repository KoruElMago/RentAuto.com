package home

import model.Reserva
import model.Ubicacion
import java.util.Date
import org.hibernate.Query
import model.ReservaException
import model.Auto
import model.Categoria
import java.util.List


class ReservaHome {
	def get(int id){
		return SessionManager.getSession().get(typeof(Reserva) ,id) as Reserva
	}

	def save(Reserva r, Auto a) throws ReservaException{
		
		a.agregarReserva(r)
		SessionManager.getSession().saveOrUpdate(r)
		SessionManager.getSession().saveOrUpdate(a)
	}
	
	def getReservasDisponibles(Ubicacion ubicacion, Date date) {
		
		//ubicacion
		var nombreUbicacion = ubicacion.nombre
		
		var all = "select distinct reserva.auto from Reserva as reserva where reserva.destino.nombre = :ubicacion and reserva.fin <= :dia and reserva.fin in (select max(reserva.fin) from Reserva as reserva group by reserva.auto.patente) "
		var all2 = "from Auto as auto where auto.ubicacionInicial.nombre = :ubicacion and auto not in(select reserva.auto from Reserva as reserva)"
		
		
		
		
		
		
		
		//all join all2
		
		var query1 = SessionManager.getSession().createQuery(all) as Query
		query1.setDate("dia", date)	
		query1.setString("ubicacion", nombreUbicacion)
		
		var query2 = SessionManager.getSession().createQuery(all2) as Query
		query2.setString("ubicacion", nombreUbicacion)
    	var List entities1 = query1.list
    	var List entities2 = query2.list
    	
    for (Object entity : entities2) {
        entities1.add(entity)
    }
		
		
		return entities1
		//return queryP.list
	}
	
	def getInfoAutosPara(Ubicacion origen,Ubicacion destino,Date inicio,Date fin, Categoria categoriaDeseada){
		
		val nombreOrigen = origen.nombre
		val nombreDestino = destino.nombre
		val nombreCategoria = categoriaDeseada.nombre 
		
		val paraConsultaAutos = "select distinct auto from Auto as auto where auto in (select reserva.auto from Reserva as reserva where reserva.inicio <= :inicio and reserva.fin >= :fin and reserva.origen.nombre = :origen and reserva.destino.nombre = :destino and reserva.auto.categoria.nombre = :categoria )"
		var queryAutos = SessionManager.getSession().createQuery(paraConsultaAutos) as Query
		queryAutos.setString("origen", nombreOrigen)
		queryAutos.setString("destino", nombreDestino)
		queryAutos.setString("categoria", nombreCategoria)
		queryAutos.setDate("inicio", inicio)
		queryAutos.setDate("fin", fin)
		
		return queryAutos.list
		
	}
	
	def void borrar(){
		 var String hql = "delete from Reserva";
        var Query query = SessionManager.getSession().createQuery(hql);
        var int rowCount = query.executeUpdate();
        System.out.println("Rows affected: " + rowCount);
		
		
	}
	
}