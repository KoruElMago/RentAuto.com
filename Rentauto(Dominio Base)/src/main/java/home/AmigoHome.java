package home;

import java.util.Set;
import java.util.function.Consumer;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.IteratorExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.neo4j.graphdb.Direction;
import org.neo4j.graphdb.DynamicLabel;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Label;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.Relationship;
import org.neo4j.graphdb.RelationshipType;
import org.neo4j.graphdb.ResourceIterable;
import org.neo4j.graphdb.ResourceIterator;
import org.neo4j.graphdb.traversal.Evaluators;
import org.neo4j.graphdb.traversal.PathEvaluator;
import org.neo4j.graphdb.traversal.TraversalDescription;
import org.neo4j.graphdb.traversal.Traverser;

import model.TipoRelacion;
import model.Usuario;

@Accessors
@SuppressWarnings("all")
public class AmigoHome {
  private GraphDatabaseService graph;
  
  public AmigoHome(final GraphDatabaseService graph) {
    this.graph = graph;
  }
  
  private Label personLabel() {
    return DynamicLabel.label("Usuario");
  }
  
  private Label msgLabel() {
    return DynamicLabel.label("Msg");
  }
  
  public void crearNodoUsuario(final Usuario usuario) {
    Label _personLabel = this.personLabel();
    final Node node = this.graph.createNode(_personLabel);
    String _nombre = usuario.getNombre();
    node.setProperty("nombre", _nombre);
    String _apellido = usuario.getApellido();
    node.setProperty("apellido", _apellido);
    String _email = usuario.getEmail();
    node.setProperty("mail", _email);
    String _nombreUsuario = usuario.getNombreUsuario();
    node.setProperty("nombreUsuario", _nombreUsuario);
  }
  
  public Node crearNodoMsg(final String mensaje) {
    Node _xblockexpression = null;
    {
      Label _msgLabel = this.msgLabel();
      final Node node = this.graph.createNode(_msgLabel);
      node.setProperty("body", mensaje);
      _xblockexpression = node;
    }
    return _xblockexpression;
  }
  
  public void eliminarNodo(final Usuario usuario) {
    final Node nodo = this.getNodo(usuario);
    Iterable<Relationship> _relationships = nodo.getRelationships();
    final Consumer<Relationship> _function = new Consumer<Relationship>() {
      @Override
      public void accept(final Relationship it) {
        it.delete();
      }
    };
    _relationships.forEach(_function);
    nodo.delete();
  }
  
  public Node getNodo(final Usuario usuario) {
    String _nombreUsuario = usuario.getNombreUsuario();
    return this.getNodo(_nombreUsuario);
  }
  
  public Node getNodo(final String nombreUsuario) {
    Label _personLabel = this.personLabel();
    ResourceIterator<Node> _findNodes = this.graph.findNodes(_personLabel, "nombreUsuario", nombreUsuario);
    return IteratorExtensions.<Node>head(_findNodes);
  }
  
  public Relationship relacionar(final Usuario usuario1, final Usuario usuario2, final TipoRelacion relacion) {
    Relationship _xblockexpression = null;
    {
      final Node nodo1 = this.getNodo(usuario1);
      final Node nodo2 = this.getNodo(usuario2);
      _xblockexpression = nodo1.createRelationshipTo(nodo2, relacion);
    }
    return _xblockexpression;
  }
  
  public Relationship enviarMensaje(final Usuario persona1, final Usuario persona2, final String body) {
    Relationship _xblockexpression = null;
    {
      final Node nodo1 = this.getNodo(persona1);
      final Node nodo2 = this.getNodo(persona2);
      final Node msg = this.crearNodoMsg(body);
      nodo1.createRelationshipTo(msg, TipoRelacion.Envia);
      _xblockexpression = msg.createRelationshipTo(nodo2, TipoRelacion.Recibe);
    }
    return _xblockexpression;
  }
  
  private Usuario toUsuario(final Node nodo) {
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      @Override
      public void apply(final Usuario it) {
        Object _property = nodo.getProperty("nombreUsuario");
        it.setNombreUsuario(((String) _property));
        Object _property_1 = nodo.getProperty("nombre");
        it.setNombre(((String) _property_1));
        Object _property_2 = nodo.getProperty("apellido");
        it.setApellido(((String) _property_2));
        Object _property_3 = nodo.getProperty("mail");
        it.setEmail(((String) _property_3));
      }
    };
    return ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
  }
  
  public Set<Usuario> getAmigos(final Usuario usuario) {
    Set<Usuario> _xblockexpression = null;
    {
      final Node nodoUsuario = this.getNodo(usuario);
      final Iterable<Node> nodoAmigos = this.relacionados(nodoUsuario, TipoRelacion.Amigo, Direction.INCOMING);
      final Function1<Node, Usuario> _function = new Function1<Node, Usuario>() {
        @Override
        public Usuario apply(final Node it) {
          return AmigoHome.this.toUsuario(it);
        }
      };
      Iterable<Usuario> _map = IterableExtensions.<Node, Usuario>map(nodoAmigos, _function);
      _xblockexpression = IterableExtensions.<Usuario>toSet(_map);
    }
    return _xblockexpression;
  }
  
  public Set<Usuario> getConexiones(final Usuario usuario) {
    Set<Usuario> _xblockexpression = null;
    {
      final Node nodoUsuario = this.getNodo(usuario);
      TraversalDescription _traversalDescription = this.graph.traversalDescription();
      TraversalDescription _breadthFirst = _traversalDescription.breadthFirst();
      TraversalDescription _relationships = _breadthFirst.relationships(TipoRelacion.Amigo, Direction.OUTGOING);
      PathEvaluator _excludeStartPosition = Evaluators.excludeStartPosition();
      final TraversalDescription td = _relationships.evaluator(_excludeStartPosition);
      Traverser _traverse = td.traverse(nodoUsuario);
      ResourceIterable<Node> _nodes = _traverse.nodes();
      final Function1<Node, Usuario> _function = new Function1<Node, Usuario>() {
        @Override
        public Usuario apply(final Node it) {
          return AmigoHome.this.toUsuario(it);
        }
      };
      Iterable<Usuario> _map = IterableExtensions.<Node, Usuario>map(_nodes, _function);
      _xblockexpression = IterableExtensions.<Usuario>toSet(_map);
    }
    return _xblockexpression;
  }
  
  public Iterable<Node> relacionados(final Node nodo, final RelationshipType tipo, final Direction direccion) {
    Iterable<Relationship> _relationships = nodo.getRelationships(tipo, direccion);
    final Function1<Relationship, Node> _function = new Function1<Relationship, Node>() {
      @Override
      public Node apply(final Relationship it) {
        return it.getOtherNode(nodo);
      }
    };
    return IterableExtensions.<Relationship, Node>map(_relationships, _function);
  }
  
  @Pure
  public GraphDatabaseService getGraph() {
    return this.graph;
  }
  
  public void setGraph(final GraphDatabaseService graph) {
    this.graph = graph;
  }
}
