package home

import model.Auto
import org.hibernate.Query
import java.util.List
import org.hibernate.Session

class AutoHome {
	def get(String patente){
		var q = "select auto from Auto as auto where auto.patente = :patente"
		var query = SessionManager.getSession().createQuery(q) as Query
		
		query.setString("patente", patente)
		var autos = query.list
		return autos.get(0) as Auto
	}

	def save(Auto a) {
		SessionManager.getSession().saveOrUpdate(a)
	}
	
	def getAll() {
	
     var query = SessionManager::getSession().createQuery("from Auto")
           return query.list()
   }
	
}