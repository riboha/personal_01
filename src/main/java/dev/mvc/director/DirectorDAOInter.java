package dev.mvc.director;

import java.util.ArrayList;
import java.util.HashMap;


public interface DirectorDAOInter {
  
  /**
   * ���
   * <insert id="create" parameterType="DirectorVO">
   * @param awardVO
   * @return
   */
  public int create (DirectorVO directorVO);
  
  /**
   * ���
   * <select id="list" resultType="DirectorVO">
   * @return
   */
  public ArrayList<DirectorVO> list ();
  
  /**
   * ��ȸ
   * <select id="read" resultType="DirectorVO" parameterType="int">
   * @param awardno
   * @return
   */
  public DirectorVO read (int dirno);
  
  /**
   * ����
   * <update id="update" parameterType="HashMap" >
   * @param directorVO
   * @return
   */
  public int update (HashMap<String, Object> hashMap);
  
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param dirno
   * @return
   */
  public int delete (int dirno);
  
  /**
   * �˻� �ڵ��ϼ�
   * @param search_dir
   * @return
   */
  public ArrayList<DirectorVO> search_auto (String search_dir);

}
