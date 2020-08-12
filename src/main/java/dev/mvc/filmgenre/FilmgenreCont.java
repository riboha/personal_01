package dev.mvc.filmgenre;

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
public class FilmgenreCont {
  
  @Autowired
  @Qualifier("dev.mvc.filmgenre.FilmgenreProc")
  private FilmgenreProcInter filmgenreProc;
  
  /**
   * 殿废 贸府
   * @param filmgenreVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/filmgenre/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (FilmgenreVO filmgenreVO) {
    
    
    int cnt = 0;
    int duplicate = this.filmgenreProc.findduplicate(filmgenreVO);
    
    if (duplicate == 0) {
      cnt = this.filmgenreProc.create(filmgenreVO);
    }
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("duplicate", duplicate);
    
    return json.toString();
  }
  

  /**
   * 格废
   * @return
   *  http://localhost:9090/movie/filmgenre/list.do
   */
  @RequestMapping(value = "/filmgenre/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<FilmgenreVO> list = this.filmgenreProc.list();
    mav.addObject("list", list);
    mav.setViewName("/filmgenre/list");
    return mav;
  }
  
  
  /**
   * 昏力 贸府
   * @param filmgenreVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/filmgenre/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int filmgenreno) {
    
    int cnt = this.filmgenreProc.delete(filmgenreno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  
  


}
