package dev.mvc.filmgenre;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component ("dev.mvc.filmgenre.FilmgenreProc")
public class FilmgenreProc implements FilmgenreProcInter {
  
  @Autowired
  private FilmgenreDAOInter FilmgenreDAO;

  @Override
  public int create(FilmgenreVO filmgenreVO) {
    int cnt = this.FilmgenreDAO.create(filmgenreVO);
    return cnt;
  }

  @Override
  public ArrayList<FilmgenreVO> list() {
    ArrayList<FilmgenreVO> list = this.FilmgenreDAO.list();
    return list;
  }
  
  @Override
  public ArrayList<FilmgenreVO> list_by_filmno(int filmno) {
    ArrayList<FilmgenreVO> list = this.FilmgenreDAO.list_by_filmno(filmno);
    return list;
  }
  
  @Override
  public ArrayList<Film_Genre_VO> filmgenre_list_by_filmno(int filmno) {
    ArrayList<Film_Genre_VO> list = this.FilmgenreDAO.filmgenre_list_by_filmno(filmno);
    return list;
  }

  @Override
  public FilmgenreVO read(int filmgenreno) {
    FilmgenreVO filmgenreVO = this.FilmgenreDAO.read(filmgenreno);
    return filmgenreVO;
  }

  @Override
  public int update(FilmgenreVO filmgenreVO) {
    int cnt = this.FilmgenreDAO.update(filmgenreVO);
    return cnt;
  }

  @Override
  public int delete(int filmgenreno) {
    int cnt = this.FilmgenreDAO.delete(filmgenreno);
    return cnt;
  }

  @Override
  public int findduplicate(FilmgenreVO filmgenreVO) {
    int duplicate = this.FilmgenreDAO.findduplicate(filmgenreVO);
    return duplicate;
  }

  @Override
  public int delete_by_filmno(int filmno) {
    int cnt = this.FilmgenreDAO.delete_by_filmno(filmno);
    return cnt;
  }

  @Override
  public int count_by_filmno(int filmno) {
    int cnt = this.FilmgenreDAO.count_by_filmno(filmno);
    return cnt;
  }

  @Override
  public ArrayList<Film_Genre_VO> list_6_main_genre() {
    ArrayList<Film_Genre_VO> list_6_main_genre = this.FilmgenreDAO.list_6_main_genre();
    return list_6_main_genre;
  }

}
