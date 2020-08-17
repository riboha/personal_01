package dev.mvc.directorfav;

public class Member_Director_VO {
  
  /**FilmVO*/
  private int dirno; /**감독 번호*/
  private String dirnamekr; /**감독 한글 이름*/
  private String dirnameen; /**감독 영어 이름*/
  private String dirphoto; /**감독 사진*/

  /**MemberVO*/
  private int memberno; /**회원 번호*/
  
  /**DirectorfavVO*/
  private int dirfavno; /**보고싶은 영화 번호*/

  public int getDirno() {
    return dirno;
  }

  public void setDirno(int dirno) {
    this.dirno = dirno;
  }

  public String getDirnamekr() {
    return dirnamekr;
  }

  public void setDirnamekr(String dirnamekr) {
    this.dirnamekr = dirnamekr;
  }

  public String getDirnameen() {
    return dirnameen;
  }

  public void setDirnameen(String dirnameen) {
    this.dirnameen = dirnameen;
  }

  public String getDirphoto() {
    return dirphoto;
  }

  public void setDirphoto(String dirphoto) {
    this.dirphoto = dirphoto;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getDirfavno() {
    return dirfavno;
  }

  public void setDirfavno(int dirfavno) {
    this.dirfavno = dirfavno;
  }
  

}
