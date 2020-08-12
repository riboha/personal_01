package dev.mvc.directorfav;

public class DirectorfavVO {
  
//dirfavno                            NUMBER(30)       NOT NULL        PRIMARY KEY,
//memberno                            NUMBER(10)       NOT NULL,
//dirno                               NUMBER(10)       NOT NULL,
//FOREIGN KEY (memberno) REFERENCES member (memberno),
//FOREIGN KEY (dirno) REFERENCES director (dirno)


private int dirfavno; /**좋아하는 감독 번호*/
private int memberno; /**회원 번호*/
private int dirno; /**감독 번호*/
public int getDirfavno() {
  return dirfavno;
}
public void setDirfavno(int dirfavno) {
  this.dirfavno = dirfavno;
}
public int getMemberno() {
  return memberno;
}
public void setMemberno(int memberno) {
  this.memberno = memberno;
}
public int getDirno() {
  return dirno;
}
public void setDirno(int dirno) {
  this.dirno = dirno;
}



}
