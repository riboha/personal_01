package dev.mvc.qcate;

import java.util.ArrayList;

public interface QcateDAOInter {
  
  public int create (QcateVO qcateVO);
  
  public ArrayList<QcateVO> list ();
  
  public QcateVO read (int qcateno);
  
  public int update (QcateVO qcateVO);
  
  public int delete (int qcateno);

}
