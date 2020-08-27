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

  @Override
  public ArrayList<Film_Cart_VO> list_cart(int memberno) {
    ArrayList<Film_Cart_VO> list_cart = this.cartDAO.list_cart(memberno);
    return list_cart;
  }

  @Override
  public Film_Cart_VO read(int cartno) {
    Film_Cart_VO film_Cart_VO = this.cartDAO.read(cartno);
    return film_Cart_VO;
  }

  @Override
  public int delete_by_memberno(int memberno) {
    int delete_by_memberno = this.cartDAO.delete_by_memberno(memberno);
    return delete_by_memberno;
  }
  

}
