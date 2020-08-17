package dev.mvc.filmfav;

import java.util.ArrayList;

public interface FilmfavProcInter {
  
  public int create (FilmfavVO filmfavVO);
  
  public ArrayList<FilmfavVO> list ();

  public ArrayList<Member_Film_wish_VO> list_by_memberno (int memberno);
  
  public FilmfavVO read (int filmfavno);
  
  public int findduplicate (FilmfavVO filmfavVO);
  
  public int update (FilmfavVO filmfavVO);
  
  public int delete (int filmfavno);
}
