package dev.mvc.actorfav;

import java.util.ArrayList;

public interface ActorfavProcInter {
  
  public int create (ActorfavVO actorfavVO);
  
  public ArrayList<ActorfavVO> list ();
  
  public ActorfavVO read (int actorfavno);
  
  public int findduplicate (ActorfavVO actorfavVO);
  
  public int update (ActorfavVO actorfavVO);
  
  public int delete (int actorfavno);
}
