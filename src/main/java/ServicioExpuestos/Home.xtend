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
	
	def void guardarUsuario (Usuario usuario) {
		
		try{
			conn = this.getConnection()
			ps = conn.prepareStatement
			("INSERT INTO Usuario (nombre_usuario, nombre, apellido, 
			                       email, fecha_nacimiento, esta_validada,
			                       codigo_validacion) 
                          VALUES              (?, ?, ?
                          		       ?, ?, ?
                          		       ?)");
                        ps.setString(1, usuario.nombreUsuario)
                        ps.setString(2, usuario.nombre)
                        ps.setString(3, usuario.apellido)
                        ps.setString(4, usuario.email)
                        ps.setString(5, usuario.fechaNacimiento)
                        ps.setBoolean(6, usuario.estaValidada)
                        ps.setString(7, usuario.codigoValidacion)
			this.closeConection
			}		
	}


	def buscarUsuario(String nombreUsuario){
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * from usuario where nombre_usuario = ?");
			ps.setString(1, nombreUsuario)
		}
		
	}
	
	def existeUsuario(String nombreUsuario){
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * from usuario where nombre_usuario = ?");
			ps.setString(1, nombreUsuario)
			ps.fetchSize > 0;
		}
		
	}
	
	def existeUsuarioConCodigo(String codigoValidacion){
		
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * from usuario where codigoValidacion = ?");
			ps.setString(1, codigoValidacion)
			ps.fetchSize > 0;
		}
		
	}	
	
	def buscarUsuarioPorCodigo(String codigo){
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement
			("SELECT * from usuario where codigo_validacion = ?");
			ps.setString(1, codigo)
		}
		
	}
	
	def cambiarPassword (String userName, String password, String nuevaPassword){
		try{
			conn = this.getConnection
			ps = conn.prepareStatement("Update Usuarios set password =?
                                        where nombre_usuario = ?")
            ps.setString(1,nuevaPassword)
            ps.setString(2,userName)
		}
	}
	
	def validarCuenta(String codigoValidacion){
		try{
			conn = this.getConnection
			ps = conn.prepareStatement("Update Usuarios set esta_validada =?
                                        where codigo_validacion = ?")
            ps.setBoolean(1,true)
            ps.setString(2,codigoValidacion)
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
