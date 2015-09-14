package core

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
			ps = conn.prepareStatement("DELETE FROM USUARIOS WHERE NOMBRE_USUARIO == ? ");
			
			ps2 = conn.prepareStatement
			("INSERT INTO USUARIOS (NOMBRE_USUARIO, NOMBRE, APELLIDO, 
			                        EMAIL, FECHA_NACIMIENTO, ESTA_VALIDADA,
			                        CODIGO_VALIDACION,PASSWORD) 
                                    VALUES (?, ?, ?, ?, ?, ?,?,?)");
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

	def buscarUsuario(String codigo){
		
		var Usuario user = null
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * FROM USUARIOS WHERE NOMBRE_USUARIO = ?");
			ps.setString(1, codigo)
			
			var rs = ps.executeQuery();
			
			if(rs.next){
				
				user = new Usuario(
					rs.getString("NOMBRE_USUARIO"),
					rs.getString("NOMBRE"),
					rs.getString("APELLIDO"),
					rs.getString("EMAIL"),
					rs.getString("FECHA_NACIMIENTO"),
					rs.getString("PASSWORD")
				)
				user.codigoValidacion = rs.getString("CODIGO_VALIDACION")
				user.estaValidada = rs.getBoolean("ESTA_VALIDADA")
			
			}
			}finally{
				 this.closeConection();
			}
			
		return user;
		
	}
	
	def buscarUsuarioPorCodigo(String codigo){
		
		var Usuario user = null
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * FROM USUARIOS WHERE CODIGO_VALIDACION = ?");
			ps.setString(1, codigo)
			
			var rs = ps.executeQuery();
			
			if(rs.next){
				
				user = new Usuario(
					rs.getString("NOMBRE_USUARIO"),
					rs.getString("NOMBRE"),
					rs.getString("APELLIDO"),
					rs.getString("EMAIL"),
					rs.getString("FECHA_NACIMIENTO"),
					rs.getString("PASSWORD")
				)
				user.codigoValidacion = rs.getString("CODIGO_VALIDACION")
				user.estaValidada = rs.getBoolean("ESTA_VALIDADA")
			
			}
			}finally{
				 this.closeConection();
			}
			
		return user;
		
	}
	
	}
