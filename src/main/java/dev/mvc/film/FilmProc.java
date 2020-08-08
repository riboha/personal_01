package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.film.FilmProc")
public class FilmProc implements FilmProcInter {
  
  @Autowired
  private FilmDAOInter FilmDAO;
  

  // ���
  @Override
  public int create(FilmVO filmVO) {
    int cnt = this.FilmDAO.create(filmVO);
    return cnt;
  }

  // ���
  @Override
  public ArrayList<FilmVO> list() {
    ArrayList<FilmVO> list = this.FilmDAO.list();
    return list;
  }

  // ��ȸ
  @Override
  public FilmVO read(int filmno) {
    FilmVO filmVO = this.FilmDAO.read(filmno);
    return filmVO;
  }
  

  // ����
  @Override
  public int update(HashMap<String, Object> hashMap) {
    int cnt = this.FilmDAO.update(hashMap);
    return cnt;
  }

  // ����
  @Override
  public int delete(int filmno) {
    int cnt = this.FilmDAO.delete(filmno);
    return cnt;
  }



}
