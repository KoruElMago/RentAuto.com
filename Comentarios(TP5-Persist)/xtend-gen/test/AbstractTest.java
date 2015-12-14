package test;

import com.mongodb.DBCollection;
import comentario.Comentario;
import comentario.SistemDB;
import model.Usuario;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.junit.After;
import org.junit.Before;

@Accessors
@SuppressWarnings("all")
public class AbstractTest {
  private Usuario u1;
  
  private Usuario u2;
  
  private Usuario u3;
  
  private Usuario u4;
  
  private Usuario u5;
  
  private Comentario c1;
  
  private Comentario c2;
  
  private Comentario c3;
  
  private Comentario c4;
  
  private Comentario c5;
  
  private Comentario c6;
  
  private Comentario c7;
  
  private Comentario c8;
  
  private Comentario c9;
  
  private Comentario c10;
  
  private SistemDB dataBase;
  
  @Before
  public void setup() {
    throw new Error("Unresolved compilation problems:"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)"
      + "\nInvalid number of arguments. The constructor Comentario(String, Calificacion, Privacidad, String, Usuario) is not applicable for the arguments (String,Calificacion,Privacidad,String)");
  }
  
  @After
  public void cleanDB() {
    DBCollection _comentariosCollection = this.dataBase.getComentariosCollection();
    _comentariosCollection.drop();
  }
  
  @Pure
  public Usuario getU1() {
    return this.u1;
  }
  
  public void setU1(final Usuario u1) {
    this.u1 = u1;
  }
  
  @Pure
  public Usuario getU2() {
    return this.u2;
  }
  
  public void setU2(final Usuario u2) {
    this.u2 = u2;
  }
  
  @Pure
  public Usuario getU3() {
    return this.u3;
  }
  
  public void setU3(final Usuario u3) {
    this.u3 = u3;
  }
  
  @Pure
  public Usuario getU4() {
    return this.u4;
  }
  
  public void setU4(final Usuario u4) {
    this.u4 = u4;
  }
  
  @Pure
  public Usuario getU5() {
    return this.u5;
  }
  
  public void setU5(final Usuario u5) {
    this.u5 = u5;
  }
  
  @Pure
  public Comentario getC1() {
    return this.c1;
  }
  
  public void setC1(final Comentario c1) {
    this.c1 = c1;
  }
  
  @Pure
  public Comentario getC2() {
    return this.c2;
  }
  
  public void setC2(final Comentario c2) {
    this.c2 = c2;
  }
  
  @Pure
  public Comentario getC3() {
    return this.c3;
  }
  
  public void setC3(final Comentario c3) {
    this.c3 = c3;
  }
  
  @Pure
  public Comentario getC4() {
    return this.c4;
  }
  
  public void setC4(final Comentario c4) {
    this.c4 = c4;
  }
  
  @Pure
  public Comentario getC5() {
    return this.c5;
  }
  
  public void setC5(final Comentario c5) {
    this.c5 = c5;
  }
  
  @Pure
  public Comentario getC6() {
    return this.c6;
  }
  
  public void setC6(final Comentario c6) {
    this.c6 = c6;
  }
  
  @Pure
  public Comentario getC7() {
    return this.c7;
  }
  
  public void setC7(final Comentario c7) {
    this.c7 = c7;
  }
  
  @Pure
  public Comentario getC8() {
    return this.c8;
  }
  
  public void setC8(final Comentario c8) {
    this.c8 = c8;
  }
  
  @Pure
  public Comentario getC9() {
    return this.c9;
  }
  
  public void setC9(final Comentario c9) {
    this.c9 = c9;
  }
  
  @Pure
  public Comentario getC10() {
    return this.c10;
  }
  
  public void setC10(final Comentario c10) {
    this.c10 = c10;
  }
  
  @Pure
  public SistemDB getDataBase() {
    return this.dataBase;
  }
  
  public void setDataBase(final SistemDB dataBase) {
    this.dataBase = dataBase;
  }
}
