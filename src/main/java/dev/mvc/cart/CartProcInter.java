package dev.mvc.cart;

import java.util.ArrayList;

public interface CartProcInter {
  
  public int create (CartVO cartVO);
  
  public ArrayList<CartVO> list (int memberno);
  
  public int update (CartVO cartVO);
  
  public int delete (int cartno);
  
  public int delete_by_memberno (int memberno);

  public ArrayList<Film_Cart_VO> list_cart (int memberno);
  
  public Film_Cart_VO read(int cartno);
  
  public int findduplicate (CartVO cartVO);

}
