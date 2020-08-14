package dev.mvc.cart;

public class Film_Cart_VO {
  
  private String titlekr; /**한글 제목*/
  private String titleen; /**영문 제목*/
  
  private int cartno; /**장바구니 번호*/
  private int memberno; /**회원 번호*/
  private int filmno; /**영화 번호*/
  private String optionlan; /**옵션 언어*/
  private String optionqual; /**옵션 화질*/
  private int optionprice; /**옵션 가격*/
  private String optionrent; /**옵션 대여*/
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
