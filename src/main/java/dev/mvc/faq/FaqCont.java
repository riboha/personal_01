package dev.mvc.faq;

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
public class FaqCont {
  
  @Autowired
  @Qualifier("dev.mvc.faq.FaqProc")
  private FaqProcInter faqProc;
  
  

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/faq/create.do
   */
  @RequestMapping(value = "/faq/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/create");
    return mav;
  }
  
  
  /**
   * 등록 처리
   * @param faqVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/faq/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (FaqVO faqVO) {
    
    // System.out.println("Controller 진입");
    
    int cnt = this.faqProc.create(faqVO);
    
    // System.out.println("처리 결과 cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/faq/read.do?dirno=1
   */
  @RequestMapping(value = "/faq/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int faqno) {
    ModelAndView mav = new ModelAndView();
    FaqVO faqVO = this.faqProc.read(faqno);
    mav.addObject("faqVO", faqVO);
    mav.setViewName("/faq/read");
    return mav;
  } 
  
  
  /**
   * 목록 (관리자용)
   * @return
   *  http://localhost:9090/movie/faq/list.do
   */
  @RequestMapping(value = "/faq/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<FaqVO> list = this.faqProc.list();
    mav.addObject("list", list);
    mav.setViewName("/faq/list_admin");
    return mav;
  }
  
  
  /**
   * 목록 (고객 조회용)
   * @return
   *  http://localhost:9090/movie/faq/list.do
   */
  @RequestMapping(value = "/faq/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();
    ArrayList<FaqVO> list = this.faqProc.list();
    mav.addObject("list", list);
    mav.setViewName("/faq/list_");
    return mav;
  }
  


  /**
   * 수정 폼
   * @return
   *  http://localhost:9090/movie/faq/update.do
   */
  @RequestMapping(value = "/faq/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int faqno) {
    ModelAndView mav = new ModelAndView();
    FaqVO faqVO = this.faqProc.read(faqno);
    mav.addObject("faqVO", faqVO);
    mav.setViewName("/faq/update");
    return mav;
  }
  
  /**
   * 수정 처리
   * @param faqVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/faq/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (FaqVO faqVO) {
    
    int cnt = this.faqProc.update(faqVO);
    // System.out.println("처리 결과: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 삭제 처리
   * @param faqVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/faq/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int faqno) {
    System.out.println("Controller 진입");
    int cnt = this.faqProc.delete(faqno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("처리 결과 cnt: " + cnt);
    return json.toString();
  }
  
  




}
