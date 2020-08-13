package dev.mvc.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface MemberProcInter {
  
  public int create (MemberVO memberVO);
  
  public ArrayList<MemberVO> list ();
  
  public MemberVO read (int memberno);
  
  public int update (MemberVO memberVO);
  
  public int delete (int memberno);
  
  public int delete_img (int memberno);
  
  public int findduplicate_by_id (String id);
  public int findduplicate_by_nick (String nick);
  public int findduplicate_by_tel (int tel);
  public int findduplicate_by_email (String email);
  
  public int signin (Map<String, Object> map);
  
  public MemberVO read_by_id (String id);

}
