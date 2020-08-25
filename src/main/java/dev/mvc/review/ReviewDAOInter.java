package dev.mvc.review;

import java.util.ArrayList;

public interface ReviewDAOInter {
  
  public int create (ReviewVO reviewVO);
  
  public ArrayList<Member_Review_VO> review_list_by_memberno (int filmno);
  
  public ReviewVO read (int reviewno);
  
  public int update (ReviewVO reviewVO);
  
  public int delete (int reviewno);
  
  /**
   * 영화번호 별 평균 평점
   * @param filmno
   * @return
   */
  public double rate_by_filmno (int filmno);

  
}
