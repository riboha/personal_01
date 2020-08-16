package dev.mvc.paytotal;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.paytotal.PaytotalProc")
public class PaytotalProc implements PaytotalProcInter {
  
  @Autowired
  private PaytotalDAOInter paytotalDAO;

  @Override
  // 등록
  public int create (PaytotalVO paytotalVO) {
    int cnt = this.paytotalDAO.create(paytotalVO);
    return cnt;
  }

  @Override
  // 목록
  public ArrayList<PaytotalVO> list() {
    ArrayList<PaytotalVO> list = this.paytotalDAO.list();
    return list;
  }

  @Override
  // 조회
  public PaytotalVO read(int paytotalno) {
    PaytotalVO paytotalVO = this.paytotalDAO.read(paytotalno);
    return paytotalVO;
  }

  @Override
  // 수정
  public int update (PaytotalVO paytotalVO) {
    int cnt = this.paytotalDAO.update(paytotalVO);
    return cnt;
  }

  @Override
  // 삭제
  public int delete(int paytotalno) {
    int cnt = this.paytotalDAO.delete(paytotalno);
    return cnt;
  }
  


}
