package dev.mvc.award;

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
public class AwardCont {
  @Autowired
  @Qualifier("dev.mvc.award.AwardProc")
  private AwardProcInter awardProc;
  
  

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/award/create.do
   */
  @RequestMapping(value = "/award/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/award/create");
    return mav;
  }
  
  
  /**
   * 등록 처리
   * @param awardVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/award/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (AwardVO awardVO) {
    
    // System.out.println("Controller 진입");
    
    int cnt = this.awardProc.create(awardVO);
    
    // System.out.println("처리 결과 cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/award/read.do?dirno=1
   */
  @RequestMapping(value = "/award/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int awardno) {
    ModelAndView mav = new ModelAndView();
    AwardVO awardVO = this.awardProc.read(awardno);
    mav.addObject("awardVO", awardVO);
    mav.setViewName("/award/read");
    return mav;
  } 
  
  
  /**
   * 목록
   * @return
   *  http://localhost:9090/movie/award/list.do
   */
  @RequestMapping(value = "/award/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<AwardVO> list = this.awardProc.list();
    mav.addObject("list", list);
    mav.setViewName("/award/list");
    return mav;
  }
  


  /**
   * 수정 폼
   * @return
   *  http://localhost:9090/movie/award/update.do
   */
  @RequestMapping(value = "/award/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int awardno) {
    ModelAndView mav = new ModelAndView();
    AwardVO awardVO = this.awardProc.read(awardno);
    mav.addObject("awardVO", awardVO);
    mav.setViewName("/award/update");
    return mav;
  }
  
  /**
   * 수정 처리
   * @param awardVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/award/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (AwardVO awardVO) {
    
    int cnt = this.awardProc.update(awardVO);
    // System.out.println("처리 결과: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 삭제 처리
   * @param awardVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/award/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int awardno) {
    System.out.println("Controller 진입");
    int cnt = this.awardProc.delete(awardno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("처리 결과 cnt: " + cnt);
    return json.toString();
  }
  
  

  
  

}
