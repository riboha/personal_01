package dev.mvc.cast;

public class CastVO {
  
//castno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
//actorno                             NUMBER(10)       NOT NULL,
//role                                VARCHAR2(60)         NOT NULL,
//filmno                              NUMBER(10)       NULL ,
//FOREIGN KEY (actorno) REFERENCES actor (actorno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)
  
  private int castno; /**출연진 번호*/
  private int actorno; /**배우 번호*/
  private String role; /**역할*/
  private int filmno; /**영화 번호*/
  
  
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
