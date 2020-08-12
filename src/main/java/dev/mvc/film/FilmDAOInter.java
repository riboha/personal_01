package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;

public interface FilmDAOInter {
  
  /**
   * ���
   * @param filmVO
   * @return
   */
  public int create (FilmVO filmVO);
  
  /**
   * ���
   * @return
   */
  public ArrayList<FilmVO> list ();
  
  /**
   * ��ȸ
   * @param filmno
   * @return
   */
  public FilmVO read (int filmno);
  
  /**
   * ����
   * @param filmVO
   * @return
   */
  public int update (FilmVO filmVO);
  
  /**
   * ����
   * @param filmno
   * @return
   */
  public int delete (int filmno);

}
