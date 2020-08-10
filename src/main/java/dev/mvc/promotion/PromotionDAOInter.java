package dev.mvc.promotion;

import java.util.ArrayList;

public interface PromotionDAOInter {
  
  public int create (PromotionVO promotionVO);
  
  public ArrayList<PromotionVO> list ();
  
  public PromotionVO read (int promotionno);
  
  public int update (PromotionVO promotionVO);
  
  public int delete (int promotionno);
  

}
