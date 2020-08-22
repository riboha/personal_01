 package dev.mvc.cast;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cast.CastProc")
public class CastProc implements CastProcInter{
  
  @Autowired
  private CastDAOInter castDAO;

  // 등록
  @Override
  public int create(CastVO castVO) {
    int cnt = this.castDAO.create(castVO);
    return cnt;
  }

  
  // 목록 (영화번호 별)
  @Override
  public ArrayList<Film_Actor_VO> cast_list_by_filmno(int filmno) {
    ArrayList<Film_Actor_VO> list = this.castDAO.cast_list_by_filmno(filmno);
    return list;
  }

  
  // 목록 (배우번호 별)
  @Override 
  public ArrayList<Film_Actor_VO> cast_list_by_actorno(int actorno) {
    ArrayList<Film_Actor_VO> list = this.castDAO.cast_list_by_actorno(actorno);
    return list;
  }


  // 조회
  @Override
  public CastVO read(int castno) {
    CastVO castVO = this.castDAO.read(castno);
    return castVO;
  }

  // 수정
  @Override
  public int update(CastVO castVO) {
    int cnt = this.castDAO.update(castVO);
    return cnt;
  }

  // 삭제
  @Override
  public int delete(int castno) {
    int cnt = this.castDAO.delete(castno);
    return cnt;
  }

  
}
