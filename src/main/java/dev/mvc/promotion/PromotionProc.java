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
  public PromotionVO read(int promono) {
    PromotionVO promotionVO = this.promotionDAO.read(promono);
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
  public int delete(int promono) {
    int cnt = this.promotionDAO.delete(promono);
    return cnt;
  }



  


}
