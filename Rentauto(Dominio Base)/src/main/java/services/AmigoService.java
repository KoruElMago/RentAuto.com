package services;

import com.google.common.base.Objects;
import home.AmigoHome;
import java.util.Set;
import model.Usuario;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Relationship;
import services.GraphService;

@SuppressWarnings("all")
public class AmigoService {
  private AmigoHome createHome(final GraphDatabaseService graph) {
    return new AmigoHome(graph);
  }
  
  public Object eliminarUsuario(final Usuario user) {
    final Function1<GraphDatabaseService, Object> _function = new Function1<GraphDatabaseService, Object>() {
      @Override
      public Object apply(final GraphDatabaseService it) {
        Object _xblockexpression = null;
        {
          AmigoHome _createHome = AmigoService.this.createHome(it);
          _createHome.eliminarNodo(user);
          _xblockexpression = null;
        }
        return _xblockexpression;
      }
    };
    return GraphService.<Object>run(_function);
  }
  
  public Object agregarUsuario(final Usuario user) {
    final Function1<GraphDatabaseService, Object> _function = new Function1<GraphDatabaseService, Object>() {
      @Override
      public Object apply(final GraphDatabaseService it) {
        Object _xblockexpression = null;
        {
          AmigoHome _createHome = AmigoService.this.createHome(it);
          _createHome.crearNodoUsuario(user);
          _xblockexpression = null;
        }
        return _xblockexpression;
      }
    };
    return GraphService.<Object>run(_function);
  }
  
  public Relationship amigoDe(final Usuario usuario1, final Usuario usuario2) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field TipoRelacion is undefined"
      + "\nThe method or field TipoRelacion is undefined"
      + "\nAmigo cannot be resolved"
      + "\nAmigo cannot be resolved");
  }
  
  public Set<Usuario> amigosDe(final Usuario usuario) {
    final Function1<GraphDatabaseService, Set<Usuario>> _function = new Function1<GraphDatabaseService, Set<Usuario>>() {
      @Override
      public Set<Usuario> apply(final GraphDatabaseService it) {
        Set<Usuario> _xblockexpression = null;
        {
          final AmigoHome home = AmigoService.this.createHome(it);
          _xblockexpression = home.getAmigos(usuario);
        }
        return _xblockexpression;
      }
    };
    return GraphService.<Set<Usuario>>run(_function);
  }
  
  public Set<Usuario> conexiones(final Usuario usuario) {
    final Function1<GraphDatabaseService, Set<Usuario>> _function = new Function1<GraphDatabaseService, Set<Usuario>>() {
      @Override
      public Set<Usuario> apply(final GraphDatabaseService it) {
        Set<Usuario> _xblockexpression = null;
        {
          final AmigoHome home = AmigoService.this.createHome(it);
          _xblockexpression = home.getConexiones(usuario);
        }
        return _xblockexpression;
      }
    };
    return GraphService.<Set<Usuario>>run(_function);
  }
  
  public boolean esAmigoDe(final Usuario usuario, final Usuario amigo) {
    Set<Usuario> _amigosDe = this.amigosDe(usuario);
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      @Override
      public Boolean apply(final Usuario it) {
        String _nombreUsuario = it.getNombreUsuario();
        String _nombreUsuario_1 = amigo.getNombreUsuario();
        return Boolean.valueOf(Objects.equal(_nombreUsuario, _nombreUsuario_1));
      }
    };
    return IterableExtensions.<Usuario>exists(_amigosDe, _function);
  }
  
  public Relationship enviarMensaje(final Usuario usuario1, final Usuario usuario2, final String mensaje) {
    final Function1<GraphDatabaseService, Relationship> _function = new Function1<GraphDatabaseService, Relationship>() {
      @Override
      public Relationship apply(final GraphDatabaseService it) {
        Relationship _xblockexpression = null;
        {
          final AmigoHome home = AmigoService.this.createHome(it);
          _xblockexpression = home.enviarMensaje(usuario1, usuario2, mensaje);
        }
        return _xblockexpression;
      }
    };
    return GraphService.<Relationship>run(_function);
  }
}
