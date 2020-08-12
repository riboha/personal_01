package dev.mvc.cast;

public class Film_Actor_VO {
  
  /**CastVO*/
  private int castno; /**출연진 번호*/
  private int c_actorno; /**배우 번호*/
  private String role; /**역할*/
  private int c_filmno; /**영화 번호*/
  
  /** FilmVO*/
  private int filmno; /**영화 번호*/
  private String titlekr; /**한글 제목*/
  private String titleen; /**영문 제목*/
  
  /**ActorVO*/
  private int actorno; /**배우 번호*/
  private String actornameen; /**영문 이름*/
  private String actornamekr; /**한글 이름*/
  
  public int getCastno() {
    return castno;
  }
  public void setCastno(int castno) {
    this.castno = castno;
  }
  public int getC_actorno() {
    return c_actorno;
  }
  public void setC_actorno(int c_actorno) {
    this.c_actorno = c_actorno;
  }
  public String getRole() {
    return role;
  }
  public void setRole(String role) {
    this.role = role;
  }
  public int getC_filmno() {
    return c_filmno;
  }
  public void setC_filmno(int c_filmno) {
    this.c_filmno = c_filmno;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  public String getTitlekr() {
    return titlekr;
  }
  public void setTitlekr(String titlekr) {
    this.titlekr = titlekr;
  }
  public String getTitleen() {
    return titleen;
  }
  public void setTitleen(String titleen) {
    this.titleen = titleen;
  }
  public int getActorno() {
    return actorno;
  }
  public void setActorno(int actorno) {
    this.actorno = actorno;
  }
  public String getActornameen() {
    return actornameen;
  }
  public void setActornameen(String actornameen) {
    this.actornameen = actornameen;
  }
  public String getActornamekr() {
    return actornamekr;
  }
  public void setActornamekr(String actornamekr) {
    this.actornamekr = actornamekr;
  }
  
  

  
  
}
