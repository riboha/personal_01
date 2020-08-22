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
   * 6�� ���ڵ� �ֽż� ��� (���� �������� ) 
   * @return
   */
  public ArrayList<FilmVO> list_6_main ();

  /**
   * ����¡ + �˻� (ȭ��, ���, �帣) ����
   * @param hashMap
   * @return
   */
  public int search_count (HashMap<String, Object> hashMap);
  

  /**
   * ����¡ + �˻� (ȭ��, ���, �帣)
   * @return
   */
  public ArrayList<FilmVO> list_paging_search (HashMap<String, Object> hashMap);
  
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
