package dev.mvc.directorfav;

public class DirectorfavVO {
  
//dirfavno                            NUMBER(30)       NOT NULL        PRIMARY KEY,
//memberno                            NUMBER(10)       NOT NULL,
//dirno                               NUMBER(10)       NOT NULL,
//FOREIGN KEY (memberno) REFERENCES member (memberno),
//FOREIGN KEY (dirno) REFERENCES director (dirno)


private int dirfavno; /**�����ϴ� ���� ��ȣ*/
private int memberno; /**ȸ�� ��ȣ*/
private int dirno; /**���� ��ȣ*/
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
