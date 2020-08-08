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
   * 등록
   */
  @Override
  public int create(HashMap<String, Object> hashMap) {
    int cnt = this.languageDAO.create(hashMap);
    return cnt;
  }

  /**
   * 목록
   */
  @Override
  public ArrayList<LanguageVO> list() {
    ArrayList<LanguageVO> list = this.languageDAO.list();
    return list;
  }

  /** 
   * 조회
   */
  @Override
  public LanguageVO read(int languageno) {
    LanguageVO languageVO = this.languageDAO.read(languageno);
    return languageVO;
  }

  /**
   * 수정
   */
  @Override
  public int update(HashMap<String, Object> hashMap) {
    int cnt = this.languageDAO.update(hashMap);
    return cnt;
  }

  /**
   * 삭제
   */
  @Override
  public int delete(int languageno) {
    int cnt = this.languageDAO.delete(languageno);
    return cnt;
  }

  




  
}
