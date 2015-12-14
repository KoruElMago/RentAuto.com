package test

import model.Usuario
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*

class PerfilTestComentarios {
	
	Usuario usMock1;
	Usuario usMock2;
	
	@Before
	public void setUp(){
		
		usMock1 = mock(Usuario.class);
		usMock2 = mock(Usuario.class);
	
	}	
	
	
	@Test
	public void testEsAmigo(){
		
	}
}