package dev.mvc.qcate;

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
public class QcateCont {
  
  @Autowired
  @Qualifier("dev.mvc.qcate.QcateProc")
  private QcateProcInter qcateProc;
  
  

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/qcate/create.do
   */
  @RequestMapping(value = "/qcate/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qcate/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param qcateVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/qcate/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (QcateVO qcateVO) {
    
    // System.out.println("Controller ����");
    
    int cnt = this.qcateProc.create(qcateVO);
    
    // System.out.println("ó�� ��� cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/qcate/read.do?dirno=1
   */
  @RequestMapping(value = "/qcate/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int qcateno) {
    ModelAndView mav = new ModelAndView();
    QcateVO qcateVO = this.qcateProc.read(qcateno);
    mav.addObject("qcateVO", qcateVO);
    mav.setViewName("/qcate/read");
    return mav;
  } 
  
  
  /**
   * ��� (�����ڿ�)
   * @return
   *  http://localhost:9090/movie/qcate/list.do
   */
  @RequestMapping(value = "/qcate/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<QcateVO> list = this.qcateProc.list();
    mav.addObject("list", list);
    mav.setViewName("/qcate/list_admin");
    return mav;
  }
  
  
  /**
   * ��� (�� ��ȸ��)
   * @return
   *  http://localhost:9090/movie/qcate/list.do
   */
  @RequestMapping(value = "/qcate/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();
    ArrayList<QcateVO> list = this.qcateProc.list();
    mav.addObject("list", list);
    mav.setViewName("/qcate/list_");
    return mav;
  }
  


  /**
   * ���� ��
   * @return
   *  http://localhost:9090/movie/qcate/update.do
   */
  @RequestMapping(value = "/qcate/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int qcateno) {
    ModelAndView mav = new ModelAndView();
    QcateVO qcateVO = this.qcateProc.read(qcateno);
    mav.addObject("qcateVO", qcateVO);
    mav.setViewName("/qcate/update");
    return mav;
  }
  
  /**
   * ���� ó��
   * @param qcateVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/qcate/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (QcateVO qcateVO) {
    
    int cnt = this.qcateProc.update(qcateVO);
    // System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param qcateVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/qcate/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int qcateno) {
    System.out.println("Controller ����");
    int cnt = this.qcateProc.delete(qcateno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  




}
