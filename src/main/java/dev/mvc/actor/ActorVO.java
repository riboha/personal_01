package dev.mvc.actor;

import org.springframework.web.multipart.MultipartFile;

public class ActorVO {

//  actorno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//  actornameen                         VARCHAR2(100)        NOT NULL,
//  actornamekr                         VARCHAR2(100)        NOT NULL,
//  birth                               DATE         NOT NULL,
//  nation                              VARCHAR2(100)        NOT NULL,
//  actorpic                            VARCHAR2(100)        NULL ,
//  actorthumb                          VARCHAR2(100)        NULL ,
//  actorpicsize                        NUMBER(10)       DEFAULT 0       NOT NULL,
//  actorhit                            NUMBER(10)       DEFAULT 0       NOT NULL
  
private int actorno; /**��� ��ȣ*/
private String actornameen; /**���� �̸�*/
private String actornamekr; /**�ѱ� �̸�*/
private String birth; /**����*/
private String nation; /**����*/
private String actorpic; /**������*/
private String actorthumb; /**������ �����*/
private long actorpicsize; /**������ ũ��*/
private int actorhit; /**���ƿ� ��*/

private MultipartFile actorpicMF; /**������ ��Ƽ����*/


public int getActorno() {
  return actorno;
}
public MultipartFile getActorpicMF() {
  return actorpicMF;
}
public void setActorpicMF(MultipartFile actorpicMF) {
  this.actorpicMF = actorpicMF;
}
public void setActorno(int actorno) {
  this.actorno = actorno;
}
public String getActornameen() {
  return actornameen;
}
public void setActornameen(String actornameen) {
  this.actornameen = actornameen;
}
public String getActornamekr() {
  return actornamekr;
}
public void setActornamekr(String actornamekr) {
  this.actornamekr = actornamekr;
}
public String getBirth() {
  return birth;
}
public void setBirth(String birth) {
  this.birth = birth;
}
public String getNation() {
  return nation;
}
public void setNation(String nation) {
  this.nation = nation;
}
public String getActorpic() {
  return actorpic;
}
public void setActorpic(String actorpic) {
  this.actorpic = actorpic;
}
public String getActorthumb() {
  return actorthumb;
}
public void setActorthumb(String actorthumb) {
  this.actorthumb = actorthumb;
}
public long getActorpicsize() {
  return actorpicsize;
}
public void setActorpicsize(long actorpicsize) {
  this.actorpicsize = actorpicsize;
}
public int getActorhit() {
  return actorhit;
}
public void setActorhit(int actorhit) {
  this.actorhit = actorhit;
}



}
