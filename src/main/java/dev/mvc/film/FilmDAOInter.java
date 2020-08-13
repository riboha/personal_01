package dev.mvc.film;

import java.util.ArrayList;

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
   * 6�� ���ڵ� �ֽż� ��� (���� �������� ) 
   * @return
   */
  public ArrayList<FilmVO> list_6_main ();
  
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
