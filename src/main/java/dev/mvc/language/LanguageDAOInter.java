package dev.mvc.language;

import java.util.ArrayList;

public interface LanguageDAOInter {
  
  /**
   * ���
   * @param languageVO
   * @return
   */
  public int create (LanguageVO languageVO);
  
  /**
   * ���
   * @return
   */
  public ArrayList<LanguageVO> list ();
  
  /**
   * ��ȸ
   * @param languageno
   * @return
   */
  public LanguageVO read (int languageno);
  
  /**
   * ����
   * @param hashMap
   * @return
   */
  public int update (LanguageVO languageVO);
  
  /**
   * ����
   * @param languageno
   * @return
   */
  public int delete (int languageno);
  

}
