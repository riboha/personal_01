package dev.mvc.faq;

public class FaqVO {
  
  
  

//        faqno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
//        faqtitle                            VARCHAR2(100)        NOT NULL,
//        faqq                                CLOB         NOT NULL,
//        faqa                                CLOB         NOT NULL,w
//        faqhit                              NUMBER(10)       DEFAULT 0       NOT NULL,
//        qcateno                             NUMBER(10)       NOT NULL,
//  FOREIGN KEY (qcateno) REFERENCES qcate (qcateno)
  
private int faqno; /**�ڹ��� ��ȣ*/
private String faqtitle; /**�ڹ��� ����*/
private String faqq; /**�ڹ��� ����*/
private String faqa; /**�ڹ��� �亯*/
private int faqhit; /**�ڹ��� ��ȸ��*/
private int qcateno; /**���� ī�� ��ȣ*/


public int getFaqno() {
  return faqno;
}
public void setFaqno(int faqno) {
  this.faqno = faqno;
}
public String getFaqtitle() {
  return faqtitle;
}
public void setFaqtitle(String faqtitle) {
  this.faqtitle = faqtitle;
}
public String getFaqq() {
  return faqq;
}
public void setFaqq(String faqq) {
  this.faqq = faqq;
}
public String getFaqa() {
  return faqa;
}
public void setFaqa(String faqa) {
  this.faqa = faqa;
}
public int getFaqhit() {
  return faqhit;
}
public void setFaqhit(int faqhit) {
  this.faqhit = faqhit;
}
public int getQcateno() {
  return qcateno;
}
public void setQcateno(int qcateno) {
  this.qcateno = qcateno;
}






}
