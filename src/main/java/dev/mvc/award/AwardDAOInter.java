package dev.mvc.award;

import java.util.ArrayList;
import java.util.HashMap;

public interface AwardDAOInter {
  
  /**
   * 등록
   * <insert id="create" parameterType="AwardVO">
   * @param awardVO
   * @return
   */
  public int create (AwardVO awardVO);
  
  /**
   * 목록
   * <select id="list" resultType="AwardVO">   
   * @return
   */
  public ArrayList<AwardVO> list ();
  
  /**
   * 조회
   * <select id="read" resultType="AwardVO" parameterType="int">
   * @param awardno
   * @return
   */
  public AwardVO read (int awardno);
  
  /**
   * 수정
   * <update id="update" parameterType="AwardVO" >
   * @param hashMap
   * @return
   */
  public int update(AwardVO awardVO);
  
  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param awardno
   * @return
   */
  public int delete (int awardno);

}
