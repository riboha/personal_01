package dev.mvc.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter {

  @Autowired
  private ReviewDAOInter reviewDAO;

  @Override
  public int create(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.create(reviewVO);
    return cnt;
  }

  @Override
  public ArrayList<Member_Review_VO> review_list_by_memberno(int filmno) {
    ArrayList<Member_Review_VO> list = this.reviewDAO.review_list_by_memberno(filmno);
    return list;
  }

  @Override
  public ReviewVO read(int reviewno) {
    ReviewVO reviewVO = this.reviewDAO.read(reviewno);
    return reviewVO;
  }

  @Override
  public int update(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.update(reviewVO);
    return cnt;
  }

  @Override
  public int delete(int reviewno) {
    int cnt = this.reviewDAO.delete(reviewno);
    return cnt;
  }
  
  /**
   * 영화번호 별 평점 평균 
   * @param filmno
   * @return
   */
  @Override
  public double rate_by_filmno(int filmno) {
    double rate_by_filmno = this.reviewDAO.rate_by_filmno(filmno);
    return rate_by_filmno;
  }


  

}
