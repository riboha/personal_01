package dev.mvc.rentprice;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RentpriceCont {
  
  @Autowired
  @Qualifier ("dev.mvc.rentprice.RentpriceProc")
  private RentpriceProcInter rentpriceProc;
  

  /**
   * 殿废 贸府
   * @param rentpriceVO
   * @return
   */
  @RequestMapping(value = "/rentprice/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (RentpriceVO rentpriceVO) {
    
    int cnt = this.rentpriceProc.create(rentpriceVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 荐沥 贸府
   * @param languageVO
   * @return
   */
  @RequestMapping(value = "/rentprice/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String update (RentpriceVO rentpriceVO) {
    
    int cnt = this.rentpriceProc.update(rentpriceVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 昏力 贸府
   * @param languageVO
   * @return
   */
  @RequestMapping(value = "/rentprice/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int rentpriceno) {
    
    int cnt = this.rentpriceProc.delete(rentpriceno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

}
