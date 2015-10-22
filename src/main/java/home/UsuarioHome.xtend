package home

import model.Usuario
import org.hibernate.Query

class UsuarioHome {
	def get(int id){
		return SessionManager.getSession().get(typeof(Usuario) ,id) as Usuario
	}

	def save(Usuario user) {
		SessionManager.getSession().saveOrUpdate(user)
	}
	
	def obtenerUsuarios() {
		val consulta = "from Usuario as usuarios"
		var query = SessionManager.getSession().createQuery(consulta) as Query
		
		return query.list
	}
	
	//Solo para resetear el test
	def borrarUsuarios() {
		 var String hql = "delete from Usuario";
        var Query query = SessionManager.getSession().createQuery(hql);
        var int rowCount = query.executeUpdate();
        System.out.println("Rows affected: " + rowCount);
		
		
	}
}