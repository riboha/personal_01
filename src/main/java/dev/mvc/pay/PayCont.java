package dev.mvc.pay;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartProcInter;
import dev.mvc.cart.Film_Cart_VO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.paytotal.PaytotalProcInter;
import dev.mvc.paytotal.PaytotalVO;
import dev.mvc.promofilm.Film_Promotion_VO;
import dev.mvc.promofilm.PromofilmProcInter;

@Controller
public class PayCont {
  
  @Autowired
  @Qualifier ("dev.mvc.pay.PayProc")
  private PayProcInter payProc;
  
  @Autowired
  @Qualifier ("dev.mvc.paytotal.PaytotalProc")
  private PaytotalProcInter paytotalProc;
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.promofilm.PromofilmProc")
  private PromofilmProcInter promofilmProc;
  

  /**
   * 결제창 (등록 폼)
   * @param checkout_select
   * @param checkout_select_all
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/pay/payment_page.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public ModelAndView list ( 
      @RequestParam(value="checkout_select", defaultValue="N")  String checkout_select, 
      @RequestParam(value="checkout_select_all", defaultValue="N")  String checkout_select_all, 
      int memberno) {
    
    ArrayList<Film_Cart_VO> list_cart = new ArrayList<>(); // 장바구니 배열 리스트 선언
    MemberVO memberVO = this.memberProc.read(memberno); // 회원 정보
    ArrayList<Film_Promotion_VO> film_promotion_list = new ArrayList<>(); // 영화 프로모션 배열 리스트 선언
    
    String[] cartno_list = null; // 장바구니 번호 리스트 선언
    int cartno = 0; // 장바구니 번호 
    int filmno = 0; // 영화 번호
    
    // 선택 결제 OR 전체 결제 확인 → 장바구니 번호 문자열 → 배열로 전환
    if (checkout_select.equals("N")) {
      cartno_list = checkout_select_all.split(",");
    } else if (checkout_select_all.equals("N")) {
      cartno_list = checkout_select.split(",");
    }
    
    Film_Cart_VO film_cart_VO = new Film_Cart_VO();
    
    // 장바구니 번호 배열 순환
    // 장바구니 읽어오기 → 장바구니 배열 리스트 저장
    for (int i=0; i<cartno_list.length; i++) {
      
      cartno = Integer.parseInt(cartno_list[i]); // 장바구니 번호
      film_cart_VO = this.cartProc.read(cartno); // 장바구니 객체 읽어오기
      list_cart.add(film_cart_VO); // 읽어온 장바구니 객체 배열에 추가
      
      filmno = film_cart_VO.getFilmno(); // 영화 번호
      film_promotion_list.addAll(this.promofilmProc.promotion_list_by_filmno(filmno));
    }
    
    ModelAndView mav = new ModelAndView();
    mav.addObject("list", list_cart);
    mav.addObject("memberVO", memberVO);
    mav.addObject("film_promotion_list", film_promotion_list);
    mav.setViewName("/pay/payment_page");
    
    return mav;
  }
  
  

  /**
   * 등록 처리
   * @param payVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/pay/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (
      @RequestParam(value="checkout_select[]") List<Integer>cartno_list,
      int memberno) {
    
    System.out.println("Controller 진입");
    System.out.println("cartno_list: " + cartno_list);
    
    PaytotalVO paytotalVO = new PaytotalVO();
    PayVO payVO = new PayVO();
    Film_Cart_VO film_cart_VO = new Film_Cart_VO();
    paytotalVO.setMemberno(memberno);
    int paytotalno= 0;
    int pay_cnt = 0;
    int cartno = 0;
    
    if (this.paytotalProc.create(paytotalVO) == 1) { // paytotalVO 생성
      paytotalno= paytotalVO.getPaytotalno();
      for (int i=0; i<cartno_list.size(); i ++) {
        cartno = cartno_list.get(i);
        film_cart_VO = this.cartProc.read(cartno);
        String optionlan = film_cart_VO.getOptionlan();
        String optionqual = film_cart_VO.getOptionqual();
        int optionprice = film_cart_VO.getOptionprice();
        
        
      }
      }
    
    JSONObject json = new JSONObject();
    json.put("pay_cnt", pay_cnt);
    return json.toString();
  }
  
  
  
  /**
   * 수정 처리
   * @param payVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/pay/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String update (PayVO payVO) {
    
    int cnt = this.payProc.update(payVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 삭제 처리
   * @param payVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/pay/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int payno) {
    
    int cnt = this.payProc.delete(payno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

}
