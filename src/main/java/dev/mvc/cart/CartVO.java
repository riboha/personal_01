package dev.mvc.cart;

public class CartVO {
  
//  cartno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
//  memberno                            NUMBER(10)       NULL ,
//  filmno                              NUMBER(10)       NULL ,
//FOREIGN KEY (memberno) REFERENCES member (memberno),
//FOREIGN KEY (filmno) REFERENCES film (filmno)
  
private int cartno; /**��ٱ��� ��ȣ*/
private int memberno; /**ȸ�� ��ȣ*/
private int filmno; /**��ȭ ��ȣ*/


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



}
