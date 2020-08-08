package dev.mvc.keyword;

public class KeywordVO {

  //  keywordno                           NUMBER(10)       NOT NULL        PRIMARY KEY,
//  keyword                             VARCHAR2(60)         NOT NULL,
//  keywordseq                        NUMBER(30)     DEFAULT 1     NOT NULL,
//  filmno                              NUMBER(10)       NULL ,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

private int keywordno; /**키워드 번호*/
private String keyword; /**키워드 내용*/
private int filmno; /**영화 번호*/
private int keywordseq; /**키워드 출력 순서 */


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
