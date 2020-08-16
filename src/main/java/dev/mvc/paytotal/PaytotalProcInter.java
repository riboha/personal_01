package dev.mvc.paytotal;

import java.util.ArrayList;

public interface PaytotalProcInter {
  
  public int create (PaytotalVO paytotalVO);
  
  public ArrayList<PaytotalVO> list ();
  
  public PaytotalVO read (int paytotalno);
  
  public int update (PaytotalVO paytotalVO);
  
  public int delete (int paytotalno);
  
}
