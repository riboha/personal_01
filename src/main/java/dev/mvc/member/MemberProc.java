package dev.mvc.member;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {

  @Autowired
  private MemberDAOInter memberDAO;

  @Override
  public int create(MemberVO memberVO) {
    int cnt = this.memberDAO.create(memberVO);
    return cnt;
  }

  @Override
  public ArrayList<MemberVO> list() {
    ArrayList<MemberVO> list = this.memberDAO.list();
    return list;
  }

  @Override
  public MemberVO read(int memberno) {
    MemberVO memberVO = this.memberDAO.read(memberno);
    return memberVO;
  }

  @Override
  public int update(MemberVO memberVO) {
    int cnt = this.memberDAO.update(memberVO);
    return cnt;
  }

  @Override
  public int delete(int memberno) {
    int cnt = this.memberDAO.delete(memberno);
    return cnt;
  }

  @Override
  public int delete_img(int memberno) {
    int cnt = this.memberDAO.delete_img(memberno);
    return cnt;
  }


  @Override
  public int signin(Map<String, Object> map) {
    int cnt = this.memberDAO.signin(map);
    return cnt;
  }
  
  @Override
  public MemberVO read_by_id(String id) {
    MemberVO memberVO = this.memberDAO.read_by_id(id);
    return memberVO;
  }

  
  @Override
  public int findduplicate_by_id(String id) {
    int cnt = this.memberDAO.findduplicate_by_id(id);
    return cnt;
  }

  @Override
  public int findduplicate_by_nick(String nick) {
    int cnt = this.memberDAO.findduplicate_by_nick(nick);
    return cnt;
  }

  @Override
  public int findduplicate_by_tel(int tel) {
    int cnt = this.memberDAO.findduplicate_by_tel(tel);
    return cnt;
  }

  @Override
  public int findduplicate_by_email(String email) {
    int cnt = this.memberDAO.findduplicate_by_email(email);
    return cnt;
  }

  @Override
  // 포인트 업데이트
  public int update_pnt(MemberVO memberVO) {
    int cnt = this.memberDAO.update_pnt(memberVO);
    return cnt;
  }
  

}
