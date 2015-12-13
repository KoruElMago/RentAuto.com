package mongo;

import java.util.List;
import model.Usuario;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class PerfilUsuario {
  private Usuario usuario;
  
  private List<Usuario> amigos;
  
  public PerfilUsuario(final Usuario usuario) {
    this.usuario = usuario;
  }
  
  public boolean esAmigo(final String nombreUsuario) {
    return this.amigos.contains(nombreUsuario);
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
}
