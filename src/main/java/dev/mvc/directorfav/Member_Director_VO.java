package dev.mvc.directorfav;

public class Member_Director_VO {
  
  /**FilmVO*/
  private int dirno; /**���� ��ȣ*/
  private String dirnamekr; /**���� �ѱ� �̸�*/
  private String dirnameen; /**���� ���� �̸�*/
  private String dirphoto; /**���� ����*/

  /**MemberVO*/
  private int memberno; /**ȸ�� ��ȣ*/
  
  /**DirectorfavVO*/
  private int dirfavno; /**������� ��ȭ ��ȣ*/

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
