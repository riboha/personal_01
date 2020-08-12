package dev.mvc.actorfav;

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
public class ActorfavCont {
  
  @Autowired
  @Qualifier("dev.mvc.actorfav.ActorfavProc")
  private ActorfavProcInter actorfavProc;
  
  /**
   * 殿废 贸府
   * @param actorfavVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actorfav/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (ActorfavVO actorfavVO) {
    
    int cnt = 0;
    int duplicate = this.actorfavProc.findduplicate(actorfavVO);
    
    if (duplicate == 0) {
      cnt = this.actorfavProc.create(actorfavVO);
    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("duplicate", duplicate);
    
    return json.toString();
  }
  

  /**
   * 格废
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
   * 昏力 贸府
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
