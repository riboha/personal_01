package dev.mvc.filmfav;

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
public class FilmfavCont {
  
  @Autowired
  @Qualifier("dev.mvc.filmfav.FilmfavProc")
  private FilmfavProcInter filmfavProc;
  
  /**
   * 殿废 贸府
   * @param filmfavVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/filmfav/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (FilmfavVO filmfavVO) {
    
    int cnt = 0;
    int duplicate = this.filmfavProc.findduplicate(filmfavVO);
    
    if (duplicate == 0) {
      cnt = this.filmfavProc.create(filmfavVO);
    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("duplicate", duplicate);
    
    return json.toString();
  }
  

  /**
   * 格废
   * @return
   *  http://localhost:9090/movie/filmfav/list.do
   */
  @RequestMapping(value = "/filmfav/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<FilmfavVO> list = this.filmfavProc.list();
    mav.addObject("list", list);
    mav.setViewName("/filmfav/list");
    return mav;
  }
  
  
  /**
   * 昏力 贸府
   * @param filmfavVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/filmfav/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int filmfavno) {
    
    int cnt = this.filmfavProc.delete(filmfavno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  
  


}
