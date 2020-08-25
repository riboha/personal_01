package dev.mvc.pay;

import java.util.ArrayList;
import java.util.HashMap;

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
    String cartno_list_string = null; // 장바구니 번호 리스트 문자열
    int cartno = 0; // 장바구니 번호 
    int filmno = 0; // 영화 번호
    
    // 선택 결제 OR 전체 결제 확인 → 장바구니 번호 문자열 → 배열로 전환
    if (checkout_select.equals("N")) {
      cartno_list = checkout_select_all.split(",");
      cartno_list_string = checkout_select_all;
    } else if (checkout_select_all.equals("N")) {
      cartno_list = checkout_select.split(",");
      cartno_list_string = checkout_select;
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
    mav.addObject("list", list_cart); // 장바구니 리스트
    mav.addObject("cartno_list_string", cartno_list_string); // 장바구니 번호 배열
    mav.addObject("cartno_count", cartno_list.length); // 장바구니 번호 갯수
    mav.addObject("film_promotion_list", film_promotion_list); // 프로모션 리스트
    mav.addObject("memberVO", memberVO); 
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
  public String create (PayVO payVO) {
    
    System.out.println("Pay Controller 진입");
    int cnt = this.payProc.create(payVO);
    System.out.println("Pay 등록 성공");

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();
  }
  
  
  /**
   * 페이징 목록
   * @return
   *  http://localhost:9090/movie/pay/list_customer.do?memberno=1
   */
  @RequestMapping(value = "/pay/list_customer.do",
                            method = RequestMethod.GET)
  public ModelAndView list_by_memberno (
      int memberno,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("memberno", memberno );
    hashMap.put("nowPage", nowPage );
    
    // 레코드 갯수
    int search_count = this.payProc.list_paging_by_paytotalno_count(hashMap);
    mav.addObject("search_count", search_count);
    
    // 페이징: Paytotal
    ArrayList<PaytotalVO> list_paging_paytotalno = this.payProc.list_paging_paytotalno(hashMap);
    mav.addObject("list_paging_paytotalno", list_paging_paytotalno);
    
    // 목록: Pay + Film
    ArrayList<Paytotal_Pay_Film_VO> list_paging = this.payProc.list_paging(hashMap);
    mav.addObject("list_paging", list_paging);
    
    // 페이징 박스
    String paging = this.payProc.pagingBox("list_customer.do", search_count, memberno, nowPage);
    mav.addObject("paging", paging);
    
    // 현재 페이지 번호
    mav.addObject("nowPage", nowPage); 
    
    mav.setViewName("/pay/list_customer");
    
    return mav;
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
