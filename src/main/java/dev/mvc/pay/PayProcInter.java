package dev.mvc.pay;

import java.util.ArrayList;
import java.util.HashMap;

import dev.mvc.paytotal.PaytotalVO;

public interface PayProcInter {
  
  public int create (PayVO payVO);
  
  public ArrayList<PayVO> list ();
  
  public PayVO read (int payno);
  
  public int update (PayVO payVO);
  
  public int delete (int payno);
  
  public int delete_by_memberno (int memberno);

  
  /**
   * 회원번호 별 결제 목록 갯수 (총결제 레코드 5개씩 페이징 + 해당 결제 레코드)
   * @param HashMap
   * @return int count 갯수
   */
  public int list_paging_by_paytotalno_count (HashMap<String, Object> hashMap);
  
  /**
   * 회원번호 별 총결제번호 목록
   * @param hashMap
   * @return
   */
  public ArrayList<PaytotalVO> list_paging_paytotalno (HashMap<String, Object> hashMap);
  
  /**
   * 회원번호 별 결제 목록 (총결제 레코드 5개씩 페이징 + 해당 결제 레코드)
   * @param HashMap
   * @return ArrayList<Paytotal_Pay_Film_VO>
   */
  public ArrayList<Paytotal_Pay_Film_VO> list_paging (HashMap<String, Object> hashMap);
  
  /**
   *  페이징 박스 
   * @param listFile
   * @param search_count
   * @param memberno
   * @param nowPage
   * @return
   */
  public String pagingBox(String listFile, int search_count, int memberno, int nowPage);
  
}
