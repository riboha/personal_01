package dev.mvc.quality;

import java.util.ArrayList;
import java.util.HashMap;

public interface QualityDAOInter {
  
  /**
   * ���
   * @param hashMap
   * @return
   */
  public int create (HashMap<String, Object> hashMap);
  
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
  public int update (HashMap<String, Object> hashMap);
  
  /**
   * ����
   * @param qualityno
   * @return
   */
  public int delete (int qualityno);

}
