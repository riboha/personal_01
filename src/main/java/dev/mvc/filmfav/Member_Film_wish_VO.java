package dev.mvc.filmfav;

public class Member_Film_wish_VO {
  
  /**FilmVO*/
  private int filmno; /**영화 번호*/
  private String titlekr; /**한글 제목*/
  private String titleen; /**영문 제목*/
  private String poster; /**포스터*/
  private double hit; /**평점 평균*/

  /**MemberVO*/
  private int memberno; /**회원 번호*/
  
  /**FilmfavVO*/
  private int filmfavno; /**좋아하는 영화 번호*/

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
