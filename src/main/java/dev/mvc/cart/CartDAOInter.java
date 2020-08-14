package dev.mvc.cart;

import java.util.ArrayList;

public interface CartDAOInter {
  
  public int create (CartVO cartVO);
  
  public ArrayList<CartVO> list (int memberno);
  
  public int update (CartVO cartVO);
  
  public int delete (int cartno);

  public ArrayList<Film_Cart_VO> list_cart (int memberno);
  
  public int count_cart(int memberno);
  
  public int findduplicate (CartVO cartVO);

}
