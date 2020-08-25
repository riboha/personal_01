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

  // �˻� �ڵ��ϼ�
  @Override
  public ArrayList<ActorVO> search_auto(String search_dir) {
    ArrayList<ActorVO> search_auto = this.actorDAO.search_auto(search_dir);
    return search_auto;
  }


  
  @Override
  // ����¡ + �˻� ����
  public int list_paging_search_actor_count(HashMap<String, Object> hashMap) {
    int search_count = this.actorDAO.list_paging_search_actor_count(hashMap);
    return search_count;
  }

  @Override
  // ����¡ + �˻� actorno ����Ʈ
  public ArrayList<ActorVO> list_paging_search_actor(HashMap<String, Object> hashMap) {
    
    // RECORD_PER_PAGE = 12
    
    // ���� �������� ù ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    // nowPage: 1 �� (1 - 1) * 12 = 0
    // nowPage: 2 �� (2 - 1) * 12 = 12
    // nowPage: 1 �� (3 - 1) * 12 = 24
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Actor.RECORD_PER_PAGE ;
    
    // ���� �������� ù ���ڵ� ��ȣ (startNum)
    int startNum = beginOfPage + 1;
    
    // ���� �������� ������ ���ڵ� ��ȣ (endNum)
    int endNum = beginOfPage + Actor.RECORD_PER_PAGE ;
    
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    ArrayList<ActorVO> actorVO_list = this.actorDAO.list_paging_search_actor(hashMap);
    return actorVO_list;
  }

  @Override
  // ����¡ �ڽ� 
  public String pagingBox ( String listFile, int search_count, int nowPage, String search_actor ) {
    
    // Actor.RECORD_PER_PAGE  ������ �� ���ڵ� �� = 12
    // Actor.PAGE_PER_BLOCK �׷� �� ������ ��=  5
    
    int totalPage = (int) (Math.ceil ((double)search_count / Actor.RECORD_PER_PAGE));  // ��ü ������ �� // ���ڵ� 60�� �� 60 / 12 = 5
    int totalGrp = (int) (Math.ceil ((double) totalPage / Actor.PAGE_PER_BLOCK)); // ��ü �׷� �� // ��ü ������ ��  5�� �� 5 / 5 = 1
    int nowGrp = (int) (Math.ceil((double) nowPage /Actor.PAGE_PER_BLOCK)); // ���� �׷�  // ���� ������ 1 �� 1 / 5 �� 0
    int startPage = ((nowGrp -1) * Actor.PAGE_PER_BLOCK) + 1; // Ư�� �׷� ���� ������ ��ȣ // ���� ������ 1 �� (1 - 1) * 5 + 1 = 1
    int endPage = (nowGrp * Actor.PAGE_PER_BLOCK); // Ư�� �׷� �� ������ ��ȣ // ���� ������ 1 �� (1 * 5) = 5
    
    
    StringBuffer str = new StringBuffer();
    str.append("<ul class='paginator paginator--list'>");
    
    // �� ���� �׷����� �̵� 
    // nowGrp 1 (1~5), nowGrp 2 (6~10), nowGrp 3 (11~15)
    // ���� 2�׷�, 1�׷��� ������ ������ 5�� �̵� ��  (2 - 1) * 5 = 5
    // ���� 3�׷�, 2�׷��� ������ ������ 5�� �̵� ��  (3 - 1) * 5 = 10
    
    int _nowPage = (nowGrp-1) * Film.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<li class='paginator__item paginator__item--prev'>"
                    + "<a href=' " +listFile+"?search_actor=" + search_actor + "&nowPage="+ _nowPage+ " '>"
                    + "<i class='icon ion-ios-arrow-back'></i></a></li>");  
    } 
    
    // �� �߾��� ������ ���
    for ( int i=startPage; i<=endPage; i++ ){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ���� ��� ����
        break; 
      } 
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<li class=\"paginator__item paginator__item--active\"><a href=\"#\">" + i + "</a></li>"); // ���� ������, ���� 
      } else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<li class='paginator__item'>"
            + "<a href=' " +listFile+"?search_actor=" + search_actor  + "&nowPage="+  i + " '>"
            + i 
            + "</a></li>");
      } 
      
      // �� ���� �׷����� �̵�
      // nowGrp: 1 (1 ~ 5 page),  nowGrp: 2 (6 ~ 10 page),  nowGrp: 3 (11 ~ 15 page) 
      // ���� 1�׷�, 2�׷��� ���� ������ 6���� �̵� �� ( 1 * 5 ) + 1 = 6
      // ���� 2�׷�, 3�׷��� ���� ������ 11���� �̵� �� ( 2 * 5 ) + 1 = 11
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
