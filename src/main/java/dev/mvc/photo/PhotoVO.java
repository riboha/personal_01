package dev.mvc.photo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVO {

//    photono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//    photoname                           VARCHAR2(300)        NOT NULL,
//    photoalt                            VARCHAR2(1000)       NULL ,
//    photothumb                           VARCHAR2(300)        NOT NULL,
//    photosize                           NUMBER(10)       NOT NULL,
//    filmno                              NUMBER(10)       NOT NULL,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

private int photono; /**사진 번호*/
private String photoname; /**사진 파일명*/
private String photothumb; /**사진 썸네일*/
private String photoalt; /**영화 사진 설명*/
private long photosize; public String getPhotoalt() {
  return photoalt;
}
public void setPhotoalt(String photoalt) {
  this.photoalt = photoalt;
}
/**사진 사이즈*/
private int filmno; /**영화 번호*/

private List<MultipartFile> photonameMF_list; /**멀티파일 객체 리스트*/
private MultipartFile photonameMF; /**멀티파일 객체*/
private String flabel;


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
public String getPhotothumb() {
  return photothumb;
}
public void setPhotothumb(String photothumb) {
  this.photothumb = photothumb;
}
public long getPhotosize() {
  return photosize;
}
public void setPhotosize(long photosize) {
  this.photosize = photosize;
}
public int getFilmno() {
  return filmno;
}
public void setFilmno(int filmno) {
  this.filmno = filmno;
}
public List<MultipartFile> getPhotonameMF_list() {
  return photonameMF_list;
}
public void setPhotonameMF_list(List<MultipartFile> photonameMF_list) {
  this.photonameMF_list = photonameMF_list;
}
public MultipartFile getPhotonameMF() {
  return photonameMF;
}
public void setPhotonameMF(MultipartFile photonameMF) {
  this.photonameMF = photonameMF;
}
public String getFlabel() {
  return flabel;
}
public void setFlabel(String flabel) {
  this.flabel = flabel;
} 

}
