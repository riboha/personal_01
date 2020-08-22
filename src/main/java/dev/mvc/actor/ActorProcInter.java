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
   * 검색 자동완성
   * @param search_dir
   * @return
   */
  public ArrayList<ActorVO> search_auto (String search_dir);
  
  /**
   * '배우 이름' 배열에 따른 '배우 번호' 배열 반환
   * <select id="search_actorno" resultType="ArrayList" parameterType="ArrayList">
   * @return
   */
  public int [] search_actorno (String [] actornamelist);

}
