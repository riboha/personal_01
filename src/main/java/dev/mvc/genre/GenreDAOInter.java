package dev.mvc.genre;

import java.util.ArrayList;
import java.util.HashMap;

public interface GenreDAOInter {
  
  /**
   * ���
   * @param genreVO
   * @return
   */
  public int create (GenreVO genreVO);
  
  /**
   * ���
   * @return
   */
  public ArrayList<GenreVO> list ();
  
  /**
   * ��ȸ
   * @param genreno
   * @return
   */
  public GenreVO read (int genreno);
  
  /**
   * ����
   * @param hashMap
   * @return
   */
  public int update (HashMap<String, Object> hashMap);
  
  /**
   * ����
   * @param genreno
   * @return
   */
  public int delete (int genreno);

}
