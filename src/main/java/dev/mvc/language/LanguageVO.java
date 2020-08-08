package dev.mvc.language;

public class LanguageVO {

//      languageno                          NUMBER(10)       NOT NULL        PRIMARY KEY,
//      en                                  NUMBER(1)        DEFAULT 1       NOT NULL,
//      ch                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      es                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      fr                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      ar                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      rs                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      pt                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      de                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      jp                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      hi                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      kr                                  NUMBER(1)        DEFAULT 0       NOT NULL,
//      filmno                              NUMBER(10)       NULL ,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

private int languageno; /**지원 언어 번호*/
private int filmno; /**영화 번호*/
private int en; /**영어*/
private int ch; /**중국어(보통화)*/
private int es; /**스페인어*/
private int fr; /**프랑스어*/
private int ar; /**아랍어(표준)*/
private int rs; /**러시아어*/
private int pt; /**포르투갈어*/
private int de; /**독일어*/
private int jp; /**일본어*/
private int hi; /**힌디어*/
private int kr; /**한국어*/


public int getLanguageno() {
  return languageno;
}
public void setLanguageno(int languageno) {
  this.languageno = languageno;
}
public int getFilmno() {
  return filmno;
}
public void setFilmno(int filmno) {
  this.filmno = filmno;
}
public int getEn() {
  return en;
}
public void setEn(int en) {
  this.en = en;
}
public int getCh() {
  return ch;
}
public void setCh(int ch) {
  this.ch = ch;
}
public int getEs() {
  return es;
}
public void setEs(int es) {
  this.es = es;
}
public int getFr() {
  return fr;
}
public void setFr(int fr) {
  this.fr = fr;
}
public int getAr() {
  return ar;
}
public void setAr(int ar) {
  this.ar = ar;
}
public int getRs() {
  return rs;
}
public void setRs(int rs) {
  this.rs = rs;
}
public int getPt() {
  return pt;
}
public void setPt(int pt) {
  this.pt = pt;
}
public int getDe() {
  return de;
}
public void setDe(int de) {
  this.de = de;
}
public int getJp() {
  return jp;
}
public void setJp(int jp) {
  this.jp = jp;
}
public int getHi() {
  return hi;
}
public void setHi(int hi) {
  this.hi = hi;
}
public int getKr() {
  return kr;
}
public void setKr(int kr) {
  this.kr = kr;
}






  
}
