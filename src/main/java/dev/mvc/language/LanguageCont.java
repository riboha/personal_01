package dev.mvc.language;

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
  public int create (LanguageVO languageVO) {
    
    int cnt = this.languageProc.create(languageVO);
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
  public int update (LanguageVO languageVO) {
    
    int cnt = this.languageProc.update(languageVO);
    
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
