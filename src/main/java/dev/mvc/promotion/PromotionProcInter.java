package dev.mvc.promotion;

import java.util.ArrayList;

public interface PromotionProcInter {
  
  public int create (PromotionVO promotionVO);
  
  public ArrayList<PromotionVO> list ();
  
  public PromotionVO read (int promono);
  
  public int update (PromotionVO promotionVO);
  
  public int delete (int promono);
  
}
