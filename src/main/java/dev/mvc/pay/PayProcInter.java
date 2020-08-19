package dev.mvc.pay;

import java.util.ArrayList;

public interface PayProcInter {
  
  public int create (PayVO payVO);
  
  public ArrayList<PayVO> list ();
  
  /**
   * Pay, Paytotal Join (memberno별 결제 내역) 
   * @param payno
   * @return
   */
  public ArrayList<Paytotal_Pay_Film_VO> list_by_memberno (int memeberno);
  
  public PayVO read (int payno);
  
  public int update (PayVO payVO);
  
  public int delete (int payno);
  
}
