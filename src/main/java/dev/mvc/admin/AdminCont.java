package dev.mvc.admin;

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
public class AdminCont {
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/admin/create.do
   */
  @RequestMapping(value = "/admin/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/admin/create");
    return mav;
  }
  
  /**
   * 등록 처리
   * @param adminVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/admin/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create ( AdminVO adminVO) {
    int cnt = this.adminProc.create(adminVO);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/admin/read.do?dirno=1
   */
  @RequestMapping(value = "/admin/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int adminno) {
    ModelAndView mav = new ModelAndView();
    AdminVO adminVO = this.adminProc.read(adminno);
    mav.addObject("VO", adminVO);
    mav.setViewName("/admin/read");
    return mav;
  } 
  
  /**
   * 목록 (관리자용)
   * @return
   *  http://localhost:9090/movie/admin/list.do
   */
  @RequestMapping(value = "/admin/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<AdminVO> list = this.adminProc.list();
    mav.addObject("list", list);
    mav.setViewName("/admin/list_admin");
    return mav;
  }
  
  /**
   * 목록 (고객 조회용)
   * @return
   *  http://localhost:9090/movie/admin/list.do
   */
  @RequestMapping(value = "/admin/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();
    ArrayList<AdminVO> list = this.adminProc.list();
    mav.addObject("list", list);
    mav.setViewName("/admin/list_");
    return mav;
  }
  
  /**
   * 수정 처리
   * @param adminVO
   * @param readmint 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/admin/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (AdminVO adminVO) {
    
    int cnt = this.adminProc.update(adminVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  /**
   * 삭제 처리
   * @param adminVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/admin/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (int adminno) {
    int cnt = this.adminProc.delete(adminno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();
  }
  


}
