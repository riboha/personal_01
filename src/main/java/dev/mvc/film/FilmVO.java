package dev.mvc.film;

import org.springframework.web.multipart.MultipartFile;

public class FilmVO {

//  filmno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
//  titlekr                               VARCHAR2(100)        NOT NULL,
//  titleen                               VARCHAR2(100)        NOT NULL,
//  lan                                 VARCHAR2(60)         NOT NULL,
//  year                                NUMBER(4)        NOT NULL,
//  len                                 NUMBER(4)        NULL ,
//  summary                             CLOB        NOT NULL,
//  restrict                            NUMBER(10)       NOT NULL,
//  youtube                             VARCHAR2(1000)       NULL ,
//  url                                 VARCHAR2(1000)       NULL ,
//  poster                              VARCHAR2(100)        NULL ,
//  posterthumb                               VARCHAR2(100)        NULL ,
//  postersize                               NUMBER(10)        NULL ,
//  filmseq                             NUMBER(1)        DEFAULT 1       NOT NULL,
//  hit                                 NUMBER(10)       DEFAULT 0       NOT NULL,
//  dirno                          NUMBER(10)       NOT NULL,
//FOREIGN KEY (directorno) REFERENCES director (directorno)

private int filmno; /**��ȭ ��ȣ*/
private String titlekr; /**�ѱ� ����*/
private String titleen; /**���� ����*/
private String lan; /**���*/
private int year; /**�����⵵*/
private int len; /**����*/
private String summary; /**�ٰŸ�*/
private int restrict; /**������*/

private String youtube; /**��Ʃ��*/
private String url; /**Ȩ������*/

private String poster; /**������*/
private String posterthumb; /**�����*/
private long postersize; /**�����ͻ�����*/

private MultipartFile posterMF; /**������ MF*/

private int filmseq; /**���*/
private int hit; /**��ȸ��*/
private int dirno; /**���� ��ȣ*/

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
public String getLan() {
  return lan;
}
public void setLan(String lan) {
  this.lan = lan;
}
public int getYear() {
  return year;
}
public void setYear(int year) {
  this.year = year;
}
public int getLen() {
  return len;
}
public void setLen(int len) {
  this.len = len;
}
public String getSummary() {
  return summary;
}
public void setSummary(String summary) {
  this.summary = summary;
}
public int getRestrict() {
  return restrict;
}
public void setRestrict(int restrict) {
  this.restrict = restrict;
}
public String getYoutube() {
  return youtube;
}
public void setYoutube(String youtube) {
  this.youtube = youtube;
}
public String getUrl() {
  return url;
}
public void setUrl(String url) {
  this.url = url;
}
public String getPoster() {
  return poster;
}
public void setPoster(String poster) {
  this.poster = poster;
}
public String getPosterthumb() {
  return posterthumb;
}
public void setPosterthumb(String posterthumb) {
  this.posterthumb = posterthumb;
}
public long getPostersize() {
  return postersize;
}
public void setPostersize(long postersize) {
  this.postersize = postersize;
}
public int getFilmseq() {
  return filmseq;
}
public void setFilmseq(int filmseq) {
  this.filmseq = filmseq;
}
public int getHit() {
  return hit;
}
public void setHit(int hit) {
  this.hit = hit;
}
public int getDirno() {
  return dirno;
}
public void setDirno(int dirno) {
  this.dirno = dirno;
}
public MultipartFile getPosterMF() {
  return posterMF;
}
public void setPosterMF(MultipartFile posterMF) {
  this.posterMF = posterMF;
}

@Override
public String toString() {
  return "FilmVO [filmno=" + filmno + ", titlekr=" + titlekr + ", titleen=" + titleen + ", lan=" + lan + ", year="
      + year + ", len=" + len + ", summary=" + summary + ", restrict=" + restrict + ", youtube=" + youtube + ", url="
      + url + ", poster=" + poster + ", posterthumb=" + posterthumb + ", postersize=" + postersize + ", posterMF="
      + posterMF + ", filmseq=" + filmseq + ", hit=" + hit + ", dirno=" + dirno + "]";
}






}
