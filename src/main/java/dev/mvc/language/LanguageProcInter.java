package dev.mvc.language;

import java.util.ArrayList;
import java.util.HashMap;

public interface LanguageProcInter {
  
  /**
   * ���
   * @param languageVO
   * @return
   */
  public int create (HashMap<String , Object> hashMap);
  
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
  public int update (HashMap<String , Object> hashMap);
  
  /**
   * ����
   * @param languageno
   * @return
   */
  public int delete (int languageno);
  

}
