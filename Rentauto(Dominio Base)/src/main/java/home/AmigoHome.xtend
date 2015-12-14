package home

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.DynamicLabel
import model.Usuario
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.Direction
import org.neo4j.graphdb.RelationshipType
import model.TipoRelacion
import org.neo4j.graphdb.traversal.Evaluators
import org.neo4j.graphdb.traversal.TraversalDescription

@Accessors
class AmigoHome {
	
	GraphDatabaseService graph

	new(GraphDatabaseService graph) {
		this.graph = graph
	}

	private def personLabel() {
		DynamicLabel.label("Usuario")
	}
	
	private def mensajeLabel() {
		DynamicLabel.label("Mensaje")
	}
	
	def crearNodoUsuario(Usuario usuario) {
		val node = this.graph.createNode(personLabel)
		node.setProperty("nombre", usuario.nombre)
		node.setProperty("apellido", usuario.apellido)
		node.setProperty("mail", usuario.email)
		node.setProperty("nombreUsuario", usuario.nombreUsuario)
	}
	
	def crearNodoMsg(String mensaje){
		val node = this.graph.createNode(mensajeLabel)
		node.setProperty("body", mensaje)
		node		
	}

	def eliminarNodo(Usuario usuario) {
		val nodo = this.getNodo(usuario)
		nodo.relationships.forEach[delete]
		nodo.delete
	}

	def getNodo(Usuario usuario) {
		this.getNodo(usuario.nombreUsuario)
	}
	
	def getNodo(String nombreUsuario) {
		this.graph.findNodes(personLabel, "nombreUsuario", nombreUsuario).head
	}
	
	
	
	def enviarMensaje(Usuario persona1, Usuario persona2, String body) {
		val nodo1 = this.getNodo(persona1);
		val nodo2 = this.getNodo(persona2);
		val msg = this.crearNodoMsg(body);
		nodo1.createRelationshipTo(msg, TipoRelacion.Envia);
		msg.createRelationshipTo(nodo2, TipoRelacion.Recibe);
	}
	
	private def toUsuario(Node nodo) {
		new Usuario => [
			nombreUsuario = nodo.getProperty("nombreUsuario") as String
			nombre = nodo.getProperty("nombre") as String
			apellido = nodo.getProperty("apellido") as String
			email = nodo.getProperty("mail") as String
		]
	}

	def getAmigos(Usuario usuario) {
		val nodoUsuario = this.getNodo(usuario)
		val nodoAmigos = relacionados(nodoUsuario, TipoRelacion.Amigo, Direction.INCOMING)
		nodoAmigos.map[toUsuario].toSet
	}

	
	def getConexiones(Usuario usuario) {
		val nodoUsuario = this.getNodo(usuario)
	    val TraversalDescription td = graph.traversalDescription()
	            .breadthFirst()
	            .relationships( TipoRelacion.Amigo, Direction.OUTGOING )
	            .evaluator( Evaluators.excludeStartPosition() );
	    td.traverse(nodoUsuario).nodes.map[toUsuario].toSet
	}

	 def relacionados(Node nodo, RelationshipType tipo, Direction direccion) {
		nodo.getRelationships(tipo, direccion).map[it.getOtherNode(nodo)]
	}
	
}