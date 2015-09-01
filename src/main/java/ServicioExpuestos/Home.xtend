package ServicioExpuestos

import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.Connection
import java.sql.PreparedStatement
import Usuario.Usuario
import java.sql.DriverManager

@Accessors
class Home {

	Connection conn = null;
	PreparedStatement ps = null;
	
	def	guardarUsuario (Usuario usuarioNuevo) {
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("INSERT INTO Usuario (,) 
              VALUES (?,?)");
			this.closeConection;
			}		
	}


	def buscarUsuario(String nombreUsuario, String password){
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT nombre_usuario, password ");
		}
		
	}
	def closeConection(){
		
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
	}
	
	def getConnection() {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost/rentauto?user=root&password=root")
	}
	
	
		
	
	
	}