package dev.mvc.cart;

public class Film_Cart_VO {
  
  private String titlekr; /**�ѱ� ����*/
  private String titleen; /**���� ����*/
  
  private int cartno; /**��ٱ��� ��ȣ*/
  private int memberno; /**ȸ�� ��ȣ*/
  private int filmno; /**��ȭ ��ȣ*/
  private String optionlan; /**�ɼ� ���*/
  private String optionqual; /**�ɼ� ȭ��*/
  private int optionprice; /**�ɼ� ����*/
  private String optionrent; /**�ɼ� �뿩*/
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
  public int getCartno() {
    return cartno;
  }
  public void setCartno(int cartno) {
    this.cartno = cartno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
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
  public int getOptionprice() {
    return optionprice;
  }
  public void setOptionprice(int optionprice) {
    this.optionprice = optionprice;
  }
  public String getOptionrent() {
    return optionrent;
  }
  public void setOptionrent(String optionrent) {
    this.optionrent = optionrent;
  }
  
  


}
