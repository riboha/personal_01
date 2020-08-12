package dev.mvc.cart;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cart.CartProc")
public class CartProc implements CartProcInter {

  @Autowired
  private CartDAOInter cartDAO;

  @Override
  public int create(CartVO cartVO) {
    int cnt = this.cartDAO.create(cartVO);
    return cnt;
  }

  @Override
  public ArrayList<CartVO> list(int memberno) {
    ArrayList<CartVO> list = this.cartDAO.list(memberno);
    return list;
  }

  @Override
  public int update(CartVO cartVO) {
    int cnt = this.cartDAO.update(cartVO);
    return cnt;
  }

  @Override
  public int delete(int cartno) {
    int cnt = this.cartDAO.delete(cartno);
    return cnt;
  }
  
  @Override
  public int findduplicate(CartVO cartVO) {
    int duplicate = this.cartDAO.findduplicate(cartVO);
    return duplicate;
  }

}
