package dev.mvc.actor;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.actor.ActorProc")
public class ActorProc implements ActorProcInter {

  @Autowired
  private ActorDAOInter actorDAO;

  @Override
  public int create(ActorVO actorVO) {
    int cnt = this.actorDAO.create(actorVO);
    return cnt;
  }

  @Override
  public ArrayList<ActorVO> list() {
    ArrayList<ActorVO> list = this.actorDAO.list();
    return list;
  }

  @Override
  public ActorVO read(int actorno) {
    ActorVO actorVO = this.actorDAO.read(actorno);
    return actorVO;
  }

  @Override
  public int update(ActorVO actorVO) {
    int cnt = this.actorDAO.update(actorVO);
    return cnt;
  }

  @Override
  public int delete(int actorno) {
    int cnt = this.actorDAO.delete(actorno);
    return cnt;
  }

  @Override
  public int delete_img(int actorno) {
    int cnt = this.actorDAO.delete_img(actorno);
    return cnt;
  }

  // �˻� �ڵ��ϼ�
  @Override
  public ArrayList<ActorVO> search_auto(String search_dir) {
    ArrayList<ActorVO> search_auto = this.actorDAO.search_auto(search_dir);
    return search_auto;
  }

  // '��� �̸�' �迭�� ���� '��� ��ȣ' �迭 ��ȯ
  @Override
  public int [] search_actorno (String [] actornamelist) {
    int[] actornolist = this.actorDAO.search_actorno(actornamelist);
    return actornolist;
  }

}
