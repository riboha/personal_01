package dev.mvc.ques;

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
public class QuesCont {
  
  @Autowired
  @Qualifier("dev.mvc.ques.QuesProc")
  private QuesProcInter quesProc;
  
  

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/ques/create.do
   */
  @RequestMapping(value = "/ques/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ques/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param quesVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/ques/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (QuesVO quesVO) {
    
    // System.out.println("Controller ����");
    
    int cnt = this.quesProc.create(quesVO);
    
    // System.out.println("ó�� ��� cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/ques/read.do?dirno=1
   */
  @RequestMapping(value = "/ques/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int quesno) {
    ModelAndView mav = new ModelAndView();
    QuesVO quesVO = this.quesProc.read(quesno);
    mav.addObject("quesVO", quesVO);
    mav.setViewName("/ques/read");
    return mav;
  } 
  
  
  /**
   * ��� (�����ڿ�)
   * @return
   *  http://localhost:9090/movie/ques/list.do
   */
  @RequestMapping(value = "/ques/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<QuesVO> list = this.quesProc.list();
    mav.addObject("list", list);
    mav.setViewName("/ques/list_admin");
    return mav;
  }
  
  
  /**
   * ��� (�� ��ȸ��)
   * @return
   *  http://localhost:9090/movie/ques/list.do
   */
  @RequestMapping(value = "/ques/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();
    ArrayList<QuesVO> list = this.quesProc.list();
    mav.addObject("list", list);
    mav.setViewName("/ques/list_");
    return mav;
  }
  


  /**
   * ���� ��
   * @return
   *  http://localhost:9090/movie/ques/update.do
   */
  @RequestMapping(value = "/ques/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int quesno) {
    ModelAndView mav = new ModelAndView();
    QuesVO quesVO = this.quesProc.read(quesno);
    mav.addObject("quesVO", quesVO);
    mav.setViewName("/ques/update");
    return mav;
  }
  
  /**
   * ���� ó��
   * @param quesVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/ques/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (QuesVO quesVO) {
    
    int cnt = this.quesProc.update(quesVO);
    // System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param quesVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/ques/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int quesno) {
    System.out.println("Controller ����");
    int cnt = this.quesProc.delete(quesno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  




}
