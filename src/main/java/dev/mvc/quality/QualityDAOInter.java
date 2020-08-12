package dev.mvc.quality;

import java.util.ArrayList;

public interface QualityDAOInter {
  
  /**
   * 등록
   * @param hashMap
   * @return
   */
  public int create (QualityVO qualityVO);
  
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
  public int update (QualityVO qualityVO);
  
  /**
   * 삭제
   * @param qualityno
   * @return
   */
  public int delete (int qualityno);

}
