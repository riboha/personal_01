package dev.mvc.fgenre;

public class FgenreCont {
  
//  fgenreno                            NUMBER(38)       NOT NULL        PRIMARY KEY,
//  genreno                             NUMBER(10)       NOT NULL,
//  filmno                              NUMBER(10)       NOT NULL,
//FOREIGN KEY (genreno) REFERENCES genre (genreno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)


private int fgenreno; /**��ȭ �帣 ��ȣ*/
private int genreno; /**�帣 ��ȣ*/
private int filmno; /**��ȭ ��ȣ*/


public int getFgenreno() {
  return fgenreno;
}
public void setFgenreno(int fgenreno) {
  this.fgenreno = fgenreno;
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
