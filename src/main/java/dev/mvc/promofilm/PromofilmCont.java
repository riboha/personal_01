package dev.mvc.promofilm;

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
public class PromofilmCont {
  
  @Autowired
  @Qualifier("dev.mvc.promofilm.PromofilmProc")
  private PromofilmProcInter promofilmProc;
  

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/promofilm/create.do
   */
  @RequestMapping(value = "/promofilm/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/promofilm/create");
    return mav;
  }
  
  
  /**
   * 등록 처리
   * @param promofilmVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/promofilm/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (PromofilmVO promofilmVO) {
    
    System.out.println("Controller 진입");
    
    int cnt = this.promofilmProc.create(promofilmVO);
    
    System.out.println("처리 결과 cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/promofilm/read.do?dirno=1
   */
  @RequestMapping(value = "/promofilm/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int promofilmno) {
    ModelAndView mav = new ModelAndView();
    PromofilmVO promofilmVO = this.promofilmProc.read(promofilmno);
    mav.addObject("promofilmVO", promofilmVO);
    mav.setViewName("/promofilm/read");
    return mav;
  } 
  
  /**
   * 목록
   * @return
   *  http://localhost:9090/movie/promofilm/list.do
   */
  @RequestMapping(value = "/promofilm/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<PromofilmVO> list = this.promofilmProc.list();
    mav.addObject("list", list);
    mav.setViewName("/promofilm/list");
    return mav;
  }
  


  /**
   * 수정 폼
   * @return
   *  http://localhost:9090/movie/promofilm/update.do
   */
  @RequestMapping(value = "/promofilm/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int promofilmno) {
    ModelAndView mav = new ModelAndView();
    PromofilmVO promofilmVO = this.promofilmProc.read(promofilmno);
    mav.addObject("promofilmVO", promofilmVO);
    mav.setViewName("/promofilm/update");
    return mav;
  }
  
  /**
   * 수정 처리
   * @param promofilmVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/promofilm/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (PromofilmVO promofilmVO) {
    
    
    int cnt = this.promofilmProc.update(promofilmVO);
    System.out.println("처리 결과: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 삭제 처리
   * @param promofilmVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/promofilm/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int promofilmno) {
    
    int cnt = this.promofilmProc.delete(promofilmno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  
  

}
