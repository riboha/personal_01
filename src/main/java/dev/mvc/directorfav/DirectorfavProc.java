package dev.mvc.directorfav;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component ("dev.mvc.directorfav.DirectorfavProc")
public class DirectorfavProc implements DirectorfavProcInter {
  
  @Autowired
  private DirectorfavDAOInter DirectorfavDAO;

  @Override
  public int create(DirectorfavVO directorfavVO) {
    int cnt = this.DirectorfavDAO.create(directorfavVO);
    return cnt;
  }

  @Override
  public ArrayList<DirectorfavVO> list() {
    ArrayList<DirectorfavVO> list = this.DirectorfavDAO.list();
    return list;
  }

  @Override
  public DirectorfavVO read(int dirfavno) {
    DirectorfavVO directorfavVO = this.DirectorfavDAO.read(dirfavno);
    return directorfavVO;
  }

  @Override
  public int update(DirectorfavVO directorfavVO) {
    int cnt = this.DirectorfavDAO.update(directorfavVO);
    return cnt;
  }

  @Override
  public int delete(int dirfavno) {
    int cnt = this.DirectorfavDAO.delete(dirfavno);
    return cnt;
  }
  
  @Override
  public int findduplicate(DirectorfavVO directorfavVO) {
    int duplicate = this.DirectorfavDAO.findduplicate(directorfavVO);
    return duplicate;
  }

  @Override
  public ArrayList<Member_Director_VO> list_by_memberno(int memberno) {
    ArrayList<Member_Director_VO> list_by_memberno = this.DirectorfavDAO.list_by_memberno(memberno);
    return list_by_memberno;
  }


}
