package test

import org.junit.Before
import org.mockito.Mockito.*;
import model.Usuario

class ComentaioTest {
	var usuMock1
	var usuMock2
	var usuMock3
	
	@Before
	public void setUp(){
		usuMock1 = mock(Usuario.class);
		usuMock2 = mock(Usuario.class);
		usuMock3 = mock(Usuario.class);
	}
	
	
	@Test
	public void test
}