package dev.mvc.language;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
("dev.mvc.language.LanguageProc")
public class LanguageProc implements LanguageProcInter {
  
  
  @Autowired
  private LanguageDAOInter languageDAO;
  

  /**
   * ���
   */
  @Override
  public int create(HashMap<String, Object> hashMap) {
    int cnt = this.languageDAO.create(hashMap);
    return cnt;
  }

  /**
   * ���
   */
  @Override
  public ArrayList<LanguageVO> list() {
    ArrayList<LanguageVO> list = this.languageDAO.list();
    return list;
  }

  /** 
   * ��ȸ
   */
  @Override
  public LanguageVO read(int languageno) {
    LanguageVO languageVO = this.languageDAO.read(languageno);
    return languageVO;
  }

  /**
   * ����
   */
  @Override
  public int update(HashMap<String, Object> hashMap) {
    int cnt = this.languageDAO.update(hashMap);
    return cnt;
  }

  /**
   * ����
   */
  @Override
  public int delete(int languageno) {
    int cnt = this.languageDAO.delete(languageno);
    return cnt;
  }

  




  
}
