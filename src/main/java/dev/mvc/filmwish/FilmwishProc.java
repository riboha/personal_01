package dev.mvc.filmwish;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component ("dev.mvc.filmwish.FilmwishProc")
public class FilmwishProc implements FilmwishProcInter {
  
  @Autowired
  private FilmwishDAOInter FilmwishDAO;

  @Override
  public int create(FilmwishVO filmwishVO) {
    int cnt = this.FilmwishDAO.create(filmwishVO);
    return cnt;
  }

  @Override
  public ArrayList<FilmwishVO> list() {
    ArrayList<FilmwishVO> list = this.FilmwishDAO.list();
    return list;
  }

  @Override
  public FilmwishVO read(int filmwishno) {
    FilmwishVO filmwishVO = this.FilmwishDAO.read(filmwishno);
    return filmwishVO;
  }

  @Override
  public int update(FilmwishVO filmwishVO) {
    int cnt = this.FilmwishDAO.update(filmwishVO);
    return cnt;
  }

  @Override
  public int delete(int filmwishno) {
    int cnt = this.FilmwishDAO.delete(filmwishno);
    return cnt;
  }

  @Override
  public int findduplicate(FilmwishVO filmwishVO) {
    int exist = this.FilmwishDAO.findduplicate(filmwishVO);
    return exist;
  }

  @Override
  public ArrayList<Member_Film_fav_VO> list_by_memberno(int memberno) {
    ArrayList<Member_Film_fav_VO> list_by_memberno = this.FilmwishDAO.list_by_memberno(memberno);
    return list_by_memberno;
  }




}
