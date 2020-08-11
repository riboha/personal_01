package dev.mvc.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter {

  @Autowired
  private AdminDAOInter adminDAO;

  @Override
  public int create(AdminVO adminVO) {
    int cnt = this.adminDAO.create(adminVO);
    return cnt;
  }

  @Override
  public ArrayList<AdminVO> list() {
    ArrayList<AdminVO> list = this.adminDAO.list();
    return list;
  }

  @Override
  public AdminVO read(int adminno) {
    AdminVO adminVO = this.adminDAO.read(adminno);
    return adminVO;
  }

  @Override
  public int update(AdminVO adminVO) {
    int cnt = this.adminDAO.update(adminVO);
    return cnt;
  }

  @Override
  public int delete(int adminno) {
    int cnt = this.adminDAO.delete(adminno);
    return cnt;
  }

  

}
