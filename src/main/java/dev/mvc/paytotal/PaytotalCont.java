package dev.mvc.paytotal;

import java.util.ArrayList;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class PaytotalCont {
  
  @Autowired
  @Qualifier ("dev.mvc.paytotal.PaytotalProc")
  private PaytotalProcInter paytotalProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  

  /**
   * 등록 처리
   * @param paytotalVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/paytotal/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (PaytotalVO paytotalVO) {
    
    int paytotalno =0;
    if (this.paytotalProc.create(paytotalVO) == 1 ) {
      paytotalno = paytotalVO.getPaytotalno();
    
      // 멤버 포인트 업데이트
      MemberVO memberVO = new MemberVO();
      memberVO.setMemberno(paytotalVO.getMemberno());
      memberVO.setPnt(paytotalVO.getPntsave() - paytotalVO.getPricetotaldiscpnt());
      this.memberProc.update_pnt(memberVO);
    }
    
    JSONObject json = new JSONObject();
    json.put("paytotalno", paytotalno);
    return json.toString();
  }
  
  
  /**
   * 목록
   * @param paytotalVO
   * @return
   */
  @RequestMapping(value = "/paytotal/list.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<PaytotalVO> list = this.paytotalProc.list();
    mav.addObject("list", list);
    mav.setViewName("/paytotal/list");
    
    return mav;
  }
  
  
  /**
   * 수정 처리
   * @param paytotalVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/paytotal/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String update (PaytotalVO paytotalVO) {
    
    int cnt = this.paytotalProc.update(paytotalVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 삭제 처리
   * @param paytotalVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/paytotal/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int paytotalno) {
    
    int cnt = this.paytotalProc.delete(paytotalno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

}
