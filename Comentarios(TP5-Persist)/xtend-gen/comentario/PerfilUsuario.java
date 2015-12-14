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
        boolean _esAmigo = this.esAmigo(usuario);
        boolean _not_1 = (!_esAmigo);
        if (_not_1) {
          String _privacidad = c.getPrivacidad();
          boolean _equals_1 = _privacidad.equals(Privacidad.AMIGOS);
          if (_equals_1) {
            comentarios.remove(c);
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
