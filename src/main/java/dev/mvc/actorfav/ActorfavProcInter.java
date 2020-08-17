package dev.mvc.actorfav;

import java.util.ArrayList;

public interface ActorfavProcInter {
  
  public int create (ActorfavVO actorfavVO);
  
  public ArrayList<ActorfavVO> list ();

  public ArrayList<Member_Actor_VO> list_by_memberno (int memberno);
  
  public ActorfavVO read (int actorfavno);
  
  public int findduplicate (ActorfavVO actorfavVO);
  
  public int update (ActorfavVO actorfavVO);
  
  public int delete (int actorfavno);
  
  /**
   * 배우별 좋아요 갯수
   * @param actorno
   * @return
   */
  public int count_actorfav (int actorno);

}
