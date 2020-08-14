package dev.mvc.rentprice;

import java.util.ArrayList;

public interface RentpriceProcInter {
  
  /**
   * 등록
   * @param hashMap
   * @return
   */
  public int create (RentpriceVO rentpriceVO);
  
  /**
   * 목록
   * @return
   */
  public ArrayList<RentpriceVO> list ();
  
  /**
   * 조회
   * @param rentpriceno
   * @return
   */
  public RentpriceVO read (int rentpriceno);
  
  /**
   * 수정
   * @param hashMap
   * @return
   */
  public int update (RentpriceVO rentpriceVO);
  
  /**
   * 삭제
   * @param rentpriceno
   * @return
   */
  public int delete (int rentpriceno);
}
