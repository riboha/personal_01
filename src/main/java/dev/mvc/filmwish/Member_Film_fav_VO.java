package dev.mvc.filmwish;

public class Member_Film_fav_VO {
  
  /**FilmVO*/
  private int filmno; /**��ȭ ��ȣ*/
  private String titlekr; /**�ѱ� ����*/
  private String titleen; /**���� ����*/
  private String poster; /**������*/

  /**MemberVO*/
  private int memberno; /**ȸ�� ��ȣ*/
  
  /**FilmwishVO*/
  private int filmwishno; /**������� ��ȭ ��ȣ*/

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

  public int getFilmwishno() {
    return filmwishno;
  }

  public void setFilmwishno(int filmwishno) {
    this.filmwishno = filmwishno;
  }
  
}
