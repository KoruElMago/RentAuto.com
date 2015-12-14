package home

import com.datastax.driver.core.Host
import com.datastax.driver.core.Row
import com.datastax.driver.core.Session
import com.datastax.driver.core.Cluster
import com.datastax.driver.core.ResultSet
import com.datastax.driver.core.Metadata

class CassandraSistemDB {
Cluster cluster;
Session session;


public new(){
}




def void connect(String node) {
	 cluster = Cluster.builder()
         .addContactPoint(node).build();
   var Metadata metadata = cluster.getMetadata();
   System.out.printf("Connected to cluster: %s\n", 
         metadata.getClusterName());
   for ( Host host : metadata.getAllHosts() ) {
      System.out.printf("Datacenter: %s; Host: %s; Rack: %s\n",
         host.getDatacenter(), host.getAddress(), host.getRack());
         
          
   }
   
  	session = cluster.connect("tplabo");
}
   
	def void close() {
   cluster.close
   session.close
}

def  agregarAuto(String ubicacion, String fecha, String patente){
	this.connect("127.0.0.1")
session.execute("INSERT INTO autos (ubicacion, fecha, patente) VALUES ( " + ubicacion + "," + fecha + "," + patente + ")");

this.close
}


def borrarAuto(String fecha, String ubicacion, String patente){
	this.connect("127.0.0.1")

session.execute("DELETE FROM autos WHERE patente = " + patente );
this.close
}
	
	def void select(){
		var ResultSet results = session.execute("SELECT FROM autos");
for (Row row : results) {
System.out.println(row.getString("patente"));

	}
	}
	
	
	

}
