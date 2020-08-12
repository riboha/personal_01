package dev.mvc.filmgenre;

import java.util.ArrayList;

public interface FilmgenreDAOInter {
  
  public int create (FilmgenreVO filmgenreVO);
  
  public ArrayList<FilmgenreVO> list ();
  
  public ArrayList<FilmgenreVO> list_by_filmno (int filmno);
  
  public ArrayList<Film_Genre_VO> filmgenre_list_by_filmno (int filmno);
  
  public FilmgenreVO read (int filmgenreno);
  
  public int findduplicate (FilmgenreVO filmgenreVO);
  
  public int update (FilmgenreVO filmgenreVO);
  
  public int delete (int filmgenreno);

}
