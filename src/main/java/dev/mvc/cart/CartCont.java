package dev.mvc.cart;

import java.util.ArrayList;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartCont {
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/cart/create.do
   */
  @RequestMapping(value = "/cart/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param cartVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (CartVO cartVO) {
    
    System.out.println("Controller ����");
    System.out.println("Filmno" + cartVO.getFilmno() );
    System.out.println("Memberno" + cartVO.getMemberno() );
    System.out.println("optionlan" + cartVO.getOptionlan() );
    
    int cnt = 0;
    int duplicate = this.cartProc.findduplicate(cartVO);
    
    if (duplicate == 0) {
      cnt = this.cartProc.create(cartVO);
    }
    
    System.out.println("ó�� ��� duplicate: " + duplicate);
    System.out.println("ó�� ��� cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("duplicate", duplicate);
    
    return json.toString();
  }
  


  
  
  /**
   * ���
   * @return
   *  http://localhost:9090/movie/cart/list.do?memberno=1
   */
  @RequestMapping(value = "/cart/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list (int memberno) {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<Film_Cart_VO> list_cart = this.cartProc.list_cart(memberno);
    mav.addObject("list", list_cart);
    mav.setViewName("/cart/list");
    return mav;
  }
  
  
  
  /**
   * ���� ó��
   * @param cartVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (CartVO cartVO) {
    
    int cnt = this.cartProc.update(cartVO);
    // System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param cartVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int cartno) {
    int cnt = this.cartProc.delete(cartno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();
  }
  
  




}
