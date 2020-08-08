package dev.mvc.quality;

import java.util.ArrayList;
import java.util.HashMap;

public interface QualityDAOInter {
  
  /**
   * 등록
   * @param hashMap
   * @return
   */
  public int create (HashMap<String, Object> hashMap);
  
  /**
   * 목록
   * @return
   */
  public ArrayList<QualityVO> list ();
  
  /**
   * 조회
   * @param qualityno
   * @return
   */
  public QualityVO read (int qualityno);
  
  /**
   * 수정
   * @param hashMap
   * @return
   */
  public int update (HashMap<String, Object> hashMap);
  
  /**
   * 삭제
   * @param qualityno
   * @return
   */
  public int delete (int qualityno);

}
