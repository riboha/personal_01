package dev.mvc.pay;

public class Paytotal_Pay_Film_VO {
  
  /**PaytotalVO*/
  private int paytotalno; /**총결제 번호*/

  
  /**PayVO*/
  private int payno; /**결제 번호*/
  private String optionlan; /**옵션 언어*/
  private String optionqual; /**옵션 화질*/
  private String optionrent; /**결제 대여*/
  private String priceoriginal; /**옵션 가격*/
  private int pricefinal; /**결제 최종 금액*/
  private int filmno; /**영화 번호*/
  
  
  /**FilmVO*/
  private String titlekr; /**한글 제목*/
  private String titleen; /**영문 제목*/
  
  
  public int getPaytotalno() {
    return paytotalno;
  }
  public void setPaytotalno(int paytotalno) {
    this.paytotalno = paytotalno;
  }
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
  public String getOptionrent() {
    return optionrent;
  }
  public void setOptionrent(String optionrent) {
    this.optionrent = optionrent;
  }

  public String getPriceoriginal() {
    return priceoriginal;
  }
  public void setPriceoriginal(String priceoriginal) {
    this.priceoriginal = priceoriginal;
  }
  public int getPricefinal() {
    return pricefinal;
  }
  public void setPricefinal(int pricefinal) {
    this.pricefinal = pricefinal;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  public String getTitlekr() {
    return titlekr;
  }
  public void setTitlekr(String titlekr) {
    this.titlekr = titlekr;
  }
  public String getTitleen() {
    return titleen;
  }
  public void setTitleen(String titleen) {
    this.titleen = titleen;
  }
  
    
  
}
