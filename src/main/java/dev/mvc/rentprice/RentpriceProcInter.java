package dev.mvc.rentprice;

import java.util.ArrayList;

public interface RentpriceProcInter {
  
  /**
   * ���
   * @param hashMap
   * @return
   */
  public int create (RentpriceVO rentpriceVO);
  
  /**
   * ���
   * @return
   */
  public ArrayList<RentpriceVO> list ();
  
  /**
   * ��ȸ
   * @param rentpriceno
   * @return
   */
  public RentpriceVO read (int rentpriceno);
  
  /**
   * ����
   * @param hashMap
   * @return
   */
  public int update (RentpriceVO rentpriceVO);
  
  /**
   * ����
   * @param rentpriceno
   * @return
   */
  public int delete (int rentpriceno);
}
