package dev.mvc.quality;

import java.util.ArrayList;

public interface QualityDAOInter {
  
  /**
   * ���
   * @param hashMap
   * @return
   */
  public int create (QualityVO qualityVO);
  
  /**
   * ���
   * @return
   */
  public ArrayList<QualityVO> list ();
  
  /**
   * ��ȸ
   * @param qualityno
   * @return
   */
  public QualityVO read (int qualityno);
  
  /**
   * ����
   * @param hashMap
   * @return
   */
  public int update (QualityVO qualityVO);
  
  /**
   * ����
   * @param qualityno
   * @return
   */
  public int delete (int qualityno);

}
