package dev.mvc.cart;

public class CartVO {
  
  //cartno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
  //optionlan                           VARCHAR2(10)         NOT NULL,
  //optionqual                          VARCHAR2(10)         NOT NULL,
  //optionprice                         NUMBER(10)       NOT NULL,
  //optionrent                          VARCHAR2(10)         NOT NULL,
  //memberno                            NUMBER(10)       NULL ,
  //filmno                              NUMBER(10)       NULL ,
    
  //FOREIGN KEY (memberno) REFERENCES member (memberno),
  //FOREIGN KEY (filmno) REFERENCES film (filmno)
    
    
  private int cartno; /**장바구니 번호*/
  private String optionlan; /**옵션 언어*/
  private String optionqual; /**옵션 화질*/
  private String optionrent; /**옵션 이용권*/
  private int optionprice; /**옵션 가격*/
  private int memberno; /**회원 번호*/
  private int filmno; /**영화 번호*/
  public int getCartno() {
    return cartno;
  }
  public void setCartno(int cartno) {
    this.cartno = cartno;
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
  public int getOptionprice() {
    return optionprice;
  }
  public void setOptionprice(int optionprice) {
    this.optionprice = optionprice;
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

  





}
