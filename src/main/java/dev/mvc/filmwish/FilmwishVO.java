package dev.mvc.filmwish;

public class FilmwishVO {
  
//filmwishno                          NUMBER(30)       NOT NULL        PRIMARY KEY,
//memberno                            NUMBER(10)       NOT NULL,
//filmno                              NUMBER(10)       NOT NULL,
//FOREIGN KEY (memberno) REFERENCES member (memberno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)


private int filmwishno; /**������� ��ȭ ��ȣ*/
private int memberno; /**ȸ�� ��ȣ*/
private int filmno; /**��ȭ ��ȣ*/

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
