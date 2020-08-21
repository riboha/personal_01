package dev.mvc.director;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.director.DirectorProc")
public class DirectorProc implements DirectorProcInter {
  
  @Autowired
  private DirectorDAOInter directorDAO;

  // ���
  @Override
  public int create(DirectorVO directorVO) {
    int cnt = this.directorDAO.create(directorVO);
    return cnt;
  }

  // ���
  @Override
  public ArrayList<DirectorVO> list() {
    ArrayList<DirectorVO> list = this.directorDAO.list();
    return list;
  }

  // ��ȸ
  @Override
  public DirectorVO read(int dirno) {
    DirectorVO directorVO = this.directorDAO.read(dirno);
    return directorVO;
  }

  // ����
  @Override
  public int update(HashMap<String, Object> hashMap) {
    int cnt = this.directorDAO.update(hashMap);
    return cnt;
  }

  // ����
  @Override
  public int delete(int dirno) {
    int cnt = this.directorDAO.delete(dirno);
    return cnt;
  }

  // �˻� �ڵ��ϼ�
  @Override
  public ArrayList<DirectorVO> search_auto(String search_dir) {
    ArrayList<DirectorVO> search_auto = this.directorDAO.search_auto(search_dir);
    return search_auto;
  }

  
  
}
