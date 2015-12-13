package test;

import com.mongodb.DBCollection;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Calificacion;
import model.Usuario;
import mongo.Comentario;
import mongo.Privacidad;
import mongo.SistemDB;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;
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
    try {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      String dateInString = "1992-07-07";
      Date fecha1 = sdf.parse(dateInString);
      dateInString = "1989-05-12";
      Date fecha2 = sdf.parse(dateInString);
      dateInString = "1990-02-21";
      Date fecha3 = sdf.parse(dateInString);
      dateInString = "1985-05-15";
      Date fecha4 = sdf.parse(dateInString);
      dateInString = "1991-09-29";
      Date fecha5 = sdf.parse(dateInString);
      Usuario _usuario = new Usuario("Luper", "Lucio", "Quintana", "un Email", fecha1, "false123");
      this.u1 = _usuario;
      Usuario _usuario_1 = new Usuario("Serge", "Sergio", "Bugiannessi", "un Email", fecha5, "false123");
      this.u2 = _usuario_1;
      Usuario _usuario_2 = new Usuario("Kentin", "Abel", "Gonzales", "un Email", fecha2, "password");
      this.u3 = _usuario_2;
      Usuario _usuario_3 = new Usuario("Serena", "Belen", "Gamboa", "un Email", fecha3, "unaContra");
      this.u4 = _usuario_3;
      Usuario _usuario_4 = new Usuario("Facu123", "Facundo", "Lejarraga", "un Email", fecha4, "contraseña");
      this.u5 = _usuario_4;
      Comentario _comentario = new Comentario("No me gusto", Calificacion.MALO, Privacidad.AMIGOS, "NGD123");
      this.c1 = _comentario;
      Comentario _comentario_1 = new Comentario("Excelente auto", Calificacion.EXCELENTE, Privacidad.AMIGOS, "NGD123");
      this.c2 = _comentario_1;
      Comentario _comentario_2 = new Comentario("mmm maso menos, no fue de mi comodidad", Calificacion.REGULAR, Privacidad.AMIGOS, "NGD123");
      this.c3 = _comentario_2;
      Comentario _comentario_3 = new Comentario("mal auto", Calificacion.MALO, Privacidad.AMIGOS, "NGD123");
      this.c4 = _comentario_3;
      Comentario _comentario_4 = new Comentario("Que buen auto", Calificacion.BUENO, Privacidad.AMIGOS, "RMV234");
      this.c5 = _comentario_4;
      Comentario _comentario_5 = new Comentario("Ni me va ni me viene", Calificacion.REGULAR, Privacidad.AMIGOS, "RMV234");
      this.c6 = _comentario_5;
      Comentario _comentario_6 = new Comentario("Un asco", Calificacion.MALO, Privacidad.AMIGOS, "RMV234");
      this.c7 = _comentario_6;
      Comentario _comentario_7 = new Comentario("Muy satisfecho la verdad", Calificacion.EXCELENTE, Privacidad.AMIGOS, "RMV234");
      this.c8 = _comentario_7;
      Comentario _comentario_8 = new Comentario("...", Calificacion.REGULAR, Privacidad.AMIGOS, "ALG135");
      this.c9 = _comentario_8;
      Comentario _comentario_9 = new Comentario("Me gustó este auto", Calificacion.BUENO, Privacidad.AMIGOS, "ALG135");
      this.c10 = _comentario_9;
      SistemDB _sistemDB = new SistemDB();
      this.dataBase = _sistemDB;
      this.dataBase.guardarComentario(this.u1, this.c1);
      this.dataBase.guardarComentario(this.u1, this.c2);
      this.dataBase.guardarComentario(this.u1, this.c3);
      this.dataBase.guardarComentario(this.u2, this.c1);
      this.dataBase.guardarComentario(this.u2, this.c2);
      this.dataBase.guardarComentario(this.u2, this.c3);
      this.dataBase.guardarComentario(this.u2, this.c4);
      this.dataBase.guardarComentario(this.u3, this.c6);
      this.dataBase.guardarComentario(this.u4, this.c7);
      this.dataBase.guardarComentario(this.u5, this.c8);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
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
