package dev.mvc.photo;

import java.util.ArrayList;

public interface PhotoProcInter {
  

  public int create (PhotoVO photoVO);
  
  public ArrayList<PhotoVO> list ();
  
  public ArrayList<PhotoVO> list_by_filmno (int filmno);
  
  public PhotoVO read (int photono);
  
  public int update (PhotoVO photoVO);
  
  public int delete (int photono);

}
