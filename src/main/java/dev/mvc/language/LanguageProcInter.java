package dev.mvc.language;

import java.util.ArrayList;
import java.util.HashMap;

public interface LanguageProcInter {
  
  /**
   * 등록
   * @param languageVO
   * @return
   */
  public int create (HashMap<String , Object> hashMap);
  
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
  public int update (HashMap<String , Object> hashMap);
  
  /**
   * 삭제
   * @param languageno
   * @return
   */
  public int delete (int languageno);
  

}
