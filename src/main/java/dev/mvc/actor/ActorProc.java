package dev.mvc.actor;

import java.util.ArrayList;
import java.util.HashMap;

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

  // 검색 자동완성
  @Override
  public ArrayList<ActorVO> search_auto(String search_dir) {
    ArrayList<ActorVO> search_auto = this.actorDAO.search_auto(search_dir);
    return search_auto;
  }


  
  @Override
  // 페이징 + 검색 갯수
  public int list_paging_search_actor_count(HashMap<String, Object> hashMap) {
    int search_count = this.actorDAO.list_paging_search_actor_count(hashMap);
    return search_count;
  }

  @Override
  // 페이징 + 검색 actorno 리스트
  public ArrayList<ActorVO> list_paging_search_actor(HashMap<String, Object> hashMap) {
    
    // RECORD_PER_PAGE = 12
    
    // 현재 페이지의 첫 레코드 번호 계산 기준값, nowPage는 1부터 시작
    // nowPage: 1 → (1 - 1) * 12 = 0
    // nowPage: 2 → (2 - 1) * 12 = 12
    // nowPage: 1 → (3 - 1) * 12 = 24
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Actor.RECORD_PER_PAGE ;
    
    // 현재 페이지의 첫 레코드 번호 (startNum)
    int startNum = beginOfPage + 1;
    
    // 현재 페이지의 마지막 레코드 번호 (endNum)
    int endNum = beginOfPage + Actor.RECORD_PER_PAGE ;
    
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    ArrayList<ActorVO> actorVO_list = this.actorDAO.list_paging_search_actor(hashMap);
    return actorVO_list;
  }

  @Override
  // 페이징 박스 
  public String pagingBox(String listFile, int search_count, int nowPage, String search_actor) {
    // TODO Auto-generated method stub
    return null;
  }

}
