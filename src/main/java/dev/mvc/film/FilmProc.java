package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.film.FilmProc")
public class FilmProc implements FilmProcInter {
  
  @Autowired
  private FilmDAOInter FilmDAO;
  

  // ���
  @Override
  public int create(FilmVO filmVO) {
    int cnt = this.FilmDAO.create(filmVO);
    return cnt;
  }

  // ���
  @Override
  public ArrayList<FilmVO> list() {
    ArrayList<FilmVO> list = this.FilmDAO.list();
    return list;
  }

  // ��ȸ
  @Override
  public FilmVO read(int filmno) {
    FilmVO filmVO = this.FilmDAO.read(filmno);
    return filmVO;
  }
  

  // ����
  @Override
  public int update(FilmVO filmVO) {
    int cnt = this.FilmDAO.update(filmVO);
    return cnt;
  }

  
  // ����
  @Override
  public int delete(int filmno) {
    int cnt = this.FilmDAO.delete(filmno);
    return cnt;
  }

  // 6�� ���ڵ� �ֽż� ��� (���� �������� ) 
  @Override
  public ArrayList<FilmVO> list_6_main() {
    ArrayList<FilmVO> list = this.FilmDAO.list_6_main();
    return list;
  }
  

  
  
  // ����¡ + �˻� (ȭ��, ���, �帣) ����
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int search_count = this.FilmDAO.search_count(hashMap);
    return search_count;
  }
  
  // ����¡ + �˻� (ȭ��, ���, �帣)
  @Override
  public ArrayList<FilmVO> list_paging_search(HashMap<String, Object> hashMap) {
    
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 6 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 6 --> 6
    3 ������: nowPage = 3, (3 - 1) * 6 --> 12
    */
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Film.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������ �� 0 + 1 =  1
    // 2 ������ �� 6 + 1 = 7
    // 3 ������ �� 12 + 1 = 13
    int startNum = beginOfPage + 1; 
    
    //  ���� rownum
    // 1 ������ �� 0 + 6 = 6
    // 2 ������ �� 6 + 6 = 12 
    // 3 ������ �� 6 + 12 = 18
    int endNum = beginOfPage + Film.RECORD_PER_PAGE;   
    
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    ArrayList<FilmVO> list_paging_search = this.FilmDAO.list_paging_search(hashMap);
    return list_paging_search;
  }

  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, 
      String search_genre, String search_language, String search_quality) {
    
    int totalPage = (int)(Math.ceil((double)search_count/Film.RECORD_PER_PAGE)); // ��ü ������  (���ڵ� 60�� / 6 = 10)
    int totalGrp = (int)(Math.ceil((double)totalPage/Film.PAGE_PER_BLOCK));// ��ü �׷� (10 / 5 = 2)
    int nowGrp = (int)(Math.ceil((double)nowPage/Film.PAGE_PER_BLOCK));    // ���� �׷� (1 / 5 �� 1) 
    int startPage = ((nowGrp - 1) * Film.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  ( (1 - 1) * 0 + 1 = 1)
    int endPage = (nowGrp * Film.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����  ( 1 * 5 = 5) 
   
    StringBuffer str = new StringBuffer(); 
    str.append("<ul class='paginator paginator--list'>");

    // �� ���� 5�� �������� �̵�
    // nowGrp: 1 (1 ~ 5 page)
    // nowGrp: 2 (6 ~ 10 page)
    // nowGrp: 3 (11 ~ 15 page) 
    // ���� 2�׷��� ���: (2 - 1) * 5 = 1�׷��� ������ ������ 5
    // ���� 3�׷��� ���: (3 - 1) * 5 = 2�׷��� ������ ������ 10
    
    int _nowPage = (nowGrp-1) * Film.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<li class='paginator__item paginator__item--prev'>"
                    + "<a href=' " +listFile+"?search_genre=" + search_genre + "&search_language="+ search_language+ "&search_quality=" + search_quality + "&nowPage="+ _nowPage+ " '>"
                    + "<i class='icon ion-ios-arrow-back'></i></a></li>");  
    } 
    
    // �� �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ���� ��� ����
        break; 
      } 
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<li class=\"paginator__item paginator__item--active\"><a href=\"#\">" + i + "</a></li>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<li class='paginator__item'>"
            + "<a href=' " +listFile+"?search_genre=" + search_genre + "&search_language="+ search_language+ "&search_quality=" + search_quality + "&nowPage="+  i + " '>"
            + i 
            + "</a></li>");  
      } 
    } 
    
    // �� 5�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Film.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<li class='paginator__item paginator__item--next'>"
          + "<a href=' " +listFile+"?search_genre=" + search_genre + "&search_language="+ search_language+ "&search_quality=" + search_quality + "&nowPage="+ _nowPage+ " '>"
          + "<i class='icon ion-ios-arrow-forward'></i></a></li>");  
    } 
    str.append("</ul>");
    return str.toString(); 
  }

  @Override
  // ���� ��� ����
  public int update_rate(int filmno) {
    int update_rate = this.FilmDAO.update_rate(filmno);
    return update_rate;
  }

  
  


}
