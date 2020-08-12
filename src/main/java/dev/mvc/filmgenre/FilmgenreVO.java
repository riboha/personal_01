package dev.mvc.filmgenre;

public class FilmgenreVO {
  
//  filmgenreno                         NUMBER(30)       NOT NULL        PRIMARY KEY,
//  genreno                             NUMBER(10)       NOT NULL,
//  filmno                              NUMBER(10)       NOT NULL,
//FOREIGN KEY (genreno) REFERENCES genre (genreno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)


private int filmgenreno; /**영화 장르 번호*/
private int genreno; /**장르 번호*/
private int filmno; /**영화 번호*/


public int getFilmgenreno() {
  return filmgenreno;
}
public void setFilmgenreno(int filmgenreno) {
  this.filmgenreno = filmgenreno;
}
public int getGenreno() {
  return genreno;
}
public void setGenreno(int genreno) {
  this.genreno = genreno;
}
public int getFilmno() {
  return filmno;
}
public void setFilmno(int filmno) {
  this.filmno = filmno;
}



}
