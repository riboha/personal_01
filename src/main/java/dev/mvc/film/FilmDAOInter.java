package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;

public interface FilmDAOInter {
  
  /**
   * 등록
   * @param filmVO
   * @return
   */
  public int create (FilmVO filmVO);
  
  /**
   * 목록
   * @return
   */
  public ArrayList<FilmVO> list ();


   /**
   * 6개 레코드 최신순 목록 (메인 페이지용 ) 
   * @return
   */
  public ArrayList<FilmVO> list_6_main ();

  /**
   * 페이징 + 검색 (화질, 언어, 장르) 갯수
   * @param hashMap
   * @return
   */
  public int search_count (HashMap<String, Object> hashMap);
  

  /**
   * 페이징 + 검색 (화질, 언어, 장르)
   * @return
   */
  public ArrayList<FilmVO> list_paging_search (HashMap<String, Object> hashMap);
  
  /**
   * 조회
   * @param filmno
   * @return
   */
  public FilmVO read (int filmno);
  
  /**
   * 수정
   * @param filmVO
   * @return
   */
  public int update (FilmVO filmVO);
  
  /**
   * 삭제
   * @param filmno
   * @return
   */
  public int delete (int filmno);

}
