package dev.mvc.cast;

public class CastVO {
  
//castno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
//actorno                             NUMBER(10)       NOT NULL,
//role                                VARCHAR2(60)         NOT NULL,
//filmno                              NUMBER(10)       NULL ,
//FOREIGN KEY (actorno) REFERENCES actor (actorno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)
  
  private int castno; /**�⿬�� ��ȣ*/
  private int actorno; /**��� ��ȣ*/
  private String role; /**����*/
  private int filmno; /**��ȭ ��ȣ*/
  
  
  public int getCastno() {
    return castno;
  }
  public void setCastno(int castno) {
    this.castno = castno;
  }
  public int getActorno() {
    return actorno;
  }
  public void setActorno(int actorno) {
    this.actorno = actorno;
  }
  public String getRole() {
    return role;
  }
  public void setRole(String role) {
    this.role = role;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }

  
  
}
