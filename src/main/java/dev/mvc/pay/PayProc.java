package dev.mvc.pay;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.pay.PayProc")
public class PayProc implements PayProcInter {
  
  @Autowired
  private PayDAOInter payDAO;

  @Override
  // 등록
  public int create (PayVO payVO) {
    int cnt = this.payDAO.create(payVO );
    return cnt;
  }

  @Override
  // 목록
  public ArrayList<PayVO> list() {
    ArrayList<PayVO> list = this.payDAO.list();
    return list;
  }

  @Override
  // 조회
  public PayVO read(int payno) {
    PayVO payVO = this.payDAO.read(payno);
    return payVO;
  }

  @Override
  // 수정
  public int update (PayVO payVO) {
    int cnt = this.payDAO.update(payVO);
    return cnt;
  }

  @Override
  // 삭제
  public int delete(int payno) {
    int cnt = this.payDAO.delete(payno);
    return cnt;
  }

  /**
   * Pay, Paytotal Join (memberno별 결제 내역) 
   * @param payno
   * @return
   */
  @Override
  public ArrayList<Paytotal_Pay_Film_VO> list_by_memberno(int memeberno) {
    ArrayList<Paytotal_Pay_Film_VO> list_by_memberno = this.payDAO.list_by_memberno(memeberno);
    return list_by_memberno;
  }


}
