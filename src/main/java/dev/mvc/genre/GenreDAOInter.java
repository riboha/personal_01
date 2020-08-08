package dev.mvc.genre;

import java.util.ArrayList;
import java.util.HashMap;

public interface GenreDAOInter {
  
  /**
   * 등록
   * @param genreVO
   * @return
   */
  public int create (GenreVO genreVO);
  
  /**
   * 목록
   * @return
   */
  public ArrayList<GenreVO> list ();
  
  /**
   * 조회
   * @param genreno
   * @return
   */
  public GenreVO read (int genreno);
  
  /**
   * 수정
   * @param hashMap
   * @return
   */
  public int update (HashMap<String, Object> hashMap);
  
  /**
   * 삭제
   * @param genreno
   * @return
   */
  public int delete (int genreno);

}
