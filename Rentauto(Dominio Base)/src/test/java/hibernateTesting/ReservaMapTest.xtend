package hibernateTesting

import org.junit.Before
import model.Reserva
import services.ReservaService
import model.Ubicacion
import model.Familiar
import model.Auto
import java.util.Date
import model.Usuario
import org.junit.Test
import org.junit.After
import home.SessionManager

class ReservaMapTest {
	
	Reserva reserva
	ReservaService service
	
	@Before
	def void setUp(){
		var categoriaAuto = new Familiar=>[nombre="MiCategoria"]
		var ubicacionAuto = new Ubicacion("La Plata")
		val autoTest = new Auto("Ford","Focus",2008,"LEE337",categoriaAuto,59.99,ubicacionAuto)
		val user = new Usuario("pepito","Cosme","Fulanito","coso@coso.com",new Date(1988,10,9),"1234")
		
		reserva = new Reserva =>[
			numeroSolicitud = 11
			origen = new Ubicacion("La Plata")
			destino = new Ubicacion("Quilmes")
			inicio = new Date(2015,10,1)
			fin = new Date(2015,10,10)
			auto = autoTest
			usuario = user
		]
		service = new ReservaService
	}
	
	@After
	def limpiar() {
		service.borrar()
    	SessionManager::resetSessionFactory()
	}
	
	@Test
	def void guardoUnaReservaEnLaDB(){
		service.crearReserva(reserva)
	}
	
}