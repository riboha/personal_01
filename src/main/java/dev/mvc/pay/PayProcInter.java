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
   * ȸ����ȣ �� ���� ��� ���� (�Ѱ��� ���ڵ� 5���� ����¡ + �ش� ���� ���ڵ�)
   * @param HashMap
   * @return int count ����
   */
  public int list_paging_by_paytotalno_count (HashMap<String, Object> hashMap);
  
  /**
   * ȸ����ȣ �� �Ѱ�����ȣ ���
   * @param hashMap
   * @return
   */
  public ArrayList<PaytotalVO> list_paging_paytotalno (HashMap<String, Object> hashMap);
  
  /**
   * ȸ����ȣ �� ���� ��� (�Ѱ��� ���ڵ� 5���� ����¡ + �ش� ���� ���ڵ�)
   * @param HashMap
   * @return ArrayList<Paytotal_Pay_Film_VO>
   */
  public ArrayList<Paytotal_Pay_Film_VO> list_paging (HashMap<String, Object> hashMap);
  
  /**
   *  ����¡ �ڽ� 
   * @param listFile
   * @param search_count
   * @param memberno
   * @param nowPage
   * @return
   */
  public String pagingBox(String listFile, int search_count, int memberno, int nowPage);
  
}
