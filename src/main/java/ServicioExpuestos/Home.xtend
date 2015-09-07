package ServicioExpuestos

import Usuario.Usuario
import java.sql.Connection
import java.sql.DriverManager
import java.sql.PreparedStatement
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Home {

	Connection conn = null;
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	

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

	def void guardarUsuario (Usuario usuario) {
		
		try{
			conn = this.getConnection()
			ps = conn.prepareStatement("DELETE FROM Usuario WHERE nombre_usuario == ? ");
			
			ps2 = conn.prepareStatement
			("INSERT INTO Usuario (nombre_usuario, nombre, apellido, 
			                       email, fecha_nacimiento, esta_validada,
			                       codigo_validacion,password) 
                          VALUES              (?, ?, ?
                          		       ?, ?, ?
                          		       ?,?)");
            ps.setString(1, usuario.nombreUsuario)
            ps2.setString(1, usuario.nombreUsuario)
            ps2.setString(2, usuario.nombre)
            ps2.setString(3, usuario.apellido)
            ps2.setString(4, usuario.email)
            ps2.setString(5, usuario.fechaNacimiento)
            ps2.setBoolean(6, usuario.estaValidada)
            ps2.setString(7, usuario.codigoValidacion)
			ps2.setString(8, usuario.password);
			ps.execute();
			
			}finally{
				 this.closeConection();
			}
	}


	def buscarUsuario(String nombreUsuario){
		var  rsNombre          = ""
		var  rsCodigo          = ""
		var  rsApellido        = ""
		var  rsFechaNacimiento = ""
		var  rsEmail           = ""
		var  rsNombreUsuario   = ""
		var  rsEstaValidada    = false
		var  rsPassword        = ""
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * from usuario where nombre_usuario = ?");
			ps.setString(1, nombreUsuario)
			
			var rs = ps.executeQuery();
			
			if(rs.next){
			  rsNombre          = rs.getString("nombre");
			  rsCodigo          = rs.getString("codigo_validacion");
			  rsApellido        = rs.getString("apellido");
			  rsFechaNacimiento = rs.getString("fecha_nacimiento");
			  rsEmail           = rs.getString("email");
			  rsNombreUsuario   = rs.getString("nombre_usuario");
			  rsEstaValidada    = rs.getBoolean("esta_validada");
			  rsPassword        = rs.getString("password");
			
			
			}
			}finally{
				 this.closeConection();
			}
		var us = new Usuario(rsNombreUsuario,rsNombre,rsApellido,rsEmail,rsFechaNacimiento);
			us.codigoValidacion = rsCodigo;
			us.estaValidada = rsEstaValidada;
		return us;
		}
		
	 

	
	def buscarUsuarioPorCodigo(String codigo){
		var  rsNombre          = ""
		var  rsCodigo          = ""
		var  rsApellido        = ""
		var  rsFechaNacimiento = ""
		var  rsEmail           = ""
		var  rsNombreUsuario   = ""
		var  rsEstaValidada   = false
		
		
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * from usuario where codigo_validacion = ?");
			ps.setString(1, codigo)
			
			var rs = ps.executeQuery();
			if(rs.next){
			  rsNombre          = rs.getString("nombre");
			  rsCodigo          = rs.getString("codigo_validacion");
			  rsApellido        = rs.getString("apellido");
			  rsFechaNacimiento = rs.getString("fecha_nacimiento");
			  rsEmail           = rs.getString("email");
			  rsNombreUsuario   = rs.getString("nombre_usuario");
			  rsEstaValidada   = rs.getBoolean("esta_validada");
			
			
			}
			}finally{
				 this.closeConection();
			}
			
			var us = new Usuario(rsNombreUsuario,rsNombre,rsApellido,rsEmail,rsFechaNacimiento);
			us.codigoValidacion = rsCodigo;
			us.estaValidada = rsEstaValidada;
			return us;
		
	}
	
	
	

	
	}
