package dev.mvc.filmwish;

public class Member_Film_fav_VO {
  
  /**FilmVO*/
  private int filmno; /**영화 번호*/
  private String titlekr; /**한글 제목*/
  private String titleen; /**영문 제목*/
  private String poster; /**포스터*/

  /**MemberVO*/
  private int memberno; /**회원 번호*/
  
  /**FilmwishVO*/
  private int filmwishno; /**보고싶은 영화 번호*/

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
