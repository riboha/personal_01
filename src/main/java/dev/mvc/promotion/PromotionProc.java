package dev.mvc.promotion;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.promotion.PromotionProc")
public class PromotionProc implements PromotionProcInter{
  
  @Autowired
  private PromotionDAOInter promotionDAO;

  // 등록
  @Override
  public int create(PromotionVO promotionVO) {
    int cnt = this.promotionDAO.create(promotionVO);
    return cnt;
  }

  // 목록
  @Override
  public ArrayList<PromotionVO> list() {
    ArrayList<PromotionVO> list = this.promotionDAO.list();
    return list;
  }

  // 조회
  @Override
  public PromotionVO read(int promotionno) {
    PromotionVO promotionVO = this.promotionDAO.read(promotionno);
    return promotionVO;
  }

  // 수정
  @Override
  public int update(PromotionVO promotionVO) {
    int cnt = this.promotionDAO.update(promotionVO);
    return cnt;
  }

  // 삭제
  @Override
  public int delete(int promotionno) {
    int cnt = this.promotionDAO.delete(promotionno);
    return cnt;
  }



  


}
