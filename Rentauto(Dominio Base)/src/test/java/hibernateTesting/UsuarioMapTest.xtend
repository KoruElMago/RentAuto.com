package hibernateTesting

import org.junit.Before
import model.Usuario
import java.util.Date
import services.UsuarioService
import org.junit.Test
import org.junit.Assert
import org.junit.After
import home.SessionManager

class UsuarioMapTest {
	
	Usuario user1
	Usuario user2
	Usuario user3
	Usuario user4
	Usuario user5
	
	UsuarioService service
	
	@Before
	def void setUp(){
		user1 = new Usuario("pepito","Cosme", "Fulanito","coso@coso.com",new Date(1988,9,10),"1234")
		 user2 = new Usuario("juan666","Juan","Gonzales","juan666@gmail.com",new Date(1990,8,12),"abc123")
		 user3 = new Usuario("fedeP","Federico","Palombo","algo@yahoo.com.ar",new Date(1990,9,9),"fedep123")
		 user4 = new Usuario("sergeM3","Sergio","Milanessi","serge@gmail.com",new Date(1985,5,15),"1234")
		 user5 = new Usuario("Cecil8944","Pablo","Buggianessi","CecilB@gmail.com",new Date(1982,10,9),"abc1234")
		service = new UsuarioService
	}
	
	@After
	def limpiar() {
		service.borrar()
    	SessionManager::resetSessionFactory()
    	
    	}
	
	@Test
	def void guardoUnUsuarioEnLaDB(){
		service.crearUsuario(user1)
		var query = service.obtenerUsuarios
		
		Assert.assertEquals(query.size, 1)
		
		service.crearUsuario(user1)
		
		var query2 = service.obtenerUsuarios
		
		
		Assert.assertEquals(query2.size, 1)
		
		service.crearUsuario(user2)
		service.crearUsuario(user3)
		service.crearUsuario(user4)
		service.crearUsuario(user5)
		
		var query3 = service.obtenerUsuarios
		Assert.assertEquals(query3.size, 5)
		
		service.crearUsuario(user1)
		service.crearUsuario(user1)
		service.crearUsuario(user2)
		service.crearUsuario(user3)
		service.crearUsuario(user4)
		service.crearUsuario(user5)
		service.crearUsuario(user2)
		service.crearUsuario(user3)
		service.crearUsuario(user4)
		service.crearUsuario(user5)
		
		var query4 = service.obtenerUsuarios
		Assert.assertEquals(query4.size, 5)
	}
	
}