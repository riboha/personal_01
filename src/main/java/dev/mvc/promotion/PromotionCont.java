package dev.mvc.promotion;

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
public class PromotionCont {
  
  @Autowired
  @Qualifier("dev.mvc.promotion.PromotionProc")
  private PromotionProcInter promotionProc;
  

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/promotion/create.do
   */
  @RequestMapping(value = "/promotion/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/promotion/create");
    return mav;
  }
  
  
  
  /**
   * 등록 처리
   * @param promotionVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/promotion/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (PromotionVO promotionVO) {
    
    System.out.println("Controller 진입");
    
    int cnt = this.promotionProc.create(promotionVO);
    
    System.out.println("처리 결과 cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/promotion/read.do?dirno=1
   */
  @RequestMapping(value = "/promotion/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int promono) {
    ModelAndView mav = new ModelAndView();
    PromotionVO promotionVO = this.promotionProc.read(promono);
    mav.addObject("VO", promotionVO);
    mav.setViewName("/promotion/read");
    return mav;
  } 
  
  
  
  /**
   * 목록
   * @return
   *  http://localhost:9090/movie/promotion/list.do
   */
  @RequestMapping(value = "/promotion/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<PromotionVO> list = this.promotionProc.list();
    mav.addObject("list", list);
    mav.setViewName("/promotion/list_admin");
    return mav;
  }
  


  
  /**
   * 수정 처리
   * @param promotionVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/promotion/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (PromotionVO promotionVO) {
    
    
    int cnt = this.promotionProc.update(promotionVO);
    System.out.println("처리 결과: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 삭제 처리
   * @param promotionVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/promotion/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int promono) {
    
    int cnt = this.promotionProc.delete(promono);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

}
