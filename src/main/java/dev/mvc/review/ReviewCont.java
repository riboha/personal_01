package dev.mvc.review;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewCont {
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;
  
  
 
  /**
   * ��� ó��
   * @param reviewVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (ReviewVO reviewVO) {
    
    System.out.println("Controller ����");
    int cnt = this.reviewProc.create(reviewVO);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/review/read.do?dirno=1
   */
  @RequestMapping(value = "/review/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int reviewno) {
    ModelAndView mav = new ModelAndView();
    ReviewVO reviewVO = this.reviewProc.read(reviewno);
    mav.addObject("VO", reviewVO);
    mav.setViewName("/review/read");
    return mav;
  } 
  
  
  /**
   * ��� (�����ڿ�)
   * @return
   *  http://localhost:9090/movie/review/list.do
   */
  @RequestMapping(value = "/review/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();

    
    return mav;
  }
  
  
  /**
   * ��� (�� ��ȸ��)
   * @return
   *  http://localhost:9090/movie/review/list.do
   */
  @RequestMapping(value = "/review/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();

    return mav;
  }
  


  
  /**
   * ���� ó��
   * @param reviewVO
   * @param rereviewt 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (ReviewVO reviewVO) {
    
    int cnt = this.reviewProc.update(reviewVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param reviewVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (int reviewno) {
    int cnt = this.reviewProc.delete(reviewno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();
  }
  
  




}
