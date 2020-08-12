package dev.mvc.filmwish;

import java.util.ArrayList;

public interface FilmwishProcInter {
  
  public int create (FilmwishVO filmwishVO);
  
  public ArrayList<FilmwishVO> list ();
  
  public FilmwishVO read (int filmwishno);
  
  public int findduplicate (FilmwishVO filmwishVO);
  
  public int update (FilmwishVO filmwishVO);
  
  public int delete (int filmwishno);
}
