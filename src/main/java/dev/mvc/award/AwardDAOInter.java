package dev.mvc.award;

import java.util.ArrayList;
import java.util.HashMap;

public interface AwardDAOInter {
  
  /**
   * ���
   * <insert id="create" parameterType="AwardVO">
   * @param awardVO
   * @return
   */
  public int create (AwardVO awardVO);
  
  /**
   * ���
   * <select id="list" resultType="AwardVO">   
   * @return
   */
  public ArrayList<AwardVO> list ();
  
  /**
   * ��ȸ
   * <select id="read" resultType="AwardVO" parameterType="int">
   * @param awardno
   * @return
   */
  public AwardVO read (int awardno);
  
  /**
   * ����
   * <update id="update" parameterType="AwardVO" >
   * @param hashMap
   * @return
   */
  public int update(AwardVO awardVO);
  
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param awardno
   * @return
   */
  public int delete (int awardno);

}
