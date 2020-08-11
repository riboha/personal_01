package dev.mvc.notice;

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
public class NoticeCont {
  
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc;
  
  

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/notice/create.do
   */
  @RequestMapping(value = "/notice/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param noticeVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/notice/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create ( NoticeVO noticeVO) {
    int cnt = this.noticeProc.create(noticeVO);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/notice/read.do?dirno=1
   */
  @RequestMapping(value = "/notice/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int noticeno) {
    ModelAndView mav = new ModelAndView();
    NoticeVO noticeVO = this.noticeProc.read(noticeno);
    mav.addObject("VO", noticeVO);
    mav.setViewName("/notice/read");
    return mav;
  } 
  
  
  /**
   * ��� (�����ڿ�)
   * @return
   *  http://localhost:9090/movie/notice/list.do
   */
  @RequestMapping(value = "/notice/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<NoticeVO> list = this.noticeProc.list();
    mav.addObject("list", list);
    mav.setViewName("/notice/list_admin");
    return mav;
  }
  
  
  /**
   * ��� (�� ��ȸ��)
   * @return
   *  http://localhost:9090/movie/notice/list.do
   */
  @RequestMapping(value = "/notice/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();
    ArrayList<NoticeVO> list = this.noticeProc.list();
    mav.addObject("list", list);
    mav.setViewName("/notice/list_");
    return mav;
  }
  


  
  /**
   * ���� ó��
   * @param noticeVO
   * @param renoticet 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/notice/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (NoticeVO noticeVO) {
    
    int cnt = this.noticeProc.update(noticeVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param noticeVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/notice/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (int noticeno) {
    System.out.println("Controller ����");
    int cnt = this.noticeProc.delete(noticeno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  




}
