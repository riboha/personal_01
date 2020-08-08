package dev.mvc.award;

public class AwardVO {
  
//  awardno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
//  awardname                         VARCHAR2(100)    NOT NULL,
//  prize                             VARCHAR2(100)    NOT NULL,
//  year                              NUMBER(4)    NOT NULL,
//  awardseq                          NUMBER(30)     DEFAULT 1     NOT NULL,
//  filmno                            NUMBER(10)     NOT NULL,
//FOREIGN KEY (filmno) REFERENCES film (filmno)

  private int awardno ; /**�����ȣ*/
  private int awardseq; /**���� ��¼���*/
  private int filmno ; /**��ȭ ��ȣ*/
  private int year ; /**�⵵*/
  private String awardname; /**�û�ĸ�*/
  private String prize; /**�ι�*/
  
  
  public int getAwardno() {
    return awardno;
  }
  public int getAwardseq() {
    return awardseq;
  }
  public void setAwardseq(int awardseq) {
    this.awardseq = awardseq;
  }
  public void setAwardno(int awardno) {
    this.awardno = awardno;
  }
  public String getAwardname() {
    return awardname;
  }
  public void setAwardname(String awardname) {
    this.awardname = awardname;
  }
  public String getPrize() {
    return prize;
  }
  public void setPrize(String prize) {
    this.prize = prize;
  }
  public int getYear() {
    return year;
  }
  public void setYear(int year) {
    this.year = year;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  
  
  

}
