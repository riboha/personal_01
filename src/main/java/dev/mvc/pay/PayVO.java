package dev.mvc.pay;

public class PayVO {
  
//  payno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
//  optionlan                           VARCHAR2(10)         NOT NULL,
//  optionqual                          VARCHAR2(10)         NOT NULL,
//  optionprice                         NUMBER(10)       NOT NULL,
//  optionrent                          VARCHAR2(10)         NOT NULL,
//  priceoriginal                       NUMBER(10)       NOT NULL,
//  pricediscount                       NUMBER(10)       DEFAULT 0       NOT NULL, 
//  pricefinal                          NUMBER(10)       NOT NULL,
//  payvalid                            NUMBER(1)        DEFAULT 1       NOT NULL,
//  memberno                            NUMBER(10)       NOT NULL,
//  paytotalno                          NUMBER(10)       NOT NULL,
//  promono                             NUMBER(10)       DEFAULT 0       NOT NULL,
//  filmno                              NUMBER(10)       NOT NULL,
//  FOREIGN KEY (memberno) REFERENCES member (memberno),
//  FOREIGN KEY (paytotalno) REFERENCES paytotal (paytotalno),
//  FOREIGN KEY (promono) REFERENCES promotion (promono),
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

  private int payno; /**결제 번호*/
  
  private String optionlan; /**옵션 언어*/
  private String optionqual; /**옵션 화질*/
  private String optionprice; /**옵션 가격*/
  private String optionrent; /**결제 대여*/
  
  private int priceoriginal; /**결제 원 금액*/
  private int pricediscount; /**결제 할인 금액*/
  private int pricefinal; /**결제 최종 금액*/

  private int payvalid; /**결제 상품 유효 여부*/

  private int memberno; /**회원 번호*/
  private int paytotalno; /**총결제 번호*/
  private int promono; /**프로모션 번호*/
  private int filmno; /**영화 번호*/
  
  public int getPayno() {
    return payno;
  }
  public void setPayno(int payno) {
    this.payno = payno;
  }
  public String getOptionlan() {
    return optionlan;
  }
  public void setOptionlan(String optionlan) {
    this.optionlan = optionlan;
  }
  public String getOptionqual() {
    return optionqual;
  }
  public void setOptionqual(String optionqual) {
    this.optionqual = optionqual;
  }
  public String getOptionprice() {
    return optionprice;
  }
  public void setOptionprice(String optionprice) {
    this.optionprice = optionprice;
  }
  public String getOptionrent() {
    return optionrent;
  }
  public void setOptionrent(String optionrent) {
    this.optionrent = optionrent;
  }
  public int getPriceoriginal() {
    return priceoriginal;
  }
  public void setPriceoriginal(int priceoriginal) {
    this.priceoriginal = priceoriginal;
  }
  public int getPricediscount() {
    return pricediscount;
  }
  public void setPricediscount(int pricediscount) {
    this.pricediscount = pricediscount;
  }
  public int getPricefinal() {
    return pricefinal;
  }
  public void setPricefinal(int pricefinal) {
    this.pricefinal = pricefinal;
  }
  public int getPayvalid() {
    return payvalid;
  }
  public void setPayvalid(int payvalid) {
    this.payvalid = payvalid;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getPaytotalno() {
    return paytotalno;
  }
  public void setPaytotalno(int paytotalno) {
    this.paytotalno = paytotalno;
  }
  public int getPromono() {
    return promono;
  }
  public void setPromono(int promono) {
    this.promono = promono;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  
    
  
}
