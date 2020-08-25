package dev.mvc.actor;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.film.Film;

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
  public String pagingBox ( String listFile, int search_count, int nowPage, String search_actor ) {
    
    // Actor.RECORD_PER_PAGE  페이지 별 레코드 수 = 12
    // Actor.PAGE_PER_BLOCK 그룹 별 페이지 수=  5
    
    int totalPage = (int) (Math.ceil ((double)search_count / Actor.RECORD_PER_PAGE));  // 전체 페이지 수 // 레코드 60개 → 60 / 12 = 5
    int totalGrp = (int) (Math.ceil ((double) totalPage / Actor.PAGE_PER_BLOCK)); // 전체 그룹 수 // 전체 페이지 수  5개 → 5 / 5 = 1
    int nowGrp = (int) (Math.ceil((double) nowPage /Actor.PAGE_PER_BLOCK)); // 현재 그룹  // 현재 페이지 1 → 1 / 5 ≒ 0
    int startPage = ((nowGrp -1) * Actor.PAGE_PER_BLOCK) + 1; // 특정 그룹 시작 페이지 번호 // 현재 페이지 1 → (1 - 1) * 5 + 1 = 1
    int endPage = (nowGrp * Actor.PAGE_PER_BLOCK); // 특정 그룹 끝 페이지 번호 // 편재 페이지 1 → (1 * 5) = 5
    
    
    StringBuffer str = new StringBuffer();
    str.append("<ul class='paginator paginator--list'>");
    
    // ※ 이전 그룹으로 이동 
    // nowGrp 1 (1~5), nowGrp 2 (6~10), nowGrp 3 (11~15)
    // 현재 2그룹, 1그룹의 마지막 페이지 5로 이동 →  (2 - 1) * 5 = 5
    // 현재 3그룹, 2그룹의 마지막 페이지 5로 이동 →  (3 - 1) * 5 = 10
    
    int _nowPage = (nowGrp-1) * Film.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<li class='paginator__item paginator__item--prev'>"
                    + "<a href=' " +listFile+"?search_actor=" + search_actor + "&nowPage="+ _nowPage+ " '>"
                    + "<i class='icon ion-ios-arrow-back'></i></a></li>");  
    } 
    
    // ※ 중앙의 페이지 목록
    for ( int i=startPage; i<=endPage; i++ ){ 
      if (i > totalPage){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
      if (nowPage == i){ // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<li class=\"paginator__item paginator__item--active\"><a href=\"#\">" + i + "</a></li>"); // 현재 페이지, 강조 
      } else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<li class='paginator__item'>"
            + "<a href=' " +listFile+"?search_actor=" + search_actor  + "&nowPage="+  i + " '>"
            + i 
            + "</a></li>");
      } 
      
      // ※ 다음 그룹으로 이동
      // nowGrp: 1 (1 ~ 5 page),  nowGrp: 2 (6 ~ 10 page),  nowGrp: 3 (11 ~ 15 page) 
      // 현재 1그룹, 2그룹의 시작 페이지 6으로 이동 → ( 1 * 5 ) + 1 = 6
      // 현재 2그룹, 3그룹의 시작 페이지 11으로 이동 → ( 2 * 5 ) + 1 = 11
      _nowPage = (nowGrp * Film.PAGE_PER_BLOCK)+1;  
      if (nowGrp < totalGrp){ 
        str.append("<li class='paginator__item paginator__item--next'>"
            + "<a href=' " +listFile+"?search_actor=" + search_actor + "&nowPage="+ _nowPage+ " '>"
            + "<i class='icon ion-ios-arrow-forward'></i></a></li>");  
      } 
    } 
    
    str.append("</ul>");
    return str.toString(); 
  }

}
