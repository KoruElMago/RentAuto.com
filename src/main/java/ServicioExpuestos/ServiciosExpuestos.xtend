package ServicioExpuestos

import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.Connection
import java.sql.PreparedStatement
import Usuario.Usuario

@Accessors
class ServiciosExpuestos {

	Connection conn = null;
	PreparedStatement ps = null;
	
	def	registrarUsuario (Usuario usuarioNuevo) {
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("INSERT INTO Usuario (, CODIGO) 
              VALUES (?,?)");
			
			}
	}
	
	
	
	def getConnection() {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost/TP-01?user=root&password=root")
	}
	

	
	}