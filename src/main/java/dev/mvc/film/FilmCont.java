package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
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

import dev.mvc.actor.ActorProcInter;
import dev.mvc.actor.ActorVO;
import dev.mvc.cast.CastProcInter;
import dev.mvc.cast.CastVO;
import dev.mvc.cast.Film_Actor_VO;
import dev.mvc.director.DirectorProcInter;
import dev.mvc.director.DirectorVO;
import dev.mvc.filmgenre.Film_Genre_VO;
import dev.mvc.filmgenre.FilmgenreProcInter;
import dev.mvc.filmgenre.FilmgenreVO;
import dev.mvc.genre.GenreProcInter;
import dev.mvc.genre.GenreVO;
import dev.mvc.language.LanguageProcInter;
import dev.mvc.language.LanguageVO;
import dev.mvc.photo.PhotoProcInter;
import dev.mvc.photo.PhotoVO;
import dev.mvc.promofilm.PromofilmProcInter;
import dev.mvc.promofilm.PromofilmVO;
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
  
  @Autowired
  @Qualifier("dev.mvc.promofilm.PromofilmProc")
  private PromofilmProcInter promofilmProc;
  
  @Autowired
  @Qualifier("dev.mvc.actor.ActorProc")
  private ActorProcInter actorProc;

  

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
      
    // ▷ 영화 레코드 생성
    int cnt = this.filmProc.create(filmVO);
    
    // ---------------------------------------------------------------------------------------
    // cnt, filmno return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> memVO <-----> MyBATIS
    // Spring과 MyBATIS가 MemVO를 공유하고 있음.
    // MyBATIS는 insert후 PK 컬럼인 mem_no변수에 새로 생성된 PK를 할당함.
    int filmno = filmVO.getFilmno();  // MyBATIS 리턴된 PK
    // ---------------------------------------------------------------------------------------
    
    // ▷ 가격 레코드 생성
    priceVO.setFilmno(filmno);
    this.rentpriceProc.create(priceVO);
    
    // ▷ 프로모션 레코드 생성 (default 0)
    PromofilmVO promofilmVO = new PromofilmVO();
    promofilmVO.setPromono(0);
    promofilmVO.setFilmno(filmno);
    this.promofilmProc.create(promofilmVO);
    
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
      @RequestParam(value="actornolist[]") List<Integer>actornolist,
      int filmno) {
    
    int cnt = 0;
    
    LanguageVO languageVO = new LanguageVO();
    FilmgenreVO filmgenreVO = new FilmgenreVO();
    QualityVO qualityVO = new QualityVO();
    CastVO castVO = new CastVO();
    
    int cnt_language = 0;
    int cnt_filmgenre = 0;
    int cnt_quality = 0;

    int languageno = filmno;
    int qualityno = filmno;
    
    if (this.languageProc.read(languageno)!= null) { this.languageProc.delete(languageno); }
    if (this.qualityProc.read(qualityno)!= null) { this.qualityProc.delete(qualityno); }
    if (this.filmgenreProc.count_by_filmno(filmno) > 0) { this.filmgenreProc.delete_by_filmno(filmno); }
    if (this.castProc.cast_list_by_filmno(filmno) != null) {
      ArrayList<Film_Actor_VO> film_actor_VO = this.castProc.cast_list_by_filmno(filmno);
      for (int i = 0; i < film_actor_VO.size(); i++) {
        this.castProc.delete(film_actor_VO.get(i).getCastno());
      }
    }
    
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
    cnt_language = this.languageProc.create(languageVO);

    qualityVO.setFilmno(filmno);
    cnt_quality = this.qualityProc.create(qualityVO);
    
    for (int i = 0; i <actornolist.size(); i++) {
      castVO.setFilmno(filmno);
      castVO.setActorno(actornolist.get(i));
      this.castProc.create(castVO);
    }

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
    DirectorVO directorVO = this.directorProc.read(filmVO.getDirno());
    
    ArrayList<Film_Genre_VO> film_genre_VO_list  = this.filmgenreProc.filmgenre_list_by_filmno(filmno);
    ArrayList<GenreVO> genreVO_list = this.genreProc.list();
    ArrayList<Film_Actor_VO> film_actor_VO_list = this.castProc.cast_list_by_filmno(filmno);
    
    StringBuffer castlist = new StringBuffer();
    
    for (Film_Actor_VO vo : film_actor_VO_list) {
      castlist.append(vo.getActornamekr() + ' ' + '(' +  vo.getActorno() + ')' + ',' + ' ');
    }
    
    
    mav.addObject("filmVO", filmVO);
    mav.addObject("languageVO", languageVO);
    mav.addObject("qualityVO", qualityVO);
    mav.addObject("priceVO", priceVO);
    mav.addObject("directorVO", directorVO);
    
    mav.addObject("film_genre_VO_list", film_genre_VO_list);
    mav.addObject("genreVO_list", genreVO_list);
    // mav.addObject("film_actor_VO_list", film_actor_VO_list);
    mav.addObject("castlist", castlist);
    
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
    DirectorVO directorVO = this.directorProc.read(filmVO.getDirno());

    ArrayList<PhotoVO> photoVO_list= this.photoProc.list_by_filmno(filmno);
    ArrayList<Film_Genre_VO> film_genre_VO_list = this.filmgenreProc.filmgenre_list_by_filmno(filmno);
    ArrayList<Film_Actor_VO> film_actor_VO_list =  this.castProc.cast_list_by_filmno(filmno);
    ArrayList<Member_Review_VO> member_review_VO_list = this.reviewProc.review_list_by_memberno(filmno);
    ArrayList<Film_Actor_VO> film_review_VO_list = this.castProc.cast_list_by_filmno(filmno);
    
    mav.addObject("filmVO", filmVO);
    mav.addObject("languageVO", languageVO);
    mav.addObject("qualityVO", qualityVO);
    mav.addObject("priceVO", priceVO);
    mav.addObject("directorVO", directorVO);

    mav.addObject("photoVO_list", photoVO_list);
    mav.addObject("film_genre_VO_list", film_genre_VO_list);
    mav.addObject("film_actor_VO_list", film_actor_VO_list);
    mav.addObject("member_review_VO_list", member_review_VO_list);
    mav.addObject("film_review_VO_list", film_review_VO_list);
    
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
   * 목록 (회원용)
   * 페이징 + 검색 (화질, 언어, 장르)
   * @return
   *  http://localhost:9090/movie/film/list_customer.do
   */
  @RequestMapping(value = "/film/list_customer.do",
      method = RequestMethod.GET)
  public ModelAndView list_customer (
      @RequestParam(value="search_genre", required=false) String search_genre,
      @RequestParam(value="search_language",  required=false) String search_language,
      @RequestParam(value="search_quality",  required=false) String search_quality,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) {
    
    ModelAndView mav = new ModelAndView();

    //System.out.println("--> search_genre:" + search_genre + "◀");
    // System.out.println("--> search_language:" + search_language + "◀");
    // System.out.println("--> search_quality:" + search_quality + "◀");
    // System.out.println("--> nowPage:" + nowPage + "◀");
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("search_genre", search_genre );
    hashMap.put("search_language", search_language );
    hashMap.put("search_quality", search_quality );
    hashMap.put("nowPage", nowPage );
    
    // 검색 레코드 갯수
    int search_count = this.filmProc.search_count(hashMap);
    mav.addObject("search_count", search_count);
    //System.out.println("--> search_count: " + search_count);
    //System.out.println("♧♧♧♧♧♧♧♧♧♧♧♧♧♧♧♧");
    
    // 검색 목록
    ArrayList<FilmVO> list_paging_search = this.filmProc.list_paging_search(hashMap);
    mav.addObject("list_paging_search", list_paging_search);

    // 페이징 박스
    String paging = this.filmProc.pagingBox("list_customer.do", search_count, nowPage, search_genre, search_language, search_quality);
    mav.addObject("paging", paging);
    
    // 현재 페이지 번호
    mav.addObject("nowPage", nowPage);
    
    // 검색 조건
    if (search_genre == "") { mav.addObject("search_genre", "ALL"); } else { mav.addObject("search_genre", search_genre); }
    if (search_language == "") { mav.addObject("search_language", "ALL"); } else { mav.addObject("search_language", search_language); }
    if (search_quality == "") { mav.addObject("search_quality", "ALL"); } else { mav.addObject("search_quality", search_quality); }
    
    // 장르 리스트
    ArrayList<GenreVO>list_genre = this.genreProc.list();
    mav.addObject("list_genre", list_genre);

    ArrayList<FilmVO> filmVO_list = new ArrayList<>();
    ArrayList<QualityVO> qualityVO_list = new ArrayList<>();
    ArrayList<Film_Genre_VO> film_genre_VO_list = new ArrayList<>();
    
    int filmno = 0;
    
    for (int i = 0; i < list_paging_search.size() ; i++) {
      filmno = list_paging_search.get(i).getFilmno(); // filmno 추출
      
      filmVO_list.add(this.filmProc.read(filmno)); // filmno에 해당하는 filmVO 객체 저장
      qualityVO_list.add(this.qualityProc.read(filmno)); // filmno에 해당하는 QualityVO 객체 저장
      film_genre_VO_list.addAll(this.filmgenreProc.filmgenre_list_by_filmno(filmno)); // filmno에 해당하는 Film_Genre_VO 객체 저장
    }
    
    mav.addObject("filmVO_list", filmVO_list);
    mav.addObject("qualityVO_list", qualityVO_list);
    mav.addObject("film_genre_VO_list", film_genre_VO_list);
    
    mav.setViewName("/film/list_customer");
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
  
  
  /**
   * 감독 검색 자동 완성 list
   * @param filmVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/search_auto_dir.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String search_auto_dir (String search_dir, HttpServletResponse response) {

    ArrayList<DirectorVO> search_auto_list = this.directorProc.search_auto(search_dir);
    
    JSONArray array = new JSONArray();
    JSONObject json = null;

    for (DirectorVO vo : search_auto_list) {
      json = new JSONObject(); // 반복 할 때마다 객체를 새로 생성 → 기존 데이터 삭제, 덮어쓰기 방지
      
      json.put("dirnamekr", vo.getDirnamekr()); 
      json.put("dirnameen", vo.getDirnameen());
      json.put("dirno", vo.getDirno()); 
      array.put(json);
    }

    return array.toString();
  }

  /**
   * 배우 검색 자동 완성 list
   * @param filmVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/search_auto_actor.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String search_auto_actor (String search_dir, HttpServletResponse response) {
    
    ArrayList<ActorVO> search_auto_list = this.actorProc.search_auto(search_dir);
    
    JSONArray array = new JSONArray();
    JSONObject json = null;
    
    for (ActorVO vo : search_auto_list) {
      json = new JSONObject();
      
      json.put("actornamekr", vo.getActornamekr());
      json.put("actornameen", vo.getActornameen());
      json.put("actorno", vo.getActorno());
      array.put(json);
    }
    System.out.println(array.toString());
    return array.toString();
  }
  
  
  
}
