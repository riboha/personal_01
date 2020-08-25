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
  // ���
  public int create (PayVO payVO) {
    int cnt = this.payDAO.create(payVO );
    return cnt;
  }

  @Override
  // ���
  public ArrayList<PayVO> list() {
    ArrayList<PayVO> list = this.payDAO.list();
    return list;
  }

  @Override
  // ��ȸ
  public PayVO read(int payno) {
    PayVO payVO = this.payDAO.read(payno);
    return payVO;
  }

  @Override
  // ����
  public int update (PayVO payVO) {
    int cnt = this.payDAO.update(payVO);
    return cnt;
  }

  @Override
  // ����
  public int delete(int payno) {
    int cnt = this.payDAO.delete(payno);
    return cnt;
  }

  
  
  @Override
  // ȸ����ȣ �� ���� ��� ���� (�Ѱ��� ���ڵ� 5���� ����¡ + �ش� ���� ���ڵ�)
  public int list_paging_by_paytotalno_count(HashMap<String, Object> hashMap) {
    int search_count = this.payDAO.list_paging_by_paytotalno_count(hashMap);
    return search_count;
  }
  
  
  
  @Override
  // ȸ����ȣ �� �Ѱ�����ȣ ���
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
  // ȸ����ȣ �� ���� ��� (�Ѱ��� ���ڵ� 5���� ����¡ + �ش� ���� ���ڵ�)
  public ArrayList<Paytotal_Pay_Film_VO> list_paging(HashMap<String, Object> hashMap) {
    
    /* public static int RECORD_PER_PAGE = 4; */  /** �������� ���ڵ� ���� */
    /* public static int PAGE_PER_BLOCK = 5; */   /** ���� ������ ��, �ϳ��� ���� 1�� �̻��� �������� ������ */
    
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 4 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 4 --> 4
    3 ������: nowPage = 3, (3 - 1) * 4 --> 8
    */
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Pay.RECORD_PER_PAGE;
    
    // ���� rownum
    // 1 ������ �� 0 + 1 =  1
    // 2 ������ �� 4 + 1 = 5
    // 3 ������ �� 8 + 1 = 9
    int startNum = beginOfPage + 1; 
    
    //  ���� rownum
    // 1 ������ �� 0 + 4 = 4
    // 2 ������ �� 4 + 4 = 8 
    // 3 ������ �� 8 + 4 = 12
    int endNum = beginOfPage + Pay.RECORD_PER_PAGE;   
    
    /*
    1 ������: WHERE rownum >= 1 AND rownum <= 4
    2 ������: WHERE rownum >= 5 AND rownum <= 8
    3 ������: WHERE rownum >= 9 AND rownum <= 12
    */
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);

    ArrayList<Paytotal_Pay_Film_VO> list_paging = this.payDAO.list_paging(hashMap);
    return list_paging;
  }

  
  
  @Override
  // ����¡ �ڽ�
  public String pagingBox(String listFile, int search_count, int memberno, int nowPage) {

    /* public static int RECORD_PER_PAGE = 4; */  /** �������� ���ڵ� ���� */
    /* public static int PAGE_PER_BLOCK = 5; */   /** ���� ������ ��, �ϳ��� ���� 1�� �̻��� �������� ������ */
    
    int totalPage = (int)(Math.ceil((double)search_count/Pay.RECORD_PER_PAGE)); // ��ü ������  (���ڵ� 60�� / 4 = 12)
    int totalGrp = (int)(Math.ceil((double)totalPage/Pay.PAGE_PER_BLOCK));// ��ü �׷� (12 / 5 �� 3)
    int nowGrp = (int)(Math.ceil((double)nowPage/Pay.PAGE_PER_BLOCK));    // ���� �׷� (1 / 5 �� 1) 
    int startPage = ((nowGrp - 1) * Pay.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  ( (1 - 1) * 0 + 1 = 1)
    int endPage = (nowGrp * Pay.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����  ( 1 * 5 = 5) 

    StringBuffer str = new StringBuffer(); 
    str.append("<ul class='paylist__paginator paylist__paginator--list'>");

    // �� ���� 5�� �������� �̵�
    // nowGrp: 1 (1 ~ 4 page)
    // nowGrp: 2 (5 ~ 8 page)
    // nowGrp: 3 (9 ~ 12 page) 
    // ���� 2�׷��� ���: (2 - 1) * 4 = 1�׷��� ������ ������ 4
    // ���� 3�׷��� ���: (3 - 1) * 4 = 2�׷��� ������ ������ 8
    int _nowPage = (nowGrp-1) * Pay.PAGE_PER_BLOCK;  
    
    if (nowGrp >= 2){ 
      str.append("<li class='paylist__paginator__item paylist__paginator__item--prev'>"
                    + "<a href=' " + listFile + "?memberno=" + memberno + "&nowPage="+ _nowPage+ " '>"
                    + "<i class='icon ion-ios-arrow-back'></i></a></li>");  
    } 
    
    // �� �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ������ ��� ����
        break; 
      } 
      
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<li class=\"paylist__paginator__item paylist__paginator__item--active\"><a href=\"#\">" + i + "</a></li>"); // ���� ������, ���� 
      } else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<li class='paylist__paginator__item'>"
            + "<a href=' " + listFile + "?memberno=" + memberno + "&nowPage="+  i + " '>" + i + "</a></li>");  
      } 
    } 
    
    // �� 5�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
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
