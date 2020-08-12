package dev.mvc.filmwish;

import java.util.ArrayList;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FilmwishCont {
  
  @Autowired
  @Qualifier("dev.mvc.filmwish.FilmwishProc")
  private FilmwishProcInter filmwishProc;
  
  /**
   * 등록 처리
   * @param filmwishVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/filmwish/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (FilmwishVO filmwishVO) {
    
    int cnt = 0;
    int duplicate = this.filmwishProc.findduplicate(filmwishVO); 
    
    if (duplicate == 0) { // 중복 레코드 체크
      cnt = this.filmwishProc.create(filmwishVO);
    }
    
    System.out.println("cnt: " + cnt);
    System.out.println("duplicate: " + duplicate);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("duplicate", duplicate);
    
    return json.toString();
  }
  

  /**
   * 목록
   * @return
   *  http://localhost:9090/movie/filmwish/list.do
   */
  @RequestMapping(value = "/filmwish/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<FilmwishVO> list = this.filmwishProc.list();
    mav.addObject("list", list);
    mav.setViewName("/filmwish/list");
    return mav;
  }
  
  
  /**
   * 삭제 처리
   * @param filmwishVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/filmwish/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int filmwishno) {
    
    int cnt = this.filmwishProc.delete(filmwishno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  
  


}
