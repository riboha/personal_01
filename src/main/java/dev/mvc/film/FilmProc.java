package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.film.FilmProc")
public class FilmProc implements FilmProcInter {
  
  @Autowired
  private FilmDAOInter FilmDAO;
  

  // 등록
  @Override
  public int create(FilmVO filmVO) {
    int cnt = this.FilmDAO.create(filmVO);
    return cnt;
  }

  // 목록
  @Override
  public ArrayList<FilmVO> list() {
    ArrayList<FilmVO> list = this.FilmDAO.list();
    return list;
  }

  // 조회
  @Override
  public FilmVO read(int filmno) {
    FilmVO filmVO = this.FilmDAO.read(filmno);
    return filmVO;
  }
  

  // 수정
  @Override
  public int update(FilmVO filmVO) {
    int cnt = this.FilmDAO.update(filmVO);
    return cnt;
  }

  
  // 삭제
  @Override
  public int delete(int filmno) {
    int cnt = this.FilmDAO.delete(filmno);
    return cnt;
  }

  // 6개 레코드 최신순 목록 (메인 페이지용 ) 
  @Override
  public ArrayList<FilmVO> list_6_main() {
    ArrayList<FilmVO> list = this.FilmDAO.list_6_main();
    return list;
  }
  

  
  
  // 페이징 + 검색 (화질, 언어, 장르) 갯수
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int search_count = this.FilmDAO.search_count(hashMap);
    return search_count;
  }
  
  // 페이징 + 검색 (화질, 언어, 장르)
  @Override
  public ArrayList<FilmVO> list_paging_search(HashMap<String, Object> hashMap) {
    
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 6 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 6 --> 6
    3 페이지: nowPage = 3, (3 - 1) * 6 --> 12
    */
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Film.RECORD_PER_PAGE;
   
    // 시작 rownum
    // 1 페이지 → 0 + 1 =  1
    // 2 페이지 → 6 + 1 = 7
    // 3 페이지 → 12 + 1 = 13
    int startNum = beginOfPage + 1; 
    
    //  종료 rownum
    // 1 페이지 → 0 + 6 = 6
    // 2 페이지 → 6 + 6 = 12 
    // 3 페이지 → 6 + 12 = 18
    int endNum = beginOfPage + Film.RECORD_PER_PAGE;   
    
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    ArrayList<FilmVO> list_paging_search = this.FilmDAO.list_paging_search(hashMap);
    return list_paging_search;
  }

  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, 
      String search_genre, String search_language, String search_quality) {
    
    int totalPage = (int)(Math.ceil((double)search_count/Film.RECORD_PER_PAGE)); // 전체 페이지  (레코드 60개 / 6 = 10)
    int totalGrp = (int)(Math.ceil((double)totalPage/Film.PAGE_PER_BLOCK));// 전체 그룹 (10 / 5 = 2)
    int nowGrp = (int)(Math.ceil((double)nowPage/Film.PAGE_PER_BLOCK));    // 현재 그룹 (1 / 5 ≒ 1) 
    int startPage = ((nowGrp - 1) * Film.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  ( (1 - 1) * 0 + 1 = 1)
    int endPage = (nowGrp * Film.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료  ( 1 * 5 = 5) 
   
    StringBuffer str = new StringBuffer(); 
    str.append("<ul class='paginator paginator--list'>");

    // ▶ 이전 5개 페이지로 이동
    // nowGrp: 1 (1 ~ 5 page)
    // nowGrp: 2 (6 ~ 10 page)
    // nowGrp: 3 (11 ~ 15 page) 
    // 현재 2그룹일 경우: (2 - 1) * 5 = 1그룹의 마지막 페이지 5
    // 현재 3그룹일 경우: (3 - 1) * 5 = 2그룹의 마지막 페이지 10
    
    int _nowPage = (nowGrp-1) * Film.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<li class='paginator__item paginator__item--prev'>"
                    + "<a href=' " +listFile+"?search_genre=" + search_genre + "&search_language="+ search_language+ "&search_quality=" + search_quality + "&nowPage="+ _nowPage+ " '>"
                    + "<i class='icon ion-ios-arrow-back'></i></a></li>");  
    } 
    
    // ▶ 중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
      if (nowPage == i){ // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<li class=\"paginator__item paginator__item--active\"><a href=\"#\">" + i + "</a></li>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<li class='paginator__item'>"
            + "<a href=' " +listFile+"?search_genre=" + search_genre + "&search_language="+ search_language+ "&search_quality=" + search_quality + "&nowPage="+  i + " '>"
            + i 
            + "</a></li>");  
      } 
    } 
    
    // ▶ 5개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
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
  // 평점 평균 수정
  public int update_rate(int filmno) {
    int update_rate = this.FilmDAO.update_rate(filmno);
    return update_rate;
  }

  
  


}
