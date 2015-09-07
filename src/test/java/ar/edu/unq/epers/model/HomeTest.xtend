package ar.edu.unq.epers.model

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.Before
import Usuario.Usuario
import ServicioExpuestos.Home

public class ConnectionTest{
	
	
	@Before
	
	Usuario user = new Usuario("magosexy069", "Javier", "Zzzap", "maguitobithes@gmail.com", "01/01/19930")
	Home hogar = new Home()
	
	
	@Test
	def void testGuardarUsuario(){
		hogar.guardarUsuario(user)
		
		Assert.assertEquals("Se espera que haya podido insertar 1 registro",1, ps.getUpdateCount());	}
	
	}
	
