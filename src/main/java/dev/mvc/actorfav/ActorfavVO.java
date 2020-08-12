package dev.mvc.actorfav;

public class ActorfavVO {
  
//actorfavno                          NUMBER(30)       NOT NULL        PRIMARY KEY,
//actorno                             NUMBER(10)       NOT NULL,
//memberno                            NUMBER(10)       NOT NULL,
//FOREIGN KEY (actorno) REFERENCES actor (actorno),
//FOREIGN KEY (memberno) REFERENCES member (memberno)


private int actorfavno; /**좋아하는 배우 번호*/
private int memberno; /**회원 번호*/
private int actorno; /**배우 번호*/


public int getActorfavno() {
  return actorfavno;
}
public void setActorfavno(int actorfavno) {
  this.actorfavno = actorfavno;
}
public int getMemberno() {
  return memberno;
}
public void setMemberno(int memberno) {
  this.memberno = memberno;
}
public int getActorno() {
  return actorno;
}
public void setActorno(int actorno) {
  this.actorno = actorno;
}




}
