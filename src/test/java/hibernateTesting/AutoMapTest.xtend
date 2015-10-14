package hibernateTesting

import model.Auto
import services.AutoService
import org.junit.Before
import org.junit.Test
import model.Categoria
import model.Familiar
import model.Ubicacion
import org.junit.After
import home.SessionManager
import org.hibernate.Query
import java.util.List
import org.junit.Assert
import org.hibernate.SessionFactory
import org.hibernate.Session
import org.hibernate.collection.PersistentSet

class AutoMapTest{
	
	Auto auto
	AutoService service
	Categoria categoria
	Ubicacion ubicacion
	
	
 		SessionFactory sessionFactory;
 		 Session session = null;
	
	
	@Before
	def void setUp(){
		
		//sessionFactory = 
		SessionManager::getSessionFactory().openSession()
		//session = sessionFactory.openSession();
		categoria = new Familiar=>[nombre="MiCategoria"]
		ubicacion = new Ubicacion("La Plata")
		auto = new Auto("Ford","Focus",2008,"LEE337",categoria,59.99,ubicacion)
		service = new AutoService
		
		
	}
	
	
	@After
	def limpiar() {
    	SessionManager::resetSessionFactory
    	//SessionManager::getSession().close
    	//SessionManager::getSessionFactory().close
    	
	}
	
	
	/*
@After
 def void after() {
  session.close();
  sessionFactory.close();
 }*/

	
	
	@Test
	def void guardoUnAutoEnLaDB(){
		service.crearAuto(auto)
		service.crearAuto(auto)
		service.crearAuto(auto)
		service.crearAuto(auto)
		service.crearAuto(auto)
		service.crearAuto(auto)
		service.crearAuto(auto)
		service.crearAuto(auto)
		service.crearAuto(auto)
		
		var  n = auto.getPatente
		var result = service.consultarAuto(n)
		//Assert.assertEquals(result.size, 0)
		//Assert.assertEquals(result.getId, auto.getId)
		Assert.assertEquals(result.getId, auto.getId)
		Assert.assertEquals(result.getPatente, auto.getPatente)
		
	}
	
}