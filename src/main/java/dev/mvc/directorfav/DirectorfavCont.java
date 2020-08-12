package dev.mvc.directorfav;

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
public class DirectorfavCont {
  
  @Autowired
  @Qualifier("dev.mvc.directorfav.DirectorfavProc")
  private DirectorfavProcInter directorfavProc;
  
  /**
   * 殿废 贸府
   * @param directorfavVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/directorfav/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (DirectorfavVO directorfavVO) {
    
    int cnt = 0;
    int duplicate = this.directorfavProc.findduplicate(directorfavVO);
    
    if (duplicate == 0) {
      cnt = this.directorfavProc.create(directorfavVO);
    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("duplicate", duplicate);
    
    return json.toString();
  }
  

  /**
   * 格废
   * @return
   *  http://localhost:9090/movie/directorfav/list.do
   */
  @RequestMapping(value = "/directorfav/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<DirectorfavVO> list = this.directorfavProc.list();
    mav.addObject("list", list);
    mav.setViewName("/directorfav/list");
    return mav;
  }
  
  
  /**
   * 昏力 贸府
   * @param directorfavVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/directorfav/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int dirfavno) {
    
    int cnt = this.directorfavProc.delete(dirfavno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  
  


}
