package dev.mvc.promotion;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.promotion.PromotionProc")
public class PromotionProc implements PromotionProcInter{
  
  @Autowired
  private PromotionDAOInter promotionDAO;

  // ���
  @Override
  public int create(PromotionVO promotionVO) {
    int cnt = this.promotionDAO.create(promotionVO);
    return cnt;
  }

  // ���
  @Override
  public ArrayList<PromotionVO> list() {
    ArrayList<PromotionVO> list = this.promotionDAO.list();
    return list;
  }

  // ��ȸ
  @Override
  public PromotionVO read(int promono) {
    PromotionVO promotionVO = this.promotionDAO.read(promono);
    return promotionVO;
  }

  // ����
  @Override
  public int update(PromotionVO promotionVO) {
    int cnt = this.promotionDAO.update(promotionVO);
    return cnt;
  }

  // ����
  @Override
  public int delete(int promono) {
    int cnt = this.promotionDAO.delete(promono);
    return cnt;
  }



  


}
