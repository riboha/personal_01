package dev.mvc.ques;

public class QuesVO {

//        quesno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
//        questitle                           VARCHAR2(1000)       NOT NULL,
//        quescontent                         CLOB         NOT NULL,
//        quesdate                            DATE         NOT NULL,
//        qcateno                             NUMBER(10)        NOT NULL,
//        memberno                            NUMBER(10)       NOT NULL,
//        payno                               NUMBER(10)       NULL ,
//        filmno                              NUMBER(10)       NULL
//  -- FOREIGN KEY (quesno) REFERENCES ques (quesno),
//  -- FOREIGN KEY (memberno) REFERENCES member (memberno),
//  -- FOREIGN KEY (payno) REFERENCES pay (payno),
//  -- FOREIGN KEY (filmno) REFERENCES film (filmno)

  
private int quesno; /**문의 번호*/
private String questitle; /**문의 제목*/
private String quescontent; /**문의 내용*/
private String quesdate; /**문의 날짜*/
private int qcateno; /**문의 카테 번호*/
private int memberno; /**회원 번호*/
private int payno; /**결제 세부 번호*/
private int filmno; /**영화 번호*/


public int getQuesno() {
  return quesno;
}
public void setQuesno(int quesno) {
  this.quesno = quesno;
}
public String getQuestitle() {
  return questitle;
}
public void setQuestitle(String questitle) {
  this.questitle = questitle;
}
public String getQuescontent() {
  return quescontent;
}
public void setQuescontent(String quescontent) {
  this.quescontent = quescontent;
}
public String getQuesdate() {
  return quesdate;
}
public void setQuesdate(String quesdate) {
  this.quesdate = quesdate;
}
public int getQcateno() {
  return qcateno;
}
public void setQcateno(int qcateno) {
  this.qcateno = qcateno;
}
public int getMemberno() {
  return memberno;
}
public void setMemberno(int memberno) {
  this.memberno = memberno;
}
public int getPayno() {
  return payno;
}
public void setPayno(int payno) {
  this.payno = payno;
}
public int getFilmno() {
  return filmno;
}
public void setFilmno(int filmno) {
  this.filmno = filmno;
}







}
