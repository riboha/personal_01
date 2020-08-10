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
  
private int actorno; /**배우 번호*/
private String actornameen; /**영문 이름*/
private String actornamekr; /**한글 이름*/
private String birth; /**생일*/
private String nation; /**국적*/
private String actorpic; /**프로필*/
private String actorthumb; /**프로필 썸네일*/
private long actorpicsize; /**프로필 크기*/
private int actorhit; /**좋아요 수*/

private MultipartFile actorpicMF; /**프로필 멀티파일*/


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
