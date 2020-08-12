package dev.mvc.review;

public class ReviewVO {

//reviewno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
//title                             VARCHAR2(100)    NOT NULL,
//review                            VARCHAR2(1000)     NOT NULL,
//rate                              NUMBER(2, 1)     NOT NULL,
//rdate                             DATE     NOT NULL,
//payno                             NUMBER(10)     NOT NULL,
//memberno                          NUMBER(10)     NOT NULL,
//filmno                            NUMBER(10)     NOT NULL,
//FOREIGN KEY (memberno) REFERENCES member (memberno),
//FOREIGN KEY (payno) REFERENCES pay (payno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)

private int reviewno; /**���� ��ȣ*/
private String title; /**����*/
private String review; /**����*/
private double rate; /**����*/
private String rdate; /**���� ��¥*/
private int payno; /**���� ���� ��ȣ*/
private int memberno; /**ȸ�� ��ȣ*/
private int filmno; /**��ȭ ��ȣ*/

public int getReviewno() {
  return reviewno;
}
public void setReviewno(int reviewno) {
  this.reviewno = reviewno;
}
public String getTitle() {
  return title;
}
public void setTitle(String title) {
  this.title = title;
}
public String getReview() {
  return review;
}
public void setReview(String review) {
  this.review = review;
}
public double getRate() {
  return rate;
}
public void setRate(double rate) {
  this.rate = rate;
}
public String getRdate() {
  return rdate;
}
public void setRdate(String rdate) {
  this.rdate = rdate;
}
public int getPayno() {
  return payno;
}
public void setPayno(int payno) {
  this.payno = payno;
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
