package dev.mvc.filmfav;

public class Member_Film_wish_VO {
  
  /**FilmVO*/
  private int filmno; /**��ȭ ��ȣ*/
  private String titlekr; /**�ѱ� ����*/
  private String titleen; /**���� ����*/
  private String poster; /**������*/
  private double hit; /**���� ���*/

  /**MemberVO*/
  private int memberno; /**ȸ�� ��ȣ*/
  
  /**FilmfavVO*/
  private int filmfavno; /**�����ϴ� ��ȭ ��ȣ*/

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

  public String getPoster() {
    return poster;
  }

  public void setPoster(String poster) {
    this.poster = poster;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getFilmfavno() {
    return filmfavno;
  }

  public void setFilmfavno(int filmfavno) {
    this.filmfavno = filmfavno;
  }

  public double getHit() {
    return hit;
  }

  public void setHit(double hit) {
    this.hit = hit;
  }
  
  



}
