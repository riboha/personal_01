package dev.mvc.admin;

import java.util.ArrayList;

public interface AdminDAOInter {
  
  public int create (AdminVO adminVO);
  
  public ArrayList<AdminVO> list ();
  
  public AdminVO read (int adminno);
  
  public int update (AdminVO adminVO);
  
  public int delete (int adminno);
  
}
