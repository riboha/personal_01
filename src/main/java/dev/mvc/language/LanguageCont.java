package dev.mvc.language;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LanguageCont {
  
  @Autowired
  @Qualifier ("dev.mvc.language.LanguageProc")
  private LanguageProcInter languageProc;
  

  /**
   * 殿废 贸府
   * @param languageVO
   * @return
   */
  @RequestMapping(value = "/language/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public int create (HashMap<String, Object> hashMap) {
    
    int cnt = this.languageProc.create(hashMap);
    return cnt;
  }
  
  
  /**
   * 荐沥 贸府
   * @param languageVO
   * @return
   */
  @RequestMapping(value = "/language/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public int update (HashMap<String, Object> hashMap) {
    
    int cnt = this.languageProc.update(hashMap);
    
    return cnt;
  }
  
  
  /**
   * 昏力 贸府
   * @param languageVO
   * @return
   */
  @RequestMapping(value = "/language/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public int delete (int languageno) {
    
    int cnt = this.languageProc.delete(languageno);
    
    return cnt;
  }
  
  
}
