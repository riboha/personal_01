package dev.mvc.pay;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.paytotal.PaytotalVO;

@Component("dev.mvc.pay.PayProc")
public class PayProc implements PayProcInter {
  
  @Autowired
  private PayDAOInter payDAO;

  @Override
  // 등록
  public int create (PayVO payVO) {
    int cnt = this.payDAO.create(payVO );
    return cnt;
  }

  @Override
  // 목록
  public ArrayList<PayVO> list() {
    ArrayList<PayVO> list = this.payDAO.list();
    return list;
  }

  @Override
  // 조회
  public PayVO read(int payno) {
    PayVO payVO = this.payDAO.read(payno);
    return payVO;
  }

  @Override
  // 수정
  public int update (PayVO payVO) {
    int cnt = this.payDAO.update(payVO);
    return cnt;
  }

  @Override
  // 삭제
  public int delete(int payno) {
    int cnt = this.payDAO.delete(payno);
    return cnt;
  }

  
  
  @Override
  // 회원번호 별 결제 목록 갯수 (총결제 레코드 5개씩 페이징 + 해당 결제 레코드)
  public int list_paging_by_paytotalno_count(HashMap<String, Object> hashMap) {
    int search_count = this.payDAO.list_paging_by_paytotalno_count(hashMap);
    return search_count;
  }
  
  
  
  @Override
  // 회원번호 별 총결제번호 목록
  public ArrayList<PaytotalVO> list_paging_paytotalno(HashMap<String, Object> hashMap) {
    
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Pay.RECORD_PER_PAGE;
    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + Pay.RECORD_PER_PAGE;   
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    ArrayList<PaytotalVO> list_paging_paytotalno = this.payDAO.list_paging_paytotalno(hashMap);
    return list_paging_paytotalno;
  } 

  
  
  @Override
  // 회원번호 별 결제 목록 (총결제 레코드 5개씩 페이징 + 해당 결제 레코드)
  public ArrayList<Paytotal_Pay_Film_VO> list_paging(HashMap<String, Object> hashMap) {
    
    /* public static int RECORD_PER_PAGE = 4; */  /** 페이지당 레코드 갯수 */
    /* public static int PAGE_PER_BLOCK = 5; */   /** 블럭당 페이지 수, 하나의 블럭은 1개 이상의 페이지로 구성됨 */
    
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 4 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 4 --> 4
    3 페이지: nowPage = 3, (3 - 1) * 4 --> 8
    */
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Pay.RECORD_PER_PAGE;
    
    // 시작 rownum
    // 1 페이지 → 0 + 1 =  1
    // 2 페이지 → 4 + 1 = 5
    // 3 페이지 → 8 + 1 = 9
    int startNum = beginOfPage + 1; 
    
    //  종료 rownum
    // 1 페이지 → 0 + 4 = 4
    // 2 페이지 → 4 + 4 = 8 
    // 3 페이지 → 8 + 4 = 12
    int endNum = beginOfPage + Pay.RECORD_PER_PAGE;   
    
    /*
    1 페이지: WHERE rownum >= 1 AND rownum <= 4
    2 페이지: WHERE rownum >= 5 AND rownum <= 8
    3 페이지: WHERE rownum >= 9 AND rownum <= 12
    */
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);

    ArrayList<Paytotal_Pay_Film_VO> list_paging = this.payDAO.list_paging(hashMap);
    return list_paging;
  }

  
  
  @Override
  // 페이징 박스
  public String pagingBox(String listFile, int search_count, int memberno, int nowPage) {

    /* public static int RECORD_PER_PAGE = 4; */  /** 페이지당 레코드 갯수 */
    /* public static int PAGE_PER_BLOCK = 5; */   /** 블럭당 페이지 수, 하나의 블럭은 1개 이상의 페이지로 구성됨 */
    
    int totalPage = (int)(Math.ceil((double)search_count/Pay.RECORD_PER_PAGE)); // 전체 페이지  (레코드 60개 / 4 = 12)
    int totalGrp = (int)(Math.ceil((double)totalPage/Pay.PAGE_PER_BLOCK));// 전체 그룹 (12 / 5 ≒ 3)
    int nowGrp = (int)(Math.ceil((double)nowPage/Pay.PAGE_PER_BLOCK));    // 현재 그룹 (1 / 5 ≒ 1) 
    int startPage = ((nowGrp - 1) * Pay.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  ( (1 - 1) * 0 + 1 = 1)
    int endPage = (nowGrp * Pay.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료  ( 1 * 5 = 5) 

    StringBuffer str = new StringBuffer(); 
    str.append("<ul class='paylist__paginator paylist__paginator--list'>");

    // ▶ 이전 5개 페이지로 이동
    // nowGrp: 1 (1 ~ 4 page)
    // nowGrp: 2 (5 ~ 8 page)
    // nowGrp: 3 (9 ~ 12 page) 
    // 현재 2그룹일 경우: (2 - 1) * 4 = 1그룹의 마지막 페이지 4
    // 현재 3그룹일 경우: (3 - 1) * 4 = 2그룹의 마지막 페이지 8
    int _nowPage = (nowGrp-1) * Pay.PAGE_PER_BLOCK;  
    
    if (nowGrp >= 2){ 
      str.append("<li class='paylist__paginator__item paylist__paginator__item--prev'>"
                    + "<a href=' " + listFile + "?memberno=" + memberno + "&nowPage="+ _nowPage+ " '>"
                    + "<i class='icon ion-ios-arrow-back'></i></a></li>");  
    } 
    
    // ▶ 중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // 마지막 페이지를 넘어갔다면 페이지 출력 종료
        break; 
      } 
      
      if (nowPage == i){ // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<li class=\"paylist__paginator__item paylist__paginator__item--active\"><a href=\"#\">" + i + "</a></li>"); // 현재 페이지, 강조 
      } else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<li class='paylist__paginator__item'>"
            + "<a href=' " + listFile + "?memberno=" + memberno + "&nowPage="+  i + " '>" + i + "</a></li>");  
      } 
    } 
    
    // ▶ 5개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _nowPage = (nowGrp * Pay.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<li class='paylist__paginator__item paylist__paginator__item--next'>"
          + "<a href=' " + listFile + "?memberno=" + memberno + "&nowPage=" + _nowPage+ " '>"
          + "<i class='icon ion-ios-arrow-forward'></i></a></li>");  
    } 
    
    str.append("</ul>");
    return str.toString(); 
  }


}
