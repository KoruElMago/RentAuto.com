package comentario;

import com.mongodb.BasicDBObject;
import comentario.Privacidad;
import model.Calificacion;
import model.Usuario;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Comentario {
  private String comentario;
  
  private String calificacion;
  
  private String privacidad;
  
  private String patente;
  
  private String autor;
  
  public Comentario(final BasicDBObject dBObjectComentario) {
    String _string = dBObjectComentario.getString("calificacion");
    this.calificacion = _string;
    String _string_1 = dBObjectComentario.getString("comentario");
    this.comentario = _string_1;
    String _string_2 = dBObjectComentario.getString("privacidad");
    this.privacidad = _string_2;
    String _string_3 = dBObjectComentario.getString("patente");
    this.patente = _string_3;
  }
  
  public Comentario(final String comentario, final Calificacion calificacion, final Privacidad privacidad, final String patente, final Usuario autor) {
    String _string = calificacion.toString();
    this.calificacion = _string;
    this.comentario = comentario;
    String _string_1 = privacidad.toString();
    this.privacidad = _string_1;
    this.patente = patente;
    String _nombreUsuario = autor.getNombreUsuario();
    this.autor = _nombreUsuario;
  }
  
  @Pure
  public String getComentario() {
    return this.comentario;
  }
  
  public void setComentario(final String comentario) {
    this.comentario = comentario;
  }
  
  @Pure
  public String getCalificacion() {
    return this.calificacion;
  }
  
  public void setCalificacion(final String calificacion) {
    this.calificacion = calificacion;
  }
  
  @Pure
  public String getPrivacidad() {
    return this.privacidad;
  }
  
  public void setPrivacidad(final String privacidad) {
    this.privacidad = privacidad;
  }
  
  @Pure
  public String getPatente() {
    return this.patente;
  }
  
  public void setPatente(final String patente) {
    this.patente = patente;
  }
  
  @Pure
  public String getAutor() {
    return this.autor;
  }
  
  public void setAutor(final String autor) {
    this.autor = autor;
  }
}
