package dev.mvc.actor;

import java.util.ArrayList;

public interface ActorProcInter {
  
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
   * '��� �̸�' �迭�� ���� '��� ��ȣ' �迭 ��ȯ
   * <select id="search_actorno" resultType="ArrayList" parameterType="ArrayList">
   * @return
   */
  public int [] search_actorno (String [] actornamelist);

}
