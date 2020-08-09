package dev.mvc.qcate;

public class QcateVO {
  
//      qcateno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//      qcatetitle                          VARCHAR2(100)        NOT NULL,
//      qcateicon                           VARCHAR2(100)        NOT NULL,
//      qcateseq                            NUMBER(10)       DEFAULT 1       NOT NULL

  
private int qcateno; /**문의 카테 번호*/
private String qcatetitle; /**문의 카테 제목*/
private String qcateicon; /**문의 카테 아이콘*/
private int qcateseq; /**문의 카테 순서*/


public int getQcateno() {
  return qcateno;
}
public void setQcateno(int qcateno) {
  this.qcateno = qcateno;
}
public String getQcatetitle() {
  return qcatetitle;
}
public void setQcatetitle(String qcatetitle) {
  this.qcatetitle = qcatetitle;
}
public String getQcateicon() {
  return qcateicon;
}
public void setQcateicon(String qcateicon) {
  this.qcateicon = qcateicon;
}
public int getQcateseq() {
  return qcateseq;
}
public void setQcateseq(int qcateseq) {
  this.qcateseq = qcateseq;
}



}
