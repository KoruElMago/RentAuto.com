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
	
	@Before
	def void setUp(){
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
		a2 = new Auto("Ford","Focus",2010,"LBM267",c1,59.99,u1)
		a3 = new Auto("Ford","Focus",2008,"RMN542",c1,59.99,u1)
		a4 = new Auto("Fiat","model1",2009,"LEE337",c1,59.99,u1)
		a5 = new Auto("Fiat","model1",2009,"LEE337",c1,59.99,u1)
		a6 = new Auto("Fiat","model2",2010,"LEE337",c1,59.99,u1)
		a7 = new Auto("Fiat","model2",2008,"LEE337",c1,59.99,u1)
		a8 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a9 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a10 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a11 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a12 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a13 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a14 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a15 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a16 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a17 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a18 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a19 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		a20 = new Auto("Ford","Focus",2008,"LEE337",c1,59.99,u1)
		
		service = new AutoService
		
		
		
	}
	
	@After
	def limpiar() {
    	SessionManager::resetSessionFactory()
	}
}
