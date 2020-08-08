package dev.mvc.keyword;

import java.util.ArrayList;

public interface KeywordDAOInter {
  
  public int create (KeywordVO keywordVO);
  
  public ArrayList<KeywordVO> list ();
  
  public KeywordVO read (int keywordno);
  
  public int update (KeywordVO keywordVO);
  
  public int delete (int keywordno);

}
