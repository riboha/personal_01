package dev.mvc.rentprice;

public class RentpriceVO {
  

//rentpriceno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//day1                                NUMBER(10)       DEFAULT 0       NOT NULL,
//day3                                NUMBER(10)       DEFAULT 0       NOT NULL,
//day7                                NUMBER(10)       DEFAULT 0       NOT NULL,
//day30                               NUMBER(10)       DEFAULT 0       NOT NULL,
//dayperm                             NUMBER(10)       DEFAULT 0       NOT NULL,
//filmno                              NUMBER(10)       NOT NULL       UNIQUE,
//FOREIGN KEY (filmno) REFERENCES film (filmno)

  private int rentpriceno; /**대여별 가격 번호*/
  private int day1; /**1일*/
  private int day3; /**3일*/
  private int day7; /**7일*/
  private int day30; /**30일*/
  private int dayperm; /**영구 소장*/
  private int filmno; /**영화 번호*/
  
  public int getRentpriceno() {
    return rentpriceno;
  }
  public void setRentpriceno(int rentpriceno) {
    this.rentpriceno = rentpriceno;
  }
  public int getDay1() {
    return day1;
  }
  public void setDay1(int day1) {
    this.day1 = day1;
  }
  public int getDay3() {
    return day3;
  }
  public void setDay3(int day3) {
    this.day3 = day3;
  }
  public int getDay7() {
    return day7;
  }
  public void setDay7(int day7) {
    this.day7 = day7;
  }
  public int getDay30() {
    return day30;
  }
  public void setDay30(int day30) {
    this.day30 = day30;
  }
  public int getDayperm() {
    return dayperm;
  }
  public void setDayperm(int dayperm) {
    this.dayperm = dayperm;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  
  
  
 
  

}
