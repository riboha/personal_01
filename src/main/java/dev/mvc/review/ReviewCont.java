package dev.mvc.review;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.film.FilmProcInter;

@Controller
public class ReviewCont {
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier ("dev.mvc.film.FilmProc")
  private FilmProcInter filmProc;
  
 
  /**
   * 등록 처리
   * @param reviewVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (ReviewVO reviewVO) {
    
    System.out.println("Controller 진입");
    int cnt = this.reviewProc.create(reviewVO);
    int filmno = reviewVO.getFilmno();
    
    if (cnt != 0) {
      this.filmProc.update_rate(filmno);
    }
    System.out.println("★★★ 등록 처리 후 평균 평점 : " + this.reviewProc.rate_by_filmno(filmno));
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/review/read.do?dirno=1
   */
  @RequestMapping(value = "/review/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int reviewno) {
    ModelAndView mav = new ModelAndView();
    ReviewVO reviewVO = this.reviewProc.read(reviewno);
    mav.addObject("VO", reviewVO);
    mav.setViewName("/review/read");
    return mav;
  } 
  
  
  /**
   * 목록 (관리자용)
   * @return
   *  http://localhost:9090/movie/review/list.do
   */
  @RequestMapping(value = "/review/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();

    
    return mav;
  }
  
  
  /**
   * 목록 (고객 조회용)
   * @return
   *  http://localhost:9090/movie/review/list.do
   */
  @RequestMapping(value = "/review/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();

    return mav;
  }
  


  
  /**
   * 수정 처리
   * @param reviewVO
   * @param rereviewt 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (ReviewVO reviewVO) {
    
    int cnt = this.reviewProc.update(reviewVO);
    int filmno = reviewVO.getFilmno();
    
    if (cnt != 0) {
      this.filmProc.update_rate(filmno);
    }

    System.out.println("★★★수정 처리 후 평균 평점 : " + this.reviewProc.rate_by_filmno(filmno));
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 삭제 처리
   * @param reviewVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (int reviewno) {
    
    int filmno = this.reviewProc.read(reviewno).getFilmno();
    int cnt = this.reviewProc.delete(reviewno);
    
    if (cnt != 0) {
      this.filmProc.update_rate(filmno);
    }

    System.out.println("★★★삭제 처리 후 평균 평점 : " + this.reviewProc.rate_by_filmno(filmno));
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();
  }
  
  




}
