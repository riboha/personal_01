package dev.mvc.filmwish;

public class FilmwishVO {
  
//filmwishno                          NUMBER(30)       NOT NULL        PRIMARY KEY,
//memberno                            NUMBER(10)       NOT NULL,
//filmno                              NUMBER(10)       NOT NULL,
//FOREIGN KEY (memberno) REFERENCES member (memberno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)


private int filmwishno; /**보고싶은 영화 번호*/
private int memberno; /**회원 번호*/
private int filmno; /**영화 번호*/

public int getFilmwishno() {
  return filmwishno;
}
public void setFilmwishno(int filmwishno) {
  this.filmwishno = filmwishno;
}
public int getMemberno() {
  return memberno;
}
public void setMemberno(int memberno) {
  this.memberno = memberno;
}
public int getFilmno() {
  return filmno;
}
public void setFilmno(int filmno) {
  this.filmno = filmno;
}




}
