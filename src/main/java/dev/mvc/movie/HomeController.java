package dev.mvc.movie;

import java.util.Locale;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class HomeController {
	
  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public String home(Locale locale, Model model) {

    return "index";  // /movie/index.jsp
  }
  
	
}
