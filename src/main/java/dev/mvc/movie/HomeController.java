package dev.mvc.movie;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.film.FilmProcInter;
import dev.mvc.film.FilmVO;
import dev.mvc.filmgenre.Film_Genre_VO;
import dev.mvc.filmgenre.FilmgenreProcInter;

@Controller
public class HomeController {
  
  @Autowired
  @Qualifier ("dev.mvc.film.FilmProc")
  private FilmProcInter filmProc;
  
  @Autowired
  @Qualifier("dev.mvc.filmgenre.FilmgenreProc")
  private FilmgenreProcInter filmgenreProc;
	
  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public ModelAndView home(Locale locale, Model model) {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<FilmVO> list_6_main = this.filmProc.list_6_main();
    ArrayList<Film_Genre_VO> list_6_main_genre = this.filmgenreProc.list_6_main_genre();
    
    mav.addObject("list_6_main", list_6_main);
    mav.addObject("list_6_main_genre", list_6_main_genre);
    mav.setViewName("/index");
    return mav;

    // return "index";  // /movie/index.jsp
  }
  
	
}
