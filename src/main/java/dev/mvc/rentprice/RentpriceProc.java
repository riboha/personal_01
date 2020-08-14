package dev.mvc.rentprice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.rentprice.RentpriceProc")
public class RentpriceProc implements RentpriceProcInter {
  
  
  @Autowired
  private RentpriceDAOInter rentpriceDAO;

  @Override
  // 등록
  public int create (RentpriceVO rentpriceVO) {
    int cnt = this.rentpriceDAO.create(rentpriceVO );
    return cnt;
  }

  @Override
  // 목록
  public ArrayList<RentpriceVO> list() {
    ArrayList<RentpriceVO> list = this.rentpriceDAO.list();
    return list;
  }

  @Override
  // 조회
  public RentpriceVO read(int rentpriceno) {
    RentpriceVO rentpriceVO = this.rentpriceDAO.read(rentpriceno);
    return rentpriceVO;
  }

  @Override
  // 수정
  public int update (RentpriceVO rentpriceVO) {
    int cnt = this.rentpriceDAO.update(rentpriceVO);
    return cnt;
  }

  @Override
  // 삭제
  public int delete(int rentpriceno) {
    int cnt = this.rentpriceDAO.delete(rentpriceno);
    return cnt;
  }
  


}
