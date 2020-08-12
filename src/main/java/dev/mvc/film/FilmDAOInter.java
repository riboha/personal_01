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
