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
   * 검색 자동완성
   * @param search_dir
   * @return
   */
  public ArrayList<ActorVO> search_auto (String search_dir);
  
  /**
   * 페이징 + 검색 (배우 이름 한글, 배우 이름 영문, 배우 국적, 배역, 영화 이름 한글, 영화 이름 영문 ) 갯수
   * @param hashMap
   * @return
   */
  public int list_paging_search_actor_count  (HashMap<String, Object> hashMap);
  
  /**
   * 페이징 + 검색 (배우 이름 한글, 배우 이름 영문, 배우 국적, 배역, 영화 이름 한글, 영화 이름 영문 )
   * @param hashMap
   * @return
   */
  public ArrayList<ActorVO> list_paging_search_actor (HashMap<String, Object> hashMap);

}
