package dev.mvc.cast;

public class Film_Actor_VO {
  
  /**CastVO*/
  private int castno; /**�⿬�� ��ȣ*/
  private int c_actorno; /**��� ��ȣ*/
  private String role; /**����*/
  private int c_filmno; /**��ȭ ��ȣ*/
  
  /** FilmVO*/
  private int filmno; /**��ȭ ��ȣ*/
  private String titlekr; /**�ѱ� ����*/
  private String titleen; /**���� ����*/
  
  /**ActorVO*/
  private int actorno; /**��� ��ȣ*/
  private String actornameen; /**���� �̸�*/
  private String actornamekr; /**�ѱ� �̸�*/
  
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
