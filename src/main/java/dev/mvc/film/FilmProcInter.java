package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;

public interface FilmProcInter {
  
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
   * ���� ��� ����
   * @param filmno
   * @return
   */
  public int update_rate (int filmno);
  
  /**
   * ����
   * @param filmno
   * @return
   */
  public int delete (int filmno);
  
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
  * 
  * ������ ��� ���ڿ� ����, Box ����
  * @param listFile
  * @param search_count
  * @param nowPage
  * @param search_genre
  * @param search_genguagenre
  * @param search_quality
  * @return
  */
 public String pagingBox(String listFile, int search_count, int nowPage, 
     String search_genre, String search_language, String search_quality);
 


}
