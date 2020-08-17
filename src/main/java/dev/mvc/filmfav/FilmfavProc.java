package dev.mvc.filmfav;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component ("dev.mvc.filmfav.FilmfavProc")
public class FilmfavProc implements FilmfavProcInter {
  
  @Autowired
  private FilmfavDAOInter FilmfavDAO;

  @Override
  public int create(FilmfavVO filmfavVO) {
    int cnt = this.FilmfavDAO.create(filmfavVO);
    return cnt;
  }

  @Override
  public ArrayList<FilmfavVO> list() {
    ArrayList<FilmfavVO> list = this.FilmfavDAO.list();
    return list;
  }

  @Override
  public FilmfavVO read(int filmfavno) {
    FilmfavVO filmfavVO = this.FilmfavDAO.read(filmfavno);
    return filmfavVO;
  }

  @Override
  public int update(FilmfavVO filmfavVO) {
    int cnt = this.FilmfavDAO.update(filmfavVO);
    return cnt;
  }

  @Override
  public int delete(int filmfavno) {
    int cnt = this.FilmfavDAO.delete(filmfavno);
    return cnt;
  }
  
  @Override
  public int findduplicate(FilmfavVO filmfavVO) {
    int duplicate = this.FilmfavDAO.findduplicate(filmfavVO);
    return duplicate;
  }

  @Override
  public ArrayList<Member_Film_wish_VO> list_by_memberno(int memberno) {
    ArrayList<Member_Film_wish_VO> list_by_memberno = this.FilmfavDAO.list_by_memberno(memberno);
    return list_by_memberno;
  }


}
