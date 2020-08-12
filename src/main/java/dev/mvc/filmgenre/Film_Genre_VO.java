package dev.mvc.filmgenre;

public class Film_Genre_VO {
  
//SELECT g.genreno, g.genrename,
//          f.filmno,
//          x.filmgenreno, x.genreno, x.filmno
//FROM genre g, film f, filmgenre x
//WHERE g.genreno = x.genreno AND f.filmno = x.filmno AND f.filmno = #{filmno}
//ORDER BY g.genreno DESC
  
  /**FilmgenreVO*/
private int filmgenreno; /**영화 장르 번호*/
private int x_genreno; /**장르 번호*/
private int x_filmno; /**영화 번호*/

/** FilmVO*/
private int filmno; /**영화 번호*/
private String titlekr; /**한글 제목*/
private String titleen; /**영문 제목*/

/**GenreVO*/
private int genreno; /**장르 번호*/
private String genrename; /**장르명*/


public int getFilmgenreno() {
  return filmgenreno;
}
public void setFilmgenreno(int filmgenreno) {
  this.filmgenreno = filmgenreno;
}
public int getX_genreno() {
  return x_genreno;
}
public void setX_genreno(int x_genreno) {
  this.x_genreno = x_genreno;
}
public int getX_filmno() {
  return x_filmno;
}
public void setX_filmno(int x_filmno) {
  this.x_filmno = x_filmno;
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
public int getGenreno() {
  return genreno;
}
public void setGenreno(int genreno) {
  this.genreno = genreno;
}
public String getGenrename() {
  return genrename;
}
public void setGenrename(String genrename) {
  this.genrename = genrename;
}






}
