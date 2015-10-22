package hibernateTesting

import home.SessionManager
import model.Auto
import model.Categoria
import model.Deportivo
import model.Familiar
import model.TodoTerreno
import model.Turismo
import model.Ubicacion
import org.junit.After
import org.junit.Before
import services.AutoService
import services.ReservaService
import model.Reserva
import model.Usuario
import java.util.Date
import org.junit.Test
import org.junit.Assert
import org.hibernate.Query
import java.util.GregorianCalendar
import java.text.DateFormat
import java.util.Calendar

class ReservaQueryTest {
	
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
	
	ReservaService reservaService
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
	
	Reserva r1
	Reserva r2
	Reserva r3
	Reserva r4
	Reserva r5
	Reserva r6
	Reserva r7
	Reserva r8
	Reserva r9
	Reserva r10
	
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
		reservaService = new ReservaService
		
		//***************RESERVAS*****************
		
		val user1 = new Usuario("pepito","Cosme","Fulanito","coso@coso.com",new Date(1988,10,9),"1234")
		val user2 = new Usuario("juan666","Juan","Gonzales","juan666@gmail.com",new Date(1990,8,12),"abc123")
		val user3 = new Usuario("fedeP","Federico","Palombo","algo@yahoo.com.ar",new Date(1990,9,9),"fedep123")
		val user4 = new Usuario("sergeM3","Sergio","Milanessi","serge@gmail.com",new Date(1985,5,15),"1234")
		val user5 = new Usuario("Cecil8944","Pablo","Buggianessi","CecilB@gmail.com",new Date(1982,10,9),"abc1234")
		
		r2 = new Reserva =>[
			numeroSolicitud = 2
			origen = u1
			destino = u1
				inicio = null
				var Calendar cal2 = GregorianCalendar.getInstance();
				cal2.set(2015,10,11);
				inicio = cal2.getTime();
				
				
				fin = null
				cal2.set(2015,10,15);
				fin = cal2.getTime();
				
			auto = a2
			usuario = user2
		]
		
		r3 = new Reserva =>[
			numeroSolicitud = 3
			origen = u2
			destino = u3
			inicio = null
				var Calendar cal2 = GregorianCalendar.getInstance();
				cal2.set(2015,10,22);
				inicio = cal2.getTime();
			
			fin = null
				cal2.set(2015,10,26);
				fin = cal2.getTime();
			auto = a3
			usuario = user3
		]
		
		r4 = new Reserva =>[
			numeroSolicitud = 4
			origen = u3
			destino = u4
			inicio = null
				var Calendar cal2 = GregorianCalendar.getInstance();
				cal2.set(2015,10,27)
				inicio = cal2.getTime();
			
			fin = null
				cal2.set(2015,10,31)
				fin = cal2.getTime();
			auto = a3
			usuario = user4
		]
		
		r1 = new Reserva =>[
			numeroSolicitud = 1
			origen = u1
			destino = u1
				inicio = null
				var Calendar cal = GregorianCalendar.getInstance();
				cal.set(2015,10,1);
				inicio = cal.getTime();
				
				
				fin = null
				cal.set(2015,10,15);
				fin = cal.getTime();
				
			auto = a1
			usuario = user1
		]
		//reservas del auto 1
		r5 = new Reserva =>[
			numeroSolicitud = 5
			origen = u1
			destino = u2
			inicio = null
				var Calendar cal2 = GregorianCalendar.getInstance();
				cal2.set(2015,10,16)
				inicio = cal2.getTime();
			
			fin = null
				cal2.set(2015,10,21)
				fin = cal2.getTime();
			auto = a1
			usuario = user4
		]
		
		r6 = new Reserva =>[
			numeroSolicitud = 6
			origen = u2
			destino = u1
			inicio = null
				var Calendar cal2 = GregorianCalendar.getInstance();
				cal2.set(2015,10,22)
				inicio = cal2.getTime();
			
			fin = null
				cal2.set(2015,10,26)
				fin = cal2.getTime();
			auto = a1
			usuario = user4
		]
		
		
		// *******************************
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
		
		
		
		reservaService.crearReserva(r1)
		reservaService.crearReserva(r2)
		reservaService.crearReserva(r3)
		reservaService.crearReserva(r4)
		reservaService.crearReserva(r5)
		reservaService.crearReserva(r6)
		
		
		  
		
		
		
	}
	
		@After
	def limpiar() {
		reservaService.borrar()
		service.borrar()
    	SessionManager::resetSessionFactory()
	}
	
	
	@Test 
	def void consultaReserva1Test(){
		var Date aDate = null
		var Calendar cal2 = GregorianCalendar.getInstance();
		cal2.set(2015,11,5)
		aDate = cal2.getTime();
		
		
		var Date anotherDate = null
		var Calendar cal3 = GregorianCalendar.getInstance();
		cal3.set(2015,10,9)
		anotherDate = cal3.getTime();
		
		val reservas1 = reservaService.consultarAutosDisponiblesPara(u1, aDate)
		val reservas2 = reservaService.consultarAutosDisponiblesPara(u2, anotherDate)

		Assert.assertEquals(reservas1.size , 2)
		
		var Date date3 = null
		var Calendar cal4 = GregorianCalendar.getInstance();
		cal4.set(2015,11,16)
		date3 = cal4.getTime();
		
		val reservas3 = reservaService.consultarAutosDisponiblesPara(u3, date3)
		Assert.assertEquals(reservas3.size, 4)
		
	}
	
	@Test 
	def void consultaReserva2Test(){
		
		
		var Date date1 = null
		var Calendar cal2 = GregorianCalendar.getInstance();
		cal2.set(2015,10,5)
		date1 = cal2.getTime();
		date1 = r4.inicio
		
		var Date date2 = null
		var Calendar cal3 = GregorianCalendar.getInstance();
		cal3.set(2015,10,5)
		date2 = cal3.getTime();
		date2 = r4.fin
		
		val query = reservaService.consultarReservaDeAutos(r4.origen,r4.destino,r4.inicio,r4.fin, r4.auto.categoria)
		Assert.assertEquals(query.size, 1)
		
		
		}
	
	
	
}
