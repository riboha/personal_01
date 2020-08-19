package dev.mvc.pay;

public class Paytotal_Pay_Film_VO {
  
  /**PaytotalVO*/
  private int paytotalno; /**총결제 번호*/
  private int pricetotaldiscpromo; /**총결제 프로모션 할인 금액*/
  private int pricetotaldiscpnt; /**총결제 포인트 할인 금액*/
  private int pricetotaloriginal; /**총결제 원 금액*/
  private int pricetotalfinal; /**총결제 최종 금액*/
  private int pntsave; /**총결제 적립 포인트*/

  private int method; /**결제 방식*/
  private String paytotaldate; /**결제 일자*/
  
  
  /**PayVO*/
  private int payno; /**결제 번호*/

  private String optionlan; /**옵션 언어*/
  private String optionqual; /**옵션 화질*/
  private String optionrent; /**결제 대여*/
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
  public int getPricetotaldiscpromo() {
    return pricetotaldiscpromo;
  }
  public void setPricetotaldiscpromo(int pricetotaldiscpromo) {
    this.pricetotaldiscpromo = pricetotaldiscpromo;
  }
  public int getPricetotaldiscpnt() {
    return pricetotaldiscpnt;
  }
  public void setPricetotaldiscpnt(int pricetotaldiscpnt) {
    this.pricetotaldiscpnt = pricetotaldiscpnt;
  }
  public int getPricetotaloriginal() {
    return pricetotaloriginal;
  }
  public void setPricetotaloriginal(int pricetotaloriginal) {
    this.pricetotaloriginal = pricetotaloriginal;
  }
  public int getPricetotalfinal() {
    return pricetotalfinal;
  }
  public void setPricetotalfinal(int pricetotalfinal) {
    this.pricetotalfinal = pricetotalfinal;
  }
  public int getPntsave() {
    return pntsave;
  }
  public void setPntsave(int pntsave) {
    this.pntsave = pntsave;
  }
  public int getMethod() {
    return method;
  }
  public void setMethod(int method) {
    this.method = method;
  }
  public String getPaytotaldate() {
    return paytotaldate;
  }
  public void setPaytotaldate(String paytotaldate) {
    this.paytotaldate = paytotaldate;
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
