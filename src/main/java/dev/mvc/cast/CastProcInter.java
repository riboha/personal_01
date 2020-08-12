package dev.mvc.cast;

import java.util.ArrayList;

public interface CastProcInter {
  
  public int create (CastVO castVO);
  
  public ArrayList<Film_Actor_VO> cast_list_by_filmno (int filmno);

  public ArrayList<Film_Actor_VO> cast_list_by_actorno (int actorno);
  
  public CastVO read (int castno);
  
  public int update (CastVO castVO);
  
  public int delete (int castno);
  
}
