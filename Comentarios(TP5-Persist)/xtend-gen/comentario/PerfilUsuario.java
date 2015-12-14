package comentario;

import com.mongodb.WriteResult;
import comentario.Comentario;
import comentario.Privacidad;
import comentario.SistemDB;
import java.util.ArrayList;
import java.util.List;
import model.Usuario;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class PerfilUsuario {
  private Usuario usuario;
  
  private List<Usuario> amigos;
  
  private SistemDB baseDeComentarios;
  
  public PerfilUsuario(final Usuario usuario) {
    this.usuario = usuario;
    SistemDB _sistemDB = new SistemDB();
    this.baseDeComentarios = _sistemDB;
  }
  
  public boolean esAmigo(final Usuario usuario) {
    return this.amigos.contains(usuario);
  }
  
  public ArrayList<Comentario> verComentario(final Usuario usuario) {
    ArrayList<Comentario> comentarios = new ArrayList<Comentario>();
    List<Comentario> _verComentarios = this.baseDeComentarios.verComentarios(usuario);
    comentarios.addAll(_verComentarios);
    for (final Comentario c : comentarios) {
      {
        String _autor = c.getAutor();
        boolean _equals = _autor.equals(this.usuario);
        boolean _not = (!_equals);
        if (_not) {
          comentarios.remove(c);
        }
        String _autor_1 = c.getAutor();
        boolean _equals_1 = _autor_1.equals(this.usuario);
        boolean _not_1 = (!_equals_1);
        if (_not_1) {
          String _privacidad = c.getPrivacidad();
          boolean _equals_2 = _privacidad.equals(Privacidad.SOLO_YO);
          if (_equals_2) {
            comentarios.remove(c);
          }
          boolean _esAmigo = this.esAmigo(usuario);
          boolean _not_2 = (!_esAmigo);
          if (_not_2) {
            String _privacidad_1 = c.getPrivacidad();
            boolean _equals_3 = _privacidad_1.equals(Privacidad.AMIGOS);
            if (_equals_3) {
              comentarios.remove(c);
            }
          }
        }
      }
    }
    return comentarios;
  }
  
  public WriteResult publicarComentario(final Comentario comentario) {
    return this.baseDeComentarios.guardarComentario(this.usuario, comentario);
  }
  
  @Pure
  public Usuario getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final Usuario usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public List<Usuario> getAmigos() {
    return this.amigos;
  }
  
  public void setAmigos(final List<Usuario> amigos) {
    this.amigos = amigos;
  }
  
  @Pure
  public SistemDB getBaseDeComentarios() {
    return this.baseDeComentarios;
  }
  
  public void setBaseDeComentarios(final SistemDB baseDeComentarios) {
    this.baseDeComentarios = baseDeComentarios;
  }
}
