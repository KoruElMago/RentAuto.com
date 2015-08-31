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
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("UPDATE  usuario  
			  SET(esta_validada = True) 
			  WHERE (codigo_validacion = ?)");
			ps.setString(1, codigoValidación)
			this.closeConection;
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