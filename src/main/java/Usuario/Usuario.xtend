package Usuario;

import org.eclipse.xtend.lib.annotations.Accessors;

@Accessors




 class Usuario {
	
		String nombreUsuario
		String nombre
		String apellido
		String email
		String fechaNacimiento
		

	//Estructura
	
		new(String nombreUsuario, String nombre, 
				String apellido, String email, String fechaNacimiento){
		
			
			this.nombreUsuario = nombreUsuario
			this.nombre = nombre
			this.apellido = apellido
			this.email = email
			this.fechaNacimiento = fechaNacimiento

		}
	
	}