package dev.mvc.director;

import java.util.ArrayList;
import java.util.HashMap;


public interface DirectorDAOInter {
  
  /**
   * 등록
   * <insert id="create" parameterType="DirectorVO">
   * @param awardVO
   * @return
   */
  public int create (DirectorVO directorVO);
  
  /**
   * 목록
   * <select id="list" resultType="DirectorVO">
   * @return
   */
  public ArrayList<DirectorVO> list ();
  
  /**
   * 조회
   * <select id="read" resultType="DirectorVO" parameterType="int">
   * @param awardno
   * @return
   */
  public DirectorVO read (int dirno);
  
  /**
   * 수정
   * <update id="update" parameterType="HashMap" >
   * @param directorVO
   * @return
   */
  public int update (HashMap<String, Object> hashMap);
  
  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param dirno
   * @return
   */
  public int delete (int dirno);
  
  /**
   * 검색 자동완성
   * @param search_dir
   * @return
   */
  public ArrayList<DirectorVO> search_auto (String search_dir);

}
