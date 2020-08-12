package dev.mvc.language;

import java.util.ArrayList;

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
  public int create(LanguageVO languageVO) {
    int cnt = this.languageDAO.create(languageVO);
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
  public int update(LanguageVO languageVO) {
    int cnt = this.languageDAO.update(languageVO);
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
