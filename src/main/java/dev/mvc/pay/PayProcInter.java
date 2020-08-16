package dev.mvc.pay;

import java.util.ArrayList;

public interface PayProcInter {
  
  public int create (PayVO payVO);
  
  public ArrayList<PayVO> list ();
  
  public PayVO read (int payno);
  
  public int update (PayVO payVO);
  
  public int delete (int payno);
  
}
