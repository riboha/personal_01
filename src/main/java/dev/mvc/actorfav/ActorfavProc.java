package dev.mvc.actorfav;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component ("dev.mvc.actorfav.ActorfavProc")
public class ActorfavProc implements ActorfavProcInter {
  
  @Autowired
  private ActorfavDAOInter ActorfavDAO;

  @Override
  public int create(ActorfavVO actorfavVO) {
    int cnt = this.ActorfavDAO.create(actorfavVO);
    return cnt;
  }

  @Override
  public ArrayList<ActorfavVO> list() {
    ArrayList<ActorfavVO> list = this.ActorfavDAO.list();
    return list;
  }

  @Override
  public ActorfavVO read(int actorfavno) {
    ActorfavVO actorfavVO = this.ActorfavDAO.read(actorfavno);
    return actorfavVO;
  }

  @Override
  public int update(ActorfavVO actorfavVO) {
    int cnt = this.ActorfavDAO.update(actorfavVO);
    return cnt;
  }

  @Override
  public int delete(int actorfavno) {
    int cnt = this.ActorfavDAO.delete(actorfavno);
    return cnt;
  }

  @Override
  public int findduplicate(ActorfavVO actorfavVO) {
    int duplicate = this.ActorfavDAO.findduplicate(actorfavVO);
    return duplicate;
  }

  @Override
  public ArrayList<Member_Actor_VO> list_by_memberno(int memberno) {
    ArrayList<Member_Actor_VO> list_by_memberno = this.ActorfavDAO.list_by_memberno(memberno);
    return list_by_memberno;
  }

  @Override
  public int count_actorfav(int actorno) {
    int cnt_actorfav = this.ActorfavDAO.count_actorfav(actorno);
    return cnt_actorfav;
  }

  @Override
  public int delete_by_memberno(int memberno) {
    int delete_by_memberno = this.ActorfavDAO.delete_by_memberno(memberno);
    return delete_by_memberno;
  }

}
