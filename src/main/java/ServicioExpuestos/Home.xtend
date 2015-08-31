package ServicioExpuestos

import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.Connection
import java.sql.PreparedStatement
import Usuario.Usuario

@Accessors
class Home {

	Connection conn = null;
	PreparedStatement ps = null;
	
	def	registrarUsuario (Usuario usuarioNuevo) {
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("INSERT INTO Usuario (,) 
              VALUES (?,?)");
			this.closeConection;
			}		
	}
	
	def validarCuenta (String codigoValidación){
		
	}
	
	def closeConection(){
		
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
	}
	
	def getConnection() {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost/TP-01?user=root&password=root")
	}
	
	def cambiarContraseña(String password, String nombreUsuario){
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("UPDATE usuario SET (password = ?) where (nombre_usuario = ?)")
		
		ps.setString (1, password)
		ps.setString (2, nombreUsuario)
						
		}
		
		
	}
	
	}