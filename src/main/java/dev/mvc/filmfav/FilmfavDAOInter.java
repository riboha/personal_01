package dev.mvc.filmfav;

import java.util.ArrayList;

public interface FilmfavDAOInter {
  
  public int create (FilmfavVO filmfavVO);
  
  public ArrayList<FilmfavVO> list ();
  
  public FilmfavVO read (int filmfavno);
  
  public int findduplicate (FilmfavVO filmfavVO);
  
  public int update (FilmfavVO filmfavVO);
  
  public int delete (int filmfavno);

}
