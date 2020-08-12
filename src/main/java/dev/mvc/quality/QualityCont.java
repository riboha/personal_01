package dev.mvc.quality;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QualityCont {
  
  @Autowired
  @Qualifier ("dev.mvc.quality.QualityProc")
  private QualityProcInter qualityProc;
  

  /**
   * 殿废 贸府
   * @param qualityVO
   * @return
   */
  @RequestMapping(value = "/quality/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (QualityVO qualityVO) {
    
    int cnt = this.qualityProc.create(qualityVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 荐沥 贸府
   * @param languageVO
   * @return
   */
  @RequestMapping(value = "/quality/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String update (QualityVO qualityVO) {
    
    int cnt = this.qualityProc.update(qualityVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  /**
   * 昏力 贸府
   * @param languageVO
   * @return
   */
  @RequestMapping(value = "/quality/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int qualityno) {
    
    int cnt = this.qualityProc.delete(qualityno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

}
