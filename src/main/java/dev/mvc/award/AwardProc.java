package dev.mvc.award;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.award.AwardProc")
public class AwardProc implements AwardProcInter{

  @Autowired
  private AwardDAOInter awardDAO;

  // 등록
  @Override
  public int create(AwardVO awardVO) {
    int cnt = this.awardDAO.create(awardVO);
    return cnt;
  }

  // 목록
  @Override
  public ArrayList<AwardVO> list() {
    ArrayList<AwardVO> list = this.awardDAO.list();
    return list;
  }

  // 조회
  @Override
  public AwardVO read(int awardno) {
    AwardVO awardVO = this.awardDAO.read(awardno);
    return awardVO;
  }

  // 수정
  @Override
  public int update (AwardVO awardVO) {
    int cnt = this.awardDAO.update(awardVO);
    return cnt;
  }

  // 삭제
  @Override
  public int delete(int awardno) {
    int cnt = this.awardDAO.delete(awardno);
    return cnt;
  }
  
  

}
