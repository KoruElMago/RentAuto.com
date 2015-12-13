package hibernateTesting

import home.SessionManager
import model.Auto
import model.Categoria
import model.Familiar
import model.Ubicacion
import org.junit.After
import org.junit.Before
import services.AutoService
import model.Turismo
import model.Deportivo
import model.TodoTerreno
import org.junit.Test
import org.junit.Assert.*
import org.hibernate.Query
import java.util.List
import org.junit.Assert

class AutoQueryTest {
	
	Auto a1
	Auto a2
	Auto a3
	Auto a4
	Auto a5
	Auto a6
	Auto a7
	Auto a8
	Auto a9
	Auto a10
	Auto a11
	Auto a12
	Auto a13
	Auto a14
	Auto a15
	Auto a16
	Auto a17
	Auto a18
	Auto a19
	Auto a20
	
	AutoService service
	Categoria c1
	Categoria c2
	Categoria c3
	Categoria c4
	
	Ubicacion u1
	Ubicacion u2
	Ubicacion u3
	Ubicacion u4
	Ubicacion u5
	Ubicacion u6
	Ubicacion u7
	Ubicacion u8
	Ubicacion u9
	Ubicacion u10
	
	SessionManager session
	
	
	
	@Before
	def void setUp(){
		SessionManager::getSessionFactory().openSession()
		
		
		c1 = new Familiar=>[nombre="MiCategoria"]
		c2 = new Turismo=>[nombre="MiCategoria"]
		c3 = new Deportivo=>[nombre="MiCategoria"]
		c4 = new TodoTerreno=>[nombre="MiCategoria"]
		
		u1 = new Ubicacion("La Plata")
		u2 = new Ubicacion("Bernal")
		u3 = new Ubicacion("Ezpeleta")
		u4 = new Ubicacion("Don Bosco")
		u5 = new Ubicacion("Quilmes")
		u6 = new Ubicacion("Berazategui")
		u7 = new Ubicacion("Platanos")
		u8 = new Ubicacion("Avellaneda")
		u9 = new Ubicacion("Hudson")
		u10 = new Ubicacion("Ranelagh")
		
		
		a1 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a2 = new Auto("Ford","Focus",2010,"LBM267",c2,59.99,u1)
		a3 = new Auto("Ford","Focus",2008,"RMN542",c2,59.99,u2)
		a4 = new Auto("Ford","model1",2009,"RES025",c3,59.99,u2)
		a5 = new Auto("Ford","model1",2009,"LKM224",c4,59.99,u3)
		a6 = new Auto("Ford","model2",2010,"LJH359",c4,59.99,u3)
		a7 = new Auto("Fiat","model2",2010,"GHS462",c1,59.99,u3)
		a8 = new Auto("Fiat","Focus",2008,"MHQ904",c1,59.99,u4)
		a9 = new Auto("Fiat","Focus",2008,"RTG756",c1,59.99,u4)
		a10 = new Auto("Fiat","Focus",2009,"POH271",c2,59.99,u5)
		a11 = new Auto("Fiat","Focus",2009,"KHQ325",c2,59.99,u5)
		a12 = new Auto("Peugeot","Focus",2009,"BGH446",c1,59.99,u5)
		a13 = new Auto("Peugeot","Focus",2009,"EYH908",c3,59.99,u6)
		a14 = new Auto("Peugeot","Focus",2008,"AFG593",c2,59.99,u6)
		a15 = new Auto("Peugeot","Focus",20010,"GHJ645",c3,59.99,u6)
		a16 = new Auto("Peugeot","Focus",20011,"DDD342",c4,59.99,u7)
		a17 = new Auto("Peugeot","Focus",20011,"LIV897",c3,59.99,u7)
		a18 = new Auto("Citroen","Focus",20011,"HUB556",c1,59.99,u8)
		a19 = new Auto("Citroen","Focus",20011,"CVK904",c2,59.99,u8)
		a20 = new Auto("Citroen","Focus",20012,"UNQ666",c4,59.99,u9)
		
		
		service = new AutoService
		
		service.crearAuto(a1)
		service.crearAuto(a2)
		service.crearAuto(a3)
		service.crearAuto(a4)
		service.crearAuto(a5)
		service.crearAuto(a6)
		service.crearAuto(a7)
		service.crearAuto(a8)
		service.crearAuto(a9)
		service.crearAuto(a10)
		
		  
		
		
		
	}
	
		@After
	def limpiar() {
		service.borrar()
    	SessionManager::resetSessionFactory()
    	
	}

	
	@Test
	def void elementosEnLaBBDD(){
		val cantidadDeAutos = service.allAuto
		Assert.assertEquals(cantidadDeAutos.size, 10)
		
		service.crearAuto(a11)
		service.crearAuto(a12)
		service.crearAuto(a13)
		service.crearAuto(a14)
		service.crearAuto(a15)
		service.crearAuto(a16)
		
		val cantidadDeAutos2 = service.allAuto
		Assert.assertEquals(cantidadDeAutos2.size, 16)
		
		service.crearAuto(a17)
		service.crearAuto(a18)
		service.crearAuto(a19)
		service.crearAuto(a20)
		
		val cantidadDeAutos3 = service.allAuto
		Assert.assertEquals(cantidadDeAutos3.size, 20)
		
		service.crearAuto(a1)
		service.crearAuto(a1)
		service.crearAuto(a1)
		service.crearAuto(a1)
		service.crearAuto(a1)
		service.crearAuto(a1)
		service.crearAuto(a1)
		
		val cantidadDeAutos4 = service.allAuto
		Assert.assertEquals(cantidadDeAutos4.size, 20)
		
		
	}
	
	
	@Test
	def void consultarUnAuto(){
		val auto1 = service.consultarAuto(a1.getPatente) 
		Assert.assertEquals(auto1.getMarca, a1.getMarca)
		Assert.assertEquals(auto1.getAnio, a1.getAnio)
		
		val auto2 = service.consultarAuto(a2.getPatente) 
		Assert.assertEquals(auto2.getMarca, a2.getMarca)
		Assert.assertEquals(auto2.getAnio, a2.getAnio)
	}
	
	@Test
	def void consultarUnAutoInexistente(){
	val autoNull = service.consultarAuto("unaPatenteCualquiera") 
		Assert.assertEquals(autoNull, null)	
	}
}
