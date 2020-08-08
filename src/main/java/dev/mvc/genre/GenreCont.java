package dev.mvc.genre;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GenreCont {
  
  @Autowired
  @Qualifier("dev.mvc.genre.GenreProc")
  private GenreProcInter genreProc;
  

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/genre/create.do
   */
  @RequestMapping(value = "/genre/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genre/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param genreVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genre/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (GenreVO genreVO) {
    
    System.out.println("Controller ����");
    
    int cnt = this.genreProc.create(genreVO);
    
    System.out.println("ó�� ��� cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/genre/read.do?dirno=1
   */
  @RequestMapping(value = "/genre/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int genreno) {
    ModelAndView mav = new ModelAndView();
    GenreVO genreVO = this.genreProc.read(genreno);
    mav.addObject("genreVO", genreVO);
    mav.setViewName("/genre/read");
    return mav;
  } 
  
  /**
   * ���
   * @return
   *  http://localhost:9090/movie/genre/list.do
   */
  @RequestMapping(value = "/genre/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<GenreVO> list = this.genreProc.list();
    mav.addObject("list", list);
    mav.setViewName("/genre/list");
    return mav;
  }
  


  /**
   * ���� ��
   * @return
   *  http://localhost:9090/movie/genre/update.do
   */
  @RequestMapping(value = "/genre/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int genreno) {
    ModelAndView mav = new ModelAndView();
    GenreVO genreVO = this.genreProc.read(genreno);
    mav.addObject("genreVO", genreVO);
    mav.setViewName("/genre/update");
    return mav;
  }
  
  /**
   * ���� ó��
   * @param genreVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genre/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (GenreVO genreVO) {
    
    HashMap<String, Object> hashMap = new HashMap<>();
    
    hashMap.put("genreno", genreVO.getGenreno());
    hashMap.put("genrename", genreVO.getGenrename());
    hashMap.put("genreseq", genreVO.getGenreseq());
    
    int cnt = this.genreProc.update(hashMap);
    System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * ���� ó��
   * @param genreVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genre/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int genreno) {
    
    int cnt = this.genreProc.delete(genreno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  
  

}
