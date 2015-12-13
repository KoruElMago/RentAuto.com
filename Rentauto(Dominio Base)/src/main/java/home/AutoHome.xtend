package home

import model.Auto
import org.hibernate.Query
import java.util.List
import org.hibernate.Session
import model.Ubicacion
import java.util.Date

class AutoHome {
	def get(String patente){
		var q = "select auto from Auto as auto where auto.patente = :patente"
		var query = SessionManager.getSession().createQuery(q) as Query
		
		query.setString("patente", patente)
		var autos = query.list
		if(autos.size == 0)
			null
			else 
		return autos.get(0) as Auto
	}

	def save(Auto a) {
		SessionManager.getSession().saveOrUpdate(a)
	}
	
	def getAll() {
	
     var query = SessionManager::getSession().createQuery("from Auto")
           return query.list()
   }
   
   def getCategoria(String nombre)
   	{
   		var query = SessionManager::getSession().createQuery("from Categorias as categoria where categoria.nombre = :nombre")
           return query.list()
   	}
   	
   	def getDisponible(Ubicacion ubicacion, Date aDate){
   		val query = this.getAll()
   		var query2 = SessionManager::getSession().createQuery("select Auto as auto from Auto join Reserva as reserva  where auto = reserva.auto")
   		
   		return true
   		
   	}
	
	def void borrar(){
		 var String hql = "delete from Auto";
        var Query query = SessionManager.getSession().createQuery(hql);
        var int rowCount = query.executeUpdate();
        System.out.println("Rows affected: " + rowCount);
	}
   	
   	
	
}