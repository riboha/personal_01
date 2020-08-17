package dev.mvc.directorfav;

import java.util.ArrayList;

public interface DirectorfavProcInter {
  
  public int create (DirectorfavVO directorfavVO);
  
  public ArrayList<DirectorfavVO> list ();

  public ArrayList<Member_Director_VO> list_by_memberno (int memberno);
  
  public DirectorfavVO read (int dirfavno);
  
  public int findduplicate (DirectorfavVO directorfavVO);
  
  public int update (DirectorfavVO directorfavVO);
  
  public int delete (int dirfavno);
}
