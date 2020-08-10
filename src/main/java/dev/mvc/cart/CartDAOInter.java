package dev.mvc.cart;

import java.util.ArrayList;

public interface CartDAOInter {
  
  public int create (CartVO cartVO);
  
  public ArrayList<CartVO> list (int memberno);
  
  public int update (CartVO cartVO);
  
  public int delete (int cartno);

}
