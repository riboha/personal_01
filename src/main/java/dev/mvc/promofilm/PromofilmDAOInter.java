package dev.mvc.promofilm;

import java.util.ArrayList;

public interface PromofilmDAOInter {
  
  public int create (PromofilmVO promofilmVO);
  
  public ArrayList<PromofilmVO> list_by_promono (int promono);
  
  public PromofilmVO read (int promofilmno);
  
  public int update (PromofilmVO promofilmVO);
  
  public int delete (int promofilmno);
  

}
