package dev.mvc.genre;

public class GenreVO {
  
//      genreno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//      genrename                           VARCHAR2(60)         NOT NULL,
//      genreseq                            NUMBER(10)       NOT NULL


private int genreno; /**�帣 ��ȣ*/
private String genrename; /**�帣��*/
private int genreseq; /**��¼���*/


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
public int getGenreseq() {
  return genreseq;
}
public void setGenreseq(int genreseq) {
  this.genreseq = genreseq;
}




}
