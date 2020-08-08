package dev.mvc.photo;

public class PhotoCont {

//    photono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//    photoname                           VARCHAR2(300)        NOT NULL,
//    photohumb                           VARCHAR2(300)        NOT NULL,
//    photosize                           NUMBER(10)       NOT NULL,
//    filmno                              NUMBER(10)       NOT NULL,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

private int photono; /**사진 번호*/
private String photoname; /**사진 파일명*/
private String photohumb; /**사진 썸네일*/
private int photosize; /**사진 사이즈*/
private int filmno; /**영화 번호*/


public int getPhotono() {
  return photono;
}
public void setPhotono(int photono) {
  this.photono = photono;
}
public String getPhotoname() {
  return photoname;
}
public void setPhotoname(String photoname) {
  this.photoname = photoname;
}
public String getPhotohumb() {
  return photohumb;
}
public void setPhotohumb(String photohumb) {
  this.photohumb = photohumb;
}
public int getPhotosize() {
  return photosize;
}
public void setPhotosize(int photosize) {
  this.photosize = photosize;
}
public int getFilmno() {
  return filmno;
}
public void setFilmno(int filmno) {
  this.filmno = filmno;
}




}
