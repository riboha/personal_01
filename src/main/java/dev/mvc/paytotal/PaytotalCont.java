package dev.mvc.paytotal;

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
public class PaytotalCont {
  
  @Autowired
  @Qualifier ("dev.mvc.paytotal.PaytotalProc")
  private PaytotalProcInter paytotalProc;
  

  /**
   * 殿废 贸府
   * @param paytotalVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/paytotal/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (PaytotalVO paytotalVO) {
    
    int cnt = this.paytotalProc.create(paytotalVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 格废
   * @param paytotalVO
   * @return
   */
  @RequestMapping(value = "/paytotal/list.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<PaytotalVO> list = this.paytotalProc.list();
    mav.addObject("list", list);
    mav.setViewName("/paytotal/list");
    
    return mav;
  }
  
  
  /**
   * 荐沥 贸府
   * @param paytotalVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/paytotal/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String update (PaytotalVO paytotalVO) {
    
    int cnt = this.paytotalProc.update(paytotalVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 昏力 贸府
   * @param paytotalVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/paytotal/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int paytotalno) {
    
    int cnt = this.paytotalProc.delete(paytotalno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

}
