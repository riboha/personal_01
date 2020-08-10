package dev.mvc.film;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.language.LanguageProcInter;
import dev.mvc.language.LanguageVO;
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

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/film/create.do
   */
  @RequestMapping(value = "/film/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/film/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param genreVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/film/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, FilmVO filmVO, QualityVO qualityVO, LanguageVO languageVO) {
    
    
    // =============���� ���� �ڵ�===============
        
    String poster = "";
    String posterthumb = "";
    long postersize = 0;
    
    String upDir = Tool.getRealPath(request, "film/poster"); // ���� ���
     
    MultipartFile mf = filmVO.getPosterMF();
    postersize = mf.getSize();
    if (postersize > 0) {
      poster = Upload.saveFileSpring(mf, upDir);
     
      if (Tool.isImage(poster)) {
        posterthumb = Tool.preview(upDir, poster, 150, 222);
      }
    }
    // =============���� ���� �ڵ�==============
    
    filmVO.setPoster(poster);
    filmVO.setPosterthumb(posterthumb);
    filmVO.setPostersize(postersize);
      
    int cnt = this.filmProc.create(filmVO);
    
    // ---------------------------------------------------------------------------------------
    // cnt, filmno return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> memVO <-----> MyBATIS
    // Spring�� MyBATIS�� MemVO�� �����ϰ� ����.
    // MyBATIS�� insert�� PK �÷��� mem_no������ ���� ������ PK�� �Ҵ���.
    int filmno = filmVO.getFilmno();  // MyBATIS ���ϵ� PK
    // ---------------------------------------------------------------------------------------
    
    
    // ȭ��, ��� ���
    HashMap<String, Object> hashMap = new HashMap<>();
    hashMap.put("filmno", filmno);

    hashMap.put("q576", qualityVO.getQ576());
    hashMap.put("q720", qualityVO.getQ720());
    hashMap.put("q1024", qualityVO.getQ1024());
    hashMap.put("q1440", qualityVO.getQ1440());
    
    hashMap.put("kr", languageVO.getKr());
    hashMap.put("en", languageVO.getEn());
    hashMap.put("es", languageVO.getEs());
    hashMap.put("fr", languageVO.getFr());
    hashMap.put("pt", languageVO.getPt());
    hashMap.put("rs", languageVO.getRs());
    hashMap.put("ar", languageVO.getAr());
    hashMap.put("hi", languageVO.getHi());
    hashMap.put("de", languageVO.getDe());
    hashMap.put("jp", languageVO.getJp());
    hashMap.put("ch", languageVO.getCh());
    
    int cnt_quality = this.qualityProc.create(hashMap);
    int cnt_language = this.languageProc.create(hashMap);
    
    System.out.println("cnt_language: " + cnt_language);
    // int cnt_language = this.languageProc.create(hashMap);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("filmno", filmno);
    
    return json.toString();
  }
  
  
  /**
   * ��ȸ (������)
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
   * ��ȸ (ȸ��)
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
    mav.addObject("filmVO", filmVO);
    mav.addObject("languageVO", languageVO);
    mav.addObject("qualityVO", qualityVO);
    mav.setViewName("/film/read_customer");
    return mav;
  } 

  

  /**
   * ���
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
   * ���� ó��
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
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("filmno", filmVO.getFilmno());
    hashMap.put("dirno", filmVO.getDirno());
    hashMap.put("titlekr", filmVO.getTitlekr());
    hashMap.put("titleen", filmVO.getTitleen());
    hashMap.put("lan", filmVO.getLan());
    hashMap.put("year", filmVO.getYear());
    hashMap.put("len", filmVO.getLen());
    hashMap.put("summary", filmVO.getSummary());
    hashMap.put("restrict", filmVO.getRestrict());
    hashMap.put("youtube", filmVO.getYoutube());
    hashMap.put("url", filmVO.getUrl());
    
    
    String upDir = Tool.getRealPath(request, "film/poster"); 
    String poster = "";
    String posterthumb = "";
    long postersize;
    
    // Optional ���, nullpointerexception ó���ϱ�
//    Optional<MultipartFile> mf = Optional.ofNullable(filmVO.getPosterMF());
//    
//    postersize = mf.get().getSize();
//    System.out.println("postersize: " + postersize);
    
    long mf_old_size = filmVO_old.getPostersize();
    long mf_new_size = filmVO.getPostersize();
    
    System.out.println("mf_old_size :" +mf_old_size);
    System.out.println(" mf_new_size:" +mf_new_size);
    
    
    if (mf_old_size != 0) { // ���� ������ O
      if (mf_new_size == 0) { // ���� ���ε� X
        System.out.println("���� ������ O + ���� ���ε� X");
        
        postersize = 0;
        poster = filmVO_old.getPoster();
        posterthumb = filmVO_old.getPosterthumb();
        
      } else { // ������ ���� ���ε� O
        System.out.println("���� ������ O + ���� ���ε� O");

        
        Tool.deleteFile(upDir, filmVO_old.getPoster()); 
        Tool.deleteFile(upDir, filmVO_old.getPosterthumb()); 
        
        postersize = filmVO.getPosterMF().getSize();
        poster = Upload.saveFileSpring(filmVO.getPosterMF(), upDir);
        if (Tool.isImage(poster)) {
          posterthumb = Tool.preview(upDir, poster, 150, 222);
        }
      }
    } else { // ���� ������ X
      if (mf_new_size == 0) { // ������ ���� ���ε� X
        System.out.println("���� ������ X + ���� ���ε� X");
        
        postersize = 0;
        poster = null;
        posterthumb = null;
        
      } else { // ������ ���� ���ε� O
        System.out.println("���� ������ X + ���� ���ε� O");

        postersize = filmVO.getPosterMF().getSize();
        poster = Upload.saveFileSpring(filmVO.getPosterMF(), upDir);
        if (Tool.isImage(poster)) {
          posterthumb = Tool.preview(upDir, poster, 150, 222);
        }
      }
    }
    
    hashMap.put("poster", poster);
    hashMap.put("posterthumb", posterthumb);
    hashMap.put("postersize", postersize);
    
    
    System.out.println(filmVO.toString());
    
    int cnt = this.filmProc.update(hashMap);
    System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  /**
   * ���� ó��
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
