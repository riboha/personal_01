package dev.mvc.qcate;

public class QcateVO {
  
//      qcateno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//      qcatetitle                          VARCHAR2(100)        NOT NULL,
//      qcateicon                           VARCHAR2(100)        NOT NULL,
//      qcateseq                            NUMBER(10)       DEFAULT 1       NOT NULL

  
private int qcateno; /**���� ī�� ��ȣ*/
private String qcatetitle; /**���� ī�� ����*/
private String qcateicon; /**���� ī�� ������*/
private int qcateseq; /**���� ī�� ����*/


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
