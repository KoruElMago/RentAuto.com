package core;

import org.eclipse.xtend.lib.annotations.Accessors;
import model.IUsuario
import model.Reserva

@Accessors

class Usuario implements IUsuario{
	
	String nombreUsuario
	String nombre
	String apellido
	String email
	String fechaNacimiento
	boolean estaValidada
	String codigoValidacion
	String password

	//Estructura
	
	new() {
		
	}
	
	new(String nombreUsuario, 
		String nombre, 
		String apellido, 
		String email, 
		String fechaNacimiento,
		String password) {
			
		this.nombreUsuario = nombreUsuario
		this.nombre = nombre
		this.apellido = apellido
		this.email = email
		this.fechaNacimiento = fechaNacimiento
		this.password = password

		}
		
	def void validar(){
		this.estaValidada = true
	}
	
	override agregarReserva(Reserva unaReserva) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getReservas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	}
