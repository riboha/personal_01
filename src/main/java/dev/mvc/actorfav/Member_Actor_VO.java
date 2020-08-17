package dev.mvc.actorfav;

public class Member_Actor_VO {

  /**ActorVO*/
  private int actorno; /**배우 번호*/
  private String actornameen; /**영문 이름*/
  private String actornamekr; /**한글 이름*/
  private String actorpic; /**프로필*/

  /**MemberVO*/
  private int memberno; /**회원 번호*/
  
  /**ActorfavVO*/
  private int actorfavno; /**좋아하는 배우 번호*/

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

  public String getActorpic() {
    return actorpic;
  }

  public void setActorpic(String actorpic) {
    this.actorpic = actorpic;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getActorfavno() {
    return actorfavno;
  }

  public void setActorfavno(int actorfavno) {
    this.actorfavno = actorfavno;
  }
  
  




}
