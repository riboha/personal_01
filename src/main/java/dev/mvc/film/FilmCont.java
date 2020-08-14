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

import dev.mvc.cast.CastProcInter;
import dev.mvc.cast.Film_Actor_VO;
import dev.mvc.director.DirectorProcInter;
import dev.mvc.filmgenre.Film_Genre_VO;
import dev.mvc.filmgenre.FilmgenreProcInter;
import dev.mvc.filmgenre.FilmgenreVO;
import dev.mvc.genre.GenreProcInter;
import dev.mvc.genre.GenreVO;
import dev.mvc.language.LanguageProcInter;
import dev.mvc.language.LanguageVO;
import dev.mvc.photo.PhotoProcInter;
import dev.mvc.photo.PhotoVO;
import dev.mvc.quality.QualityProcInter;
import dev.mvc.quality.QualityVO;
import dev.mvc.rentprice.RentpriceProcInter;
import dev.mvc.rentprice.RentpriceVO;
import dev.mvc.review.Member_Review_VO;
import dev.mvc.review.ReviewProcInter;
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
  
  @Autowired
  @Qualifier("dev.mvc.cast.CastProc")
  private CastProcInter castProc;
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier ("dev.mvc.rentprice.RentpriceProc")
  private RentpriceProcInter rentpriceProc;
  

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
   * 등록처리 1
   * @param request
   * @param filmVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/create1.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create1 (HttpServletRequest request, FilmVO filmVO, RentpriceVO priceVO) {
    
    // =============파일 전송 코드===============
        
    String poster = "";
    String posterthumb = "";
    long postersize = 0;
    
    String upDir = Tool.getRealPath(request, "film/poster"); // 절대 경로
     
    MultipartFile mf = filmVO.getPosterMF();
    postersize = mf.getSize();
    if (postersize > 0) {
      poster = Upload.saveFileSpring(mf, upDir);
     
      if (Tool.isImage(poster)) {
        posterthumb = Tool.preview(upDir, poster, 150, 222);
      }
    }
    // =============파일 전송 코드==============
    
    filmVO.setPoster(poster);
    filmVO.setPosterthumb(posterthumb);
    filmVO.setPostersize(postersize);
      
    int cnt = this.filmProc.create(filmVO);
    
    // ---------------------------------------------------------------------------------------
    // cnt, filmno return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> memVO <-----> MyBATIS
    // Spring과 MyBATIS가 MemVO를 공유하고 있음.
    // MyBATIS는 insert후 PK 컬럼인 mem_no변수에 새로 생성된 PK를 할당함.
    int filmno = filmVO.getFilmno();  // MyBATIS 리턴된 PK
    // ---------------------------------------------------------------------------------------
    
    priceVO.setFilmno(filmno);
    int cnt_price = this.rentpriceProc.create(priceVO);
    System.out.println("cnt_price: " + cnt_price);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("filmno", filmno);
    
    return json.toString();
  }
  

  /**
   * 등록처리 2 / 수정처리 2
   * @param request
   * @param genrelist
   * @param language
   * @param quality
   * @param filmno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/create2.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String create2 (HttpServletRequest request, 
      @RequestParam(value="genrelist[]") List<Integer>genrelist, 
      @RequestParam(value="languagelist[]") List<String>languagelist, 
      @RequestParam(value="qualitylist[]") List<String>qualitylist,
      int filmno) {
    
    int cnt = 0;
    
    LanguageVO languageVO = new LanguageVO();
    FilmgenreVO filmgenreVO = new FilmgenreVO();
    QualityVO qualityVO = new QualityVO();
    
    int cnt_language = 0;
    int cnt_filmgenre = 0;
    int cnt_quality = 0;

    int languageno = filmno;
    int qualityno = filmno;
    
    if (this.languageProc.read(languageno)!= null) { this.languageProc.delete(languageno); }
    if (this.qualityProc.read(qualityno)!= null) { this.qualityProc.delete(qualityno); }
    if (this.filmgenreProc.count_by_filmno(filmno) > 0) { this.filmgenreProc.delete_by_filmno(filmno); }
    
    if (languagelist.contains("kr")) {languageVO.setKr(1);}
    if (languagelist.contains("en")) {languageVO.setEn(1);}
    if (languagelist.contains("es")) {languageVO.setEs(1);}
    if (languagelist.contains("fr")) {languageVO.setFr(1);}
    if (languagelist.contains("pt")) {languageVO.setPt(1);}
    if (languagelist.contains("rs")) {languageVO.setRs(1);}
    if (languagelist.contains("ar")) {languageVO.setAr(1);}
    if (languagelist.contains("hi")) {languageVO.setHi(1);}
    if (languagelist.contains("de")) {languageVO.setDe(1);}
    if (languagelist.contains("jp")) {languageVO.setJp(1);}
    if (languagelist.contains("ch")) {languageVO.setCh(1);}
    if (qualitylist.contains("q576")) {qualityVO.setQ576(1);}
    if (qualitylist.contains("q720")) {qualityVO.setQ720(1);}
    if (qualitylist.contains("q1024")) {qualityVO.setQ1024(1);}
    if (qualitylist.contains("q1440")) {qualityVO.setQ1440(1);}
    
    languageVO.setFilmno(filmno);
    qualityVO.setFilmno(filmno);
    cnt_language = this.languageProc.create(languageVO);
    cnt_quality = this.qualityProc.create(qualityVO);

    for (int genreno : genrelist) {
      filmgenreVO.setFilmno(filmno);
      filmgenreVO.setGenreno(genreno);
      cnt_filmgenre += this.filmgenreProc.create(filmgenreVO);
    }
    
    if (cnt_filmgenre !=0 && cnt_quality != 0 && cnt_language != 0 ) {
      cnt = 1;
    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("filmno", filmno);
    
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
    RentpriceVO priceVO = this.rentpriceProc.read(filmno);
    
    ArrayList<Film_Genre_VO> film_genre_VO_list  = this.filmgenreProc.filmgenre_list_by_filmno(filmno);
    ArrayList<GenreVO> genreVO_list = this.genreProc.list();
    
    mav.addObject("filmVO", filmVO);
    mav.addObject("languageVO", languageVO);
    mav.addObject("qualityVO", qualityVO);
    mav.addObject("priceVO", priceVO);
    
    mav.addObject("film_genre_VO_list", film_genre_VO_list);
    mav.addObject("genreVO_list", genreVO_list);
    
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
    RentpriceVO priceVO = this.rentpriceProc.read(filmno);

    ArrayList<PhotoVO> photoVO_list= this.photoProc.list_by_filmno(filmno);
    ArrayList<Film_Genre_VO> film_genre_VO_list = this.filmgenreProc.filmgenre_list_by_filmno(filmno);
    ArrayList<Film_Actor_VO> film_actor_VO_list =  this.castProc.cast_list_by_filmno(filmno);
    ArrayList<Member_Review_VO> member_review_VO_list = this.reviewProc.review_list_by_memberno(filmno);
    String dirnamekr = this.directorProc.read(filmVO.getDirno()).getDirnamekr();
    

    
    mav.addObject("filmVO", filmVO);
    mav.addObject("languageVO", languageVO);
    mav.addObject("qualityVO", qualityVO);
    mav.addObject("priceVO", priceVO);
    mav.addObject("dirnamekr", dirnamekr);

    mav.addObject("photoVO_list", photoVO_list);
    
    mav.addObject("film_genre_VO_list", film_genre_VO_list);
    mav.addObject("film_actor_VO_list", film_actor_VO_list);
    mav.addObject("member_review_VO_list", member_review_VO_list);
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
   * 수정 처리 1
   * @param filmVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/update1.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update1 (HttpServletRequest request, FilmVO filmVO, RentpriceVO priceVO) {
    
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
    
    // System.out.println(filmVO.toString());
    
    System.out.println("getDay1 결과: " + priceVO.getDay1());
    
    
    int cnt = this.filmProc.update(filmVO);
    int cnt_price = this.rentpriceProc.update(priceVO);
    System.out.println("처리 결과: " + cnt);
    System.out.println("cnt_price: " + cnt_price);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("filmno", filmVO.getFilmno());
    
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
    
    this.languageProc.delete(filmno);
    this.qualityProc.delete(filmno);
    this.rentpriceProc.delete(filmno);
    this.castProc.delete(filmno);
    
    int cnt = this.filmProc.delete(filmno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  

}
