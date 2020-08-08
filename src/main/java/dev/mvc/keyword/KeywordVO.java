package dev.mvc.keyword;

public class KeywordVO {

  //  keywordno                           NUMBER(10)       NOT NULL        PRIMARY KEY,
//  keyword                             VARCHAR2(60)         NOT NULL,
//  keywordseq                        NUMBER(30)     DEFAULT 1     NOT NULL,
//  filmno                              NUMBER(10)       NULL ,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

private int keywordno; /**Ű���� ��ȣ*/
private String keyword; /**Ű���� ����*/
private int filmno; /**��ȭ ��ȣ*/
private int keywordseq; /**Ű���� ��� ���� */


public int getKeywordno() {
  return keywordno;
}
public void setKeywordno(int keywordno) {
  this.keywordno = keywordno;
}
public String getKeyword() {
  return keyword;
}
public void setKeyword(String keyword) {
  this.keyword = keyword;
}
public int getFilmno() {
  return filmno;
}
public void setFilmno(int filmno) {
  this.filmno = filmno;
}
public int getKeywordseq() {
  return keywordseq;
}
public void setKeywordseq(int keywordseq) {
  this.keywordseq = keywordseq;
}



}
