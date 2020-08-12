package dev.mvc.cast;

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
public class CastCont {
  
  @Autowired
  @Qualifier("dev.mvc.cast.CastProc")
  private CastProcInter castProc;
  
  
  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/cast/create.do
   */
  @RequestMapping(value = "/cast/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cast/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param castVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cast/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (CastVO castVO) {
    
    int cnt = this.castProc.create(castVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/cast/read.do?dirno=1
   */
  @RequestMapping(value = "/cast/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int castno) {
    ModelAndView mav = new ModelAndView();
    CastVO castVO = this.castProc.read(castno);
    mav.addObject("castVO", castVO);
    mav.setViewName("/cast/read");
    return mav;
  } 
  
  
  /**
   * ��� (���θ�ǹ�ȣ ��)
   * @return
   *  http://localhost:9090/movie/cast/list.do
   */
  @RequestMapping(value = "/cast/list_by_promono.do",
                            method = RequestMethod.GET)
  public ModelAndView list_by_filmno (int filmno) {
    ModelAndView mav = new ModelAndView();
    ArrayList<Film_Actor_VO> list = this.castProc.cast_list_by_filmno(filmno);
    mav.addObject("list", list);
    mav.setViewName("/cast/list");
    return mav;
  }
  


  /**
   * ���� ��
   * @return
   *  http://localhost:9090/movie/cast/update.do
   */
  @RequestMapping(value = "/cast/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int castno) {
    ModelAndView mav = new ModelAndView();
    CastVO castVO = this.castProc.read(castno);
    mav.addObject("castVO", castVO);
    mav.setViewName("/cast/update");
    return mav;
  }
  
  /**
   * ���� ó��
   * @param castVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cast/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (CastVO castVO) {
    
    
    int cnt = this.castProc.update(castVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param castVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cast/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int castno) {
    
    int cnt = this.castProc.delete(castno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  

}
