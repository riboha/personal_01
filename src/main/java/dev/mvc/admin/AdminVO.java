package dev.mvc.admin;

public class AdminVO {

//adminno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//adminid                             VARCHAR2(60)         NOT NULL,
//adminpw                             VARCHAR2(60)         NOT NULL,
//admingrade                          NUMBER(1)        DEFAULT 1       NOT NULL

  
private int adminno; /**������ ��ȣ*/
private String adminid; /**���̵�*/
private String adminpw; /**��й�ȣ*/
private int admingrade; /**���*/


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
