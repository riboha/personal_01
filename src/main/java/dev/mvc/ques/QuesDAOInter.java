package dev.mvc.ques;

import java.util.ArrayList;

public interface QuesDAOInter {
  
  public int create (QuesVO quesVO);
  
  public ArrayList<QuesVO> list ();
  
  public QuesVO read (int quesno);
  
  public int update (QuesVO quesVO);
  
  public int delete (int quesno);

}
