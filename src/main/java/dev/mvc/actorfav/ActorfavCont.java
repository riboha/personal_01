package dev.mvc.actorfav;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ActorfavCont {
  
  @Autowired
  @Qualifier("dev.mvc.actorfav.ActorfavProc")
  private ActorfavProcInter actorfavProc;
  
  /**
   * ��� ó��
   * @param actorfavVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actorfav/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpSession session, ActorfavVO actorfavVO) {

    JSONObject json = new JSONObject();

    int cnt = 0;
    int needsignin = 0;
    int duplicate = 0;
    
    if (session.getAttribute("memberno") != null) { // �α��� ���� Ȯ��
      needsignin = 1;
      json.put("needsignin", needsignin);
      System.out.println("�α��� ���� Ȯ��: " + (int)session.getAttribute("memberno"));

      actorfavVO.setMemberno((int)session.getAttribute("memberno"));
      
      duplicate = this.actorfavProc.findduplicate(actorfavVO);
      System.out.println("�ߺ� ���ڵ� ����: " + duplicate);
      if (duplicate == 0) {
        cnt = this.actorfavProc.create(actorfavVO);
      } 
    }
    System.out.println("�α��� X");
    
    json.put("cnt", cnt);
    json.put("duplicate", duplicate);
    
    //System.out.println("needsignin " +needsignin );
    //System.out.println("duplicate " +duplicate );
    System.out.println("cnt " +cnt );
    
    return json.toString();
  }
  

  /**
   * ���
   * @return
   *  http://localhost:9090/movie/actorfav/list.do
   */
  @RequestMapping(value = "/actorfav/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<ActorfavVO> list = this.actorfavProc.list();
    mav.addObject("list", list);
    mav.setViewName("/actorfav/list");
    return mav;
  }
  
  
  /**
   * ���� ó��
   * @param actorfavVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actorfav/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int actorfavno) {
    
    int cnt = this.actorfavProc.delete(actorfavno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  
  


}
