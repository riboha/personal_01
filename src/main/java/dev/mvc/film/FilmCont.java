package dev.mvc.film;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.director.DirectorProcInter;
import dev.mvc.filmgenre.Film_Genre_VO;
import dev.mvc.filmgenre.FilmgenreProcInter;
import dev.mvc.genre.GenreProcInter;
import dev.mvc.genre.GenreVO;
import dev.mvc.language.LanguageProcInter;
import dev.mvc.language.LanguageVO;
import dev.mvc.photo.PhotoProcInter;
import dev.mvc.photo.PhotoVO;
import dev.mvc.quality.QualityProcInter;
import dev.mvc.quality.QualityVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class FilmCont {

  @Autowired
  @Qualifier ("dev.mvc.film.FilmProc")
  private FilmProcInter filmProc;
  
  @Autowired
  @Qualifier ("dev.mvc.language.LanguageProc")
  private LanguageProcInter languageProc;
  
  @Autowired
  @Qualifier ("dev.mvc.quality.QualityProc")
  private QualityProcInter qualityProc;
  
  @Autowired
  @Qualifier("dev.mvc.photo.PhotoProc")
  private PhotoProcInter photoProc;
  
  @Autowired
  @Qualifier("dev.mvc.filmgenre.FilmgenreProc")
  private FilmgenreProcInter filmgenreProc;
  
  @Autowired
  @Qualifier("dev.mvc.director.DirectorProc")
  private DirectorProcInter directorProc;
  
  @Autowired
  @Qualifier("dev.mvc.genre.GenreProc")
  private GenreProcInter genreProc;
  

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/film/create.do
   */
  @RequestMapping(value = "/film/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<GenreVO> genreVO_list = this.genreProc.list();
    mav.addObject("genreVO_list", genreVO_list);

    mav.setViewName("/film/create");
    return mav;
  }
  
  
  /**
   * 등록 처리
   * @param genreVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, FilmVO filmVO, QualityVO qualityVO, LanguageVO languageVO, 
                            @RequestParam(value="genrelist[]") List<Integer> genrelist) {
    
    
    System.out.println("genrelist: " + genrelist);
    
//    
//    // =============파일 전송 코드===============
//        
//    String poster = "";
//    String posterthumb = "";
//    long postersize = 0;
//    
//    String upDir = Tool.getRealPath(request, "film/poster"); // 절대 경로
//     
//    MultipartFile mf = filmVO.getPosterMF();
//    postersize = mf.getSize();
//    if (postersize > 0) {
//      poster = Upload.saveFileSpring(mf, upDir);
//     
//      if (Tool.isImage(poster)) {
//        posterthumb = Tool.preview(upDir, poster, 150, 222);
//      }
//    }
//    // =============파일 전송 코드==============
//    
//    filmVO.setPoster(poster);
//    filmVO.setPosterthumb(posterthumb);
//    filmVO.setPostersize(postersize);
//      
//    int cnt = this.filmProc.create(filmVO);
//    
//    // ---------------------------------------------------------------------------------------
//    // cnt, filmno return 
//    // ---------------------------------------------------------------------------------------
//    // Spring <-----> memVO <-----> MyBATIS
//    // Spring과 MyBATIS가 MemVO를 공유하고 있음.
//    // MyBATIS는 insert후 PK 컬럼인 mem_no변수에 새로 생성된 PK를 할당함.
//    int filmno = filmVO.getFilmno();  // MyBATIS 리턴된 PK
//    // ---------------------------------------------------------------------------------------
//    
//    qualityVO.setFilmno(filmno);
//    languageVO.setFilmno(filmno);
//    int cnt_quality = this.qualityProc.create(qualityVO);
//    int cnt_language = this.languageProc.create(languageVO);
//    
//
//    
////    for (genreVO_list:genreVO_list.ge) {
////      this.filmgenreProc.create(filmgenreVO);
////      
////    }
    
    JSONObject json = new JSONObject();
//    json.put("cnt", cnt);
//    json.put("filmno", filmno);
    
    return json.toString();
  }
  
  
  /**
   * 조회 (관리자)
   * @return
   *  http://localhost:9090/movie/film/read.do?filmno=1
   */
  @RequestMapping(value = "/film/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int filmno) {
    ModelAndView mav = new ModelAndView();
    FilmVO filmVO = this.filmProc.read(filmno);
    LanguageVO languageVO = this.languageProc.read(filmno);
    QualityVO qualityVO = this.qualityProc.read(filmno);
    
    mav.addObject("filmVO", filmVO);
    mav.addObject("languageVO", languageVO);
    mav.addObject("qualityVO", qualityVO);
    mav.setViewName("/film/read");
    return mav;
  } 
  
  /**
   * 조회 (회원)
   * @return
   *  http://localhost:9090/movie/film/read.do?filmno=1
   */
  @RequestMapping(value = "/film/read_customer.do",
      method = RequestMethod.GET)
  public ModelAndView read_customer (int filmno) {
    ModelAndView mav = new ModelAndView();
    FilmVO filmVO = this.filmProc.read(filmno);
    LanguageVO languageVO = this.languageProc.read(filmno);
    QualityVO qualityVO = this.qualityProc.read(filmno);
    ArrayList<PhotoVO> photoVO_list= this.photoProc.list_by_filmno(filmno);
    ArrayList<Film_Genre_VO> film_genre_VO_list = this.filmgenreProc.filmgenre_list_by_filmno(filmno);
    String dirnamekr = this.directorProc.read(filmVO.getDirno()).getDirnamekr();
    
    mav.addObject("dirnamekr", dirnamekr);
    mav.addObject("filmVO", filmVO);
    mav.addObject("languageVO", languageVO);
    mav.addObject("qualityVO", qualityVO);
    mav.addObject("photoVO_list", photoVO_list);
    mav.addObject("film_genre_VO_list", film_genre_VO_list);
    mav.setViewName("/film/read_customer");
    return mav;
  } 

  

  /**
   * 목록
   * @return
   *  http://localhost:9090/movie/film/list.do
   */
  @RequestMapping(value = "/film/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<FilmVO> list = this.filmProc.list();
    mav.addObject("list", list);
    mav.setViewName("/film/list");
    return mav;
  }
  

  /**
   * 수정 처리
   * @param filmVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (FilmVO filmVO, HttpServletRequest request) {
    
    FilmVO filmVO_old = this.filmProc.read(filmVO.getFilmno());
    MultipartFile posterMF = filmVO.getPosterMF();
    
    String upDir = Tool.getRealPath(request, "film/poster"); 
    String poster = "";
    String posterthumb = "";
    
    long postersize = posterMF.getSize();
    long postersize_old = filmVO_old.getPostersize();
    System.out.println("postersize_old :" +postersize_old);
    System.out.println("postersize:" +postersize);
    
    if (postersize != 0) { 
      System.out.println("새롭게 올리는 경우");
      if (postersize_old == 0) { // 새로 업로드 X
        System.out.println("기존에 없음");
      } else { // 포스터 새로 업로드 O
        System.out.println("기존에 있음");
        Tool.deleteFile(upDir, filmVO_old.getPoster()); 
        Tool.deleteFile(upDir, filmVO_old.getPosterthumb()); 
      }
      postersize = filmVO.getPosterMF().getSize();
      poster = Upload.saveFileSpring(filmVO.getPosterMF(), upDir);
      if (Tool.isImage(poster)) {
        posterthumb = Tool.preview(upDir, poster, 150, 222);
      }
      
    } else { 
      System.out.println("새롭게 올리지 않는 경우");

      if (postersize_old != 0) {
        System.out.println("기존에 있음");
        
        postersize = filmVO_old.getPostersize();
        poster = filmVO_old.getPoster();
        posterthumb = filmVO_old.getPosterthumb();
        
      } else { 
        System.out.println("기존에 없음");
        poster = null;
        postersize = 0;
        posterthumb = null;
      }
    }
    filmVO.setPoster(poster);
    filmVO.setPosterthumb(posterthumb);
    filmVO.setPostersize(postersize);
    
    System.out.println(filmVO.toString());
    
    int cnt = this.filmProc.update(filmVO);
    System.out.println("처리 결과: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  /**
   * 삭제 처리
   * @param filmVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int filmno) {
    
    int cnt = this.filmProc.delete(filmno);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  

}
