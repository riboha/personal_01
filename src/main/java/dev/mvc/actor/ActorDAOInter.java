package dev.mvc.actor;

import java.util.ArrayList;
import java.util.HashMap;

public interface ActorDAOInter {
  
  public int create (ActorVO actorVO);
  
  public ArrayList<ActorVO> list ();
  
  public ActorVO read (int actorno);
  
  public int update (ActorVO actorVO);
  
  public int delete (int actorno);
  
  public int delete_img (int actorno);
  
  /**
   * �˻� �ڵ��ϼ�
   * @param search_dir
   * @return
   */
  public ArrayList<ActorVO> search_auto (String search_dir);
  
  /**
   * ����¡ + �˻� (��� �̸� �ѱ�, ��� �̸� ����, ��� ����, �迪, ��ȭ �̸� �ѱ�, ��ȭ �̸� ���� ) ����
   * @param hashMap
   * @return
   */
  public int list_paging_search_actor_count  (HashMap<String, Object> hashMap);
  
  /**
   * ����¡ + �˻� (��� �̸� �ѱ�, ��� �̸� ����, ��� ����, �迪, ��ȭ �̸� �ѱ�, ��ȭ �̸� ���� )
   * @param hashMap
   * @return
   */
  public ArrayList<ActorVO> list_paging_search_actor (HashMap<String, Object> hashMap);

}
