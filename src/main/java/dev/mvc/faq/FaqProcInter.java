package dev.mvc.faq;

import java.util.ArrayList;

public interface FaqProcInter {
  
    public int create (FaqVO faqVO);
    
    public ArrayList<FaqVO> list ();
    
    public FaqVO read (int faqno);
    
    public int update (FaqVO faqVO);
    
    public int delete (int faqno);

}
