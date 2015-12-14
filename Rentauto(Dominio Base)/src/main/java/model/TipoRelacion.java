package model;

import org.neo4j.graphdb.RelationshipType;

public enum TipoRelacion implements RelationshipType {
	Amigo, Recibe, Envia
}
