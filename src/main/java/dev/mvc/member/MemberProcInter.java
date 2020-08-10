package dev.mvc.member;

import java.util.ArrayList;

public interface MemberProcInter {
  
  public int create (MemberVO memberVO);
  
  public ArrayList<MemberVO> list ();
  
  public MemberVO read (int memberno);
  
  public int update (MemberVO memberVO);
  
  public int delete (int memberno);
  
  public int delete_img (int memberno);

}
