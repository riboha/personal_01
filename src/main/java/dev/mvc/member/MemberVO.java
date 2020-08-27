package dev.mvc.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

//  memberno                            NUMBER(10)       NOT NULL        PRIMARY KEY,
//  id                                  VARCHAR2(60)         NOT NULL,
//  pw                                  VARCHAR2(60)         NOT NULL,
//  nick                                VARCHAR2(60)         NOT NULL,
//  tel                                 VARCHAR2(40)       NOT NULL  UNIQUE,
//  pnt                                 NUMBER(10)       DEFAULT 0       NOT NULL,
//  birth                               DATE         NOT NULL,
//  email                               VARCHAR2(100)        NULL ,
//  memthumb                            VARCHAR2(60)         NULL ,
//  mempic                              VARCHAR2(60)         NULL ,
//  mempicsize                          NUMBER(10)       DEFAULT 0       NOT NULL
  
private int memberno; /**ȸ�� ��ȣ*/
private String id; /**���̵�*/
private String pw; /**��й�ȣ*/
private String nick; /**�г���*/
private String tel; /**�޴���*/
private int pnt; /**����Ʈ*/
private String birth; /**�������*/
private String email; /**�̸���*/
private String memthumb; /**������ �����*/
private String mempic; /**������*/
private long mempicsize; /**������ ũ��*/

private MultipartFile mempicMF; /**������ ��Ƽ����*/

public int getMemberno() {
  return memberno;
}

public void setMemberno(int memberno) {
  this.memberno = memberno;
}

public String getId() {
  return id;
}

public void setId(String id) {
  this.id = id;
}

public String getPw() {
  return pw;
}

public void setPw(String pw) {
  this.pw = pw;
}

public String getNick() {
  return nick;
}

public void setNick(String nick) {
  this.nick = nick;
}

public String getTel() {
  return tel;
}

public void setTel(String tel) {
  this.tel = tel;
}

public int getPnt() {
  return pnt;
}

public void setPnt(int pnt) {
  this.pnt = pnt;
}

public String getBirth() {
  return birth;
}

public void setBirth(String birth) {
  this.birth = birth;
}

public String getEmail() {
  return email;
}

public void setEmail(String email) {
  this.email = email;
}

public String getMemthumb() {
  return memthumb;
}

public void setMemthumb(String memthumb) {
  this.memthumb = memthumb;
}

public String getMempic() {
  return mempic;
}

public void setMempic(String mempic) {
  this.mempic = mempic;
}

public long getMempicsize() {
  return mempicsize;
}

public void setMempicsize(long mempicsize) {
  this.mempicsize = mempicsize;
}

public MultipartFile getMempicMF() {
  return mempicMF;
}

public void setMempicMF(MultipartFile mempicMF) {
  this.mempicMF = mempicMF;
}


}
