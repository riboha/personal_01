package dev.mvc.photo;

public class PhotoCont {

//    photono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//    photoname                           VARCHAR2(300)        NOT NULL,
//    photohumb                           VARCHAR2(300)        NOT NULL,
//    photosize                           NUMBER(10)       NOT NULL,
//    filmno                              NUMBER(10)       NOT NULL,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

private int photono; /**���� ��ȣ*/
private String photoname; /**���� ���ϸ�*/
private String photohumb; /**���� �����*/
private int photosize; /**���� ������*/
private int filmno; /**��ȭ ��ȣ*/


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
