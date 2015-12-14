package test

import comentario.Comentario
import comentario.Privacidad
import comentario.SistemDB
import java.text.SimpleDateFormat
import java.util.Date
import model.Calificacion
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.After
import org.junit.Before

@Accessors
class AbstractTest {
	//List<Comentario> comentarios
	//List<Usuario> usuarios
	//List<Zona> zonas
	//List<Producto> productos
	//Collection<Producto> homeProducto
	
	//Usuarios:
	 var Usuario u1 
	 var Usuario u2 
	 var Usuario u3 
	 var Usuario u4 
	 var Usuario u5 
	 
	 var Comentario c1
	 var Comentario c2
	 var Comentario c3
	 var Comentario c4
	 var Comentario c5
	 var Comentario c6
	 var Comentario c7
	 var Comentario c8
	 var Comentario c9
	 var Comentario c10
	 
	 var SistemDB dataBase
	 
	 
	
	
	 
	 
	
	@Before
	def void setup(){
		
		
		var SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		var String dateInString="1992-07-07" 
		var Date fecha1 = sdf.parse(dateInString)
		
		dateInString="1989-05-12" 
		var Date fecha2 = sdf.parse(dateInString)
		
		dateInString="1990-02-21" 
		var Date fecha3 = sdf.parse(dateInString)
		
		dateInString="1985-05-15" 
		var Date fecha4 = sdf.parse(dateInString)
		
		dateInString="1991-09-29" 
		var Date fecha5 = sdf.parse(dateInString)
		
		
		
		
	u1 = new Usuario("Luper","Lucio", "Quintana", "un Email", fecha1, "false123")
		u2 = new Usuario("Serge","Sergio", "Bugiannessi", "un Email", fecha5, "false123")
		u3 = new Usuario("Kentin","Abel", "Gonzales", "un Email", fecha2, "password")
		u4 = new Usuario("Serena","Belen", "Gamboa", "un Email", fecha3, "unaContra")
		u5 = new Usuario("Facu123","Facundo", "Lejarraga", "un Email", fecha4, "contraseña");
		
		c1 = new Comentario("No me gusto", Calificacion.MALO, Privacidad.AMIGOS, "NGD123")
		c2 = new Comentario("Excelente auto", Calificacion.EXCELENTE, Privacidad.AMIGOS, "NGD123")
		c3 = new Comentario("mmm maso menos, no fue de mi comodidad", Calificacion.REGULAR, Privacidad.AMIGOS, "NGD123")
		c4 = new Comentario("mal auto", Calificacion.MALO, Privacidad.AMIGOS, "NGD123")
		c5 = new Comentario("Que buen auto", Calificacion.BUENO, Privacidad.AMIGOS, "RMV234")
		c6 = new Comentario("Ni me va ni me viene", Calificacion.REGULAR, Privacidad.AMIGOS, "RMV234")
		c7 = new Comentario("Un asco", Calificacion.MALO, Privacidad.AMIGOS, "RMV234")
		c8 = new Comentario("Muy satisfecho la verdad", Calificacion.EXCELENTE, Privacidad.AMIGOS, "RMV234")
		c9 = new Comentario("...", Calificacion.REGULAR, Privacidad.AMIGOS, "ALG135")
		c10 = new Comentario("Me gustó este auto", Calificacion.BUENO, Privacidad.AMIGOS, "ALG135")
		
		dataBase = new SistemDB();
		dataBase.guardarComentario(u1, c1)
		dataBase.guardarComentario(u1, c2)
		dataBase.guardarComentario(u1, c3)
		dataBase.guardarComentario(u2, c1)
		dataBase.guardarComentario(u2, c2)
		dataBase.guardarComentario(u2, c3)
		dataBase.guardarComentario(u2, c4)
		
		dataBase.guardarComentario(u3, c6)
		dataBase.guardarComentario(u4, c7)
		dataBase.guardarComentario(u5, c8)
		
	}
	
	@After
	def void cleanDB(){
		dataBase.comentariosCollection.drop
	}
	
}
