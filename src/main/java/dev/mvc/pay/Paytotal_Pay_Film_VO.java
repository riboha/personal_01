package dev.mvc.pay;

public class Paytotal_Pay_Film_VO {
  
  /**PaytotalVO*/
  private int paytotalno; /**�Ѱ��� ��ȣ*/

  
  /**PayVO*/
  private int payno; /**���� ��ȣ*/
  private String optionlan; /**�ɼ� ���*/
  private String optionqual; /**�ɼ� ȭ��*/
  private String optionrent; /**���� �뿩*/
  private String priceoriginal; /**�ɼ� ����*/
  private int pricefinal; /**���� ���� �ݾ�*/
  private int filmno; /**��ȭ ��ȣ*/
  
  
  /**FilmVO*/
  private String titlekr; /**�ѱ� ����*/
  private String titleen; /**���� ����*/
  
  
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
