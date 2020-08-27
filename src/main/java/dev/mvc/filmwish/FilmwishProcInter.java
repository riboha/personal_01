package dev.mvc.filmwish;

import java.util.ArrayList;

public interface FilmwishProcInter {
  
  public int create (FilmwishVO filmwishVO);
  
  public ArrayList<FilmwishVO> list ();

  public ArrayList<Member_Film_fav_VO> list_by_memberno (int memberno);
  
  public FilmwishVO read (int filmwishno);
  
  public int findduplicate (FilmwishVO filmwishVO);
  
  public int update (FilmwishVO filmwishVO);
  
  public int delete (int filmwishno);
  
  public int delete_by_memberno (int memberno);
}
