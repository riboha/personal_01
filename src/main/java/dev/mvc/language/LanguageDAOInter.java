package dev.mvc.language;

import java.util.ArrayList;

public interface LanguageDAOInter {
  
  /**
   * 등록
   * @param languageVO
   * @return
   */
  public int create (LanguageVO languageVO);
  
  /**
   * 목록
   * @return
   */
  public ArrayList<LanguageVO> list ();
  
  /**
   * 조회
   * @param languageno
   * @return
   */
  public LanguageVO read (int languageno);
  
  /**
   * 수정
   * @param hashMap
   * @return
   */
  public int update (LanguageVO languageVO);
  
  /**
   * 삭제
   * @param languageno
   * @return
   */
  public int delete (int languageno);
  

}
