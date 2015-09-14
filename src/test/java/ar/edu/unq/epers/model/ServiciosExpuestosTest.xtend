package ar.edu.unq.epers.model

import core.Usuario
import org.junit.Test
import org.junit.Assert

class ServiciosExpuestosTest extends AbstractTest{
	
	@Test
	def registroDeUsuario(){
		var userNuevo = new Usuario("alquimia",
									"garrapiniada",
									"artesanal",
									"123@gmail.com",
									"14/09/2000",
									"1234"
		)
		servicioExpuesto.registrarUsuario(userNuevo)
		Assert.assertTrue(servicioExpuesto.repositorio.buscarUsuario("alquimia").nombreUsuario == "alquimia")
	}

	@Test
	def registroDeUsuarioExistente(){
		var userNuevo = new Usuario("alquimia",
									"garrapiniada",
									"artesanal",
									"123@gmail.com",
									"14/09/2000",
									"1234"
		)
		servicioExpuesto.registrarUsuario(userNuevo)
		Assert.assertTrue(servicioExpuesto.repositorio.buscarUsuario("alquimia").nombreUsuario == "alquimia")
	}
	
}