package dev.mvc.keyword;

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
public class KeywordCont {
  
  @Autowired
  @Qualifier("dev.mvc.keyword.KeywordProc")
  private KeywordProcInter keywordProc;
  
  

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/keyword/create.do
   */
  @RequestMapping(value = "/keyword/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/keyword/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param keywordVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/keyword/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (KeywordVO keywordVO) {
    
    // System.out.println("Controller ����");
    
    int cnt = this.keywordProc.create(keywordVO);
    
    // System.out.println("ó�� ��� cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/keyword/read.do?dirno=1
   */
  @RequestMapping(value = "/keyword/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int keywordno) {
    ModelAndView mav = new ModelAndView();
    KeywordVO keywordVO = this.keywordProc.read(keywordno);
    mav.addObject("keywordVO", keywordVO);
    mav.setViewName("/keyword/read");
    return mav;
  } 
  
  /**
   * ���
   * @return
   *  http://localhost:9090/movie/keyword/list.do
   */
  @RequestMapping(value = "/keyword/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<KeywordVO> list = this.keywordProc.list();
    mav.addObject("list", list);
    mav.setViewName("/keyword/list");
    return mav;
  }
  


  /**
   * ���� ��
   * @return
   *  http://localhost:9090/movie/keyword/update.do
   */
  @RequestMapping(value = "/keyword/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int keywordno) {
    ModelAndView mav = new ModelAndView();
    KeywordVO keywordVO = this.keywordProc.read(keywordno);
    mav.addObject("keywordVO", keywordVO);
    mav.setViewName("/keyword/update");
    return mav;
  }
  
  /**
   * ���� ó��
   * @param keywordVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/keyword/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (KeywordVO keywordVO) {
    
    int cnt = this.keywordProc.update(keywordVO);
    // System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param keywordVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/keyword/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int keywordno) {
    System.out.println("Controller ����");
    int cnt = this.keywordProc.delete(keywordno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  




}
