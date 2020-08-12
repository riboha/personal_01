package dev.mvc.review;

import java.util.ArrayList;

public interface ReviewDAOInter {
  
  public int create (ReviewVO reviewVO);
  
  public ArrayList<Member_Review_VO> review_list_by_memberno (int filmno);
  
  public ReviewVO read (int reviewno);
  
  public int update (ReviewVO reviewVO);
  
  public int delete (int reviewno);
  
}
