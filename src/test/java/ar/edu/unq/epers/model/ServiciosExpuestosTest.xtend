package ar.edu.unq.epers.model

import org.junit.Test

class ServiciosExpuestosTest extends AbstractTest{
	
	@Test
	def registroDeUsuarioFallido(){
		servicioExpuesto.registrarUsuario(usuarioRegistro)
		
	}
	
	
}