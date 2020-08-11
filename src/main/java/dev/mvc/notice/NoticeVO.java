package dev.mvc.notice;

public class NoticeVO {

//noticeno                            NUMBER(10)       NOT NULL        PRIMARY KEY,
//noticetitle                         VARCHAR2(200)       NOT NULL,
//noticecontent                       CLOB         NOT NULL,
//noticedate                        DATE     NOT NULL,
//noticeshow                          NUMBER(1)        DEFAULT 1       NOT NULL,
//noticeseq                           NUMBER(10)       DEFAULT 1       NOT NULL,
//adminno                             NUMBER(10)       NOT NULL,
//FOREIGN KEY (adminno) REFERENCES admin (adminno)

private int noticeno; /**���� ��ȣ*/
private String noticetitle; /**���� ����*/
private String noticecontent; /**���� ����*/
private String noticedate; /**���� ��¥*/
private int noticeshow; /**���� ��� ����*/
private int noticeseq; /**���� ��� ����*/
private int adminno; /**������ ��ȣ*/

public int getNoticeno() {
  return noticeno;
}
public void setNoticeno(int noticeno) {
  this.noticeno = noticeno;
}
public String getNoticetitle() {
  return noticetitle;
}
public void setNoticetitle(String noticetitle) {
  this.noticetitle = noticetitle;
}
public String getNoticecontent() {
  return noticecontent;
}
public void setNoticecontent(String noticecontent) {
  this.noticecontent = noticecontent;
}
public String getNoticedate() {
  return noticedate;
}
public void setNoticedate(String noticedate) {
  this.noticedate = noticedate;
}
public int getNoticeshow() {
  return noticeshow;
}
public void setNoticeshow(int noticeshow) {
  this.noticeshow = noticeshow;
}
public int getNoticeseq() {
  return noticeseq;
}
public void setNoticeseq(int noticeseq) {
  this.noticeseq = noticeseq;
}
public int getAdminno() {
  return adminno;
}
public void setAdminno(int adminno) {
  this.adminno = adminno;
}


}
