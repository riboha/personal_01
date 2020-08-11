package dev.mvc.admin;

public class AdminVO {

//adminno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//adminid                             VARCHAR2(60)         NOT NULL,
//adminpw                             VARCHAR2(60)         NOT NULL,
//admingrade                          NUMBER(1)        DEFAULT 1       NOT NULL

  
private int adminno; /**관리자 번호*/
private String adminid; /**아이디*/
private String adminpw; /**비밀번호*/
private int admingrade; /**등급*/


public int getAdminno() {
  return adminno;
}
public void setAdminno(int adminno) {
  this.adminno = adminno;
}
public String getAdminid() {
  return adminid;
}
public void setAdminid(String adminid) {
  this.adminid = adminid;
}
public String getAdminpw() {
  return adminpw;
}
public void setAdminpw(String adminpw) {
  this.adminpw = adminpw;
}
public int getAdmingrade() {
  return admingrade;
}
public void setAdmingrade(int admingrade) {
  this.admingrade = admingrade;
}



}
