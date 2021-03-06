package dev.mvc.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import dev.mvc.actorfav.ActorfavProcInter;
import dev.mvc.actorfav.Member_Actor_VO;
import dev.mvc.cart.CartProcInter;
import dev.mvc.directorfav.DirectorfavProcInter;
import dev.mvc.directorfav.Member_Director_VO;
import dev.mvc.filmfav.FilmfavProcInter;
import dev.mvc.filmwish.FilmwishProcInter;
import dev.mvc.pay.PayProcInter;
import dev.mvc.paytotal.PaytotalProcInter;
import dev.mvc.ques.QuesProcInter;
import dev.mvc.review.ReviewProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class MemberCont {
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.filmfav.FilmfavProc")
  private FilmfavProcInter filmfavProc;
  
  @Autowired
  @Qualifier("dev.mvc.filmwish.FilmwishProc")
  private FilmwishProcInter filmwishProc;
  
  @Autowired
  @Qualifier("dev.mvc.actorfav.ActorfavProc")
  private ActorfavProcInter actorfavProc;
  
  @Autowired
  @Qualifier("dev.mvc.directorfav.DirectorfavProc")
  private DirectorfavProcInter directorfavProc;
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier ("dev.mvc.pay.PayProc")
  private PayProcInter payProc;
  
  @Autowired
  @Qualifier ("dev.mvc.paytotal.PaytotalProc")
  private PaytotalProcInter paytotalProc;
  
  @Autowired
  @Qualifier("dev.mvc.ques.QuesProc")
  private QuesProcInter quesProc;
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/member/create.do
   */
  @RequestMapping(value = "/member/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/create");
    return mav;
  }
  
  
  /**
   * 등록 처리
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, MemberVO memberVO) {
    
    System.out.println("Controller 진입");
    // =============파일 전송 코드===============
    
    String mempic = "";
    String memthumb = "";
    long mempicsize = 0;
    
    String upDir = Tool.getRealPath(request, "member/prof"); // 절대 경로
     
    MultipartFile mf = memberVO.getMempicMF();
    mempicsize = mf.getSize();
    if (mempicsize > 0) {
      mempic = Upload.saveFileSpring(mf, upDir);
     
      if (Tool.isImage(mempic)) {
        memthumb = Tool.preview(upDir, mempic, 300, 300);
      }
    }
    // =============파일 전송 코드===============
       
    memberVO.setMempic(mempic);
    memberVO.setMemthumb(memthumb);
    memberVO.setMempicsize(mempicsize);
     
    int cnt = this.memberProc.create(memberVO);
    
    
     System.out.println("처리 결과 cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * 비밀번호 확인
   * @return
   *  http://localhost:9090/movie/member/pw_check.do?dirno=1
   */
  @RequestMapping(value = "/member/pw_check.do",
                            method = RequestMethod.GET)
  public ModelAndView pw_check (int memberno) {
    ModelAndView mav = new ModelAndView();
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("VO", memberVO);
    mav.setViewName("/member/pw_check");
    return mav;
  } 
  
  
  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/member/read.do?dirno=1
   */
  @RequestMapping(value = "/member/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int memberno) {
    ModelAndView mav = new ModelAndView();
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("VO", memberVO);
    mav.setViewName("/member/read");
    return mav;
  } 
  
  
  /**
   * 목록 (관리자용)
   * @return
   *  http://localhost:9090/movie/member/list.do
   */
  @RequestMapping(value = "/member/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<MemberVO> list = this.memberProc.list();
    mav.addObject("list", list);
    mav.setViewName("/member/list_admin");
    return mav;
  }
  
  
  /**
   * 목록 (고객 조회용)
   * @return
   *  http://localhost:9090/movie/member/list.do
   */
  @RequestMapping(value = "/member/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();
    ArrayList<MemberVO> list = this.memberProc.list();
    mav.addObject("list", list);
    mav.setViewName("/member/list_");
    return mav;
  }

  
  /**
   * 좋아요 목록 (영화 / 배우 / 감독 / 장르)
   * @return
   *  http://localhost:9090/movie/member/list_fav.do
   */
  @RequestMapping(value = "/member/list_fav.do",
      method = RequestMethod.GET)
  public ModelAndView list_fav (HttpSession session) {
    
    int memberno = 1;
    // int memberno = (int)session.getAttribute("memberno");
    
    ModelAndView mav = new ModelAndView();
    
    ArrayList<dev.mvc.filmfav.Member_Film_wish_VO> filmfavlist = this.filmfavProc.list_by_memberno(memberno);
    ArrayList<dev.mvc.filmwish.Member_Film_fav_VO> filmwishlist = this.filmwishProc.list_by_memberno(memberno);
    ArrayList<Member_Actor_VO> actorfavlist = this.actorfavProc.list_by_memberno(memberno);
    ArrayList<Member_Director_VO> directorfavlist =  this.directorfavProc.list_by_memberno(memberno);
    
    mav.addObject("filmfavlist", filmfavlist);
    mav.addObject("filmwishlist", filmwishlist);
    mav.addObject("actorfavlist", actorfavlist);
    mav.addObject("directorfavlist", directorfavlist);

    mav.setViewName("/member/list_fav");
    return mav;
  }
  


  
  /**
   * 수정 처리
   * @param memberVO
   * @param remembert 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (HttpServletRequest request, MemberVO memberVO) {
    
    String upDir = Tool.getRealPath(request, "member/prof"); // 절대 경로
    MemberVO memberVO_old = this.memberProc.read(memberVO.getMemberno());
    MultipartFile mempicMF = memberVO.getMempicMF();

    String mempic = "";
    String memthumb = "";
    long mempicsize = mempicMF.getSize();
    long mempicsize_old = memberVO_old.getMempicsize();
    System.out.println("mempicsize: " + mempicsize);
    System.out.println("mempicsize_old: " + mempicsize_old);
    
    if (mempicsize != 0) { 
      System.out.println("새롭게 올리는 경우");
      if (mempicsize_old == 0) { 
        System.out.println("기존에 없음");

      } else {
        System.out.println("기존에 있음");
        Tool.deleteFile(upDir, memberVO_old.getMempic()); 
        Tool.deleteFile(upDir, memberVO_old.getMemthumb()); 
      }
      
      mempic = Upload.saveFileSpring(mempicMF, upDir);
      if (Tool.isImage(mempic)) {
        memthumb = Tool.preview(upDir, mempic, 300, 300);
      }
      mempicsize = mempicMF.getSize();
      
    } else {
      System.out.println("새롭게 올리지 않는 경우");
      if (mempicsize_old != 0) {
        System.out.println("기존에 있음");
        mempic = memberVO_old.getMempic();
        memthumb= memberVO_old.getMemthumb();
        mempicsize = memberVO_old.getMempicsize();
        
      } else {
        System.out.println("기존에 없음");
        mempic = null;
        memthumb= null;
        mempicsize = 0;
      }
    }
    
    memberVO.setMempic(mempic);
    memberVO.setMemthumb(memthumb);
    memberVO.setMempicsize(mempicsize);
    
    System.out.println("mempic: " + mempic);
    System.out.println("memthumb: " + memthumb);
    System.out.println("mempicsize: " + mempicsize);
    
    int cnt = this.memberProc.update(memberVO);
    // System.out.println("처리 결과: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 이미지 삭제 처리
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/delete_img.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete_img (HttpServletRequest request, int memberno) {
    
    System.out.println("Controller 진입");

    
    String upDir = Tool.getRealPath(request, "member/prof"); // 절대 경로
    MemberVO memberVO = this.memberProc.read(memberno);
    
    Tool.deleteFile(upDir, memberVO.getMempic()); 
    Tool.deleteFile(upDir, memberVO.getMemthumb()); 
    
    int cnt = this.memberProc.delete_img(memberno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("처리 결과 cnt: " + cnt);
    return json.toString();
  }
  
  /**
   * 삭제 폼
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/delete.do",
  method = RequestMethod.GET,
  produces = "text/plain;charset=UTF-8")
  public ModelAndView delete (int memberno) {
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    mav.setViewName("/member/delete");
    
    return mav;
  }

  /**
   * 삭제 처리
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete_proc (String id, String pw, HttpSession session) {
    System.out.println("Controller 진입");
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("pw", pw);
    
    int count = memberProc.signin(map);
    
    int memberno = 0;
    if (count != 0) {
      memberno = (int)session.getAttribute("memberno");
    }
    
    // 결제, 총결제, 좋아하는 감독, 좋아하는 배우, 좋아하는 영화, 보고싶은 영화, 리뷰, 문의사항
    
    int cnt = 0;
    if (
        this.actorfavProc.delete_by_memberno(memberno) == 0 ||
        this.filmfavProc.delete_by_memberno(memberno) == 0 ||
        this.filmwishProc.delete_by_memberno(memberno) == 0 ||
        this.directorfavProc.delete_by_memberno(memberno) == 0 ||
        this.cartProc.delete_by_memberno(memberno) == 0 ||
        this.payProc.delete_by_memberno(memberno) == 0 ||
        this.paytotalProc.delete_by_memberno(memberno) == 0 ||
        this.reviewProc.delete_by_memberno(memberno) == 0 ||
        this.quesProc.delete_by_memberno(memberno) == 0
        ) {
      cnt = this.memberProc.delete(memberno);
    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("처리 결과 cnt: " + cnt);
    return json.toString();
  }
  
  
  /**
   * 로그인 폼
   * @return
   *  http://localhost:9090/movie/member/siginin.do
   */
  @RequestMapping(value = "/member/signin.do",
                            method = RequestMethod.GET)
  public ModelAndView signin (HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;
    String ck_id = ""; // id 저장
    String ck_remember_id = ""; // id 저장 여부를 체크
    String ck_pw = ""; // passwd 저장
    String ck_remember_pw = ""; // passwd 저장 여부를 체크
    
    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // 쿠키 객체 추출
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_remember_id")){
          ck_remember_id = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_pw")){
          ck_pw = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_remember_pw")){
          ck_remember_pw = cookie.getValue();  // Y, N
        }
      }
    }
    
    mav.addObject("ck_id", ck_id); 
    mav.addObject("ck_remember_id", ck_remember_id);
    mav.addObject("ck_pw", ck_pw);
    mav.addObject("ck_remember_pw", ck_remember_pw);
    
    mav.setViewName("/member/signin");
    return mav;
  }
  

  /**
   * 로그인 처리
   * @param request Cookie를 읽기위해 필요
   * @param response Cookie를 쓰기위해 필요
   * @param session 로그인 정보를 메모리에 기록
   * @param id  회원 아이디
   * @param signin 회원 패스워드
   * @param id_save 회원 아이디 Cookie에 저장 여부
   * @param passwd_save 패스워드 Cookie에 저장 여부
   * @return
   */
  // http://localhost:9090/movie/member/signin.do 
  @ResponseBody
  @RequestMapping(value = "/member/signin.do", 
                             method = RequestMethod.POST,
                             produces = "text/plain;charset=UTF-8")
  public String signin(HttpServletRequest request,
                                                 HttpServletResponse response,
                                                 HttpSession session,
                                                 String id, String pw,
                                                 @RequestParam(value="remember_id", defaultValue="") String remember_id,
                                                 @RequestParam(value="remember_pw", defaultValue="") String remember_pw) {

    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("pw", pw);
    MemberVO memberVO = new MemberVO();
    int count = memberProc.signin(map);
    if (count == 1) { // 로그인 성공
      // System.out.println(id + " 로그인 성공");
      memberVO = memberProc.read_by_id(id);
      session.setAttribute("memberno", memberVO.getMemberno());
      session.setAttribute("id", id);
      session.setAttribute("nick", memberVO.getNick());
      
      Cookie ck_id; // id 저장 쿠키 객체
      Cookie ck_pw; // pw 저장 쿠키 객체
      Cookie ck_remember_id; // id 체크박스 저장 쿠키 객체
      Cookie ck_remember_pw; // pw 체크박스 저장 쿠키 객체
      
      Cookie ck_nick; // nick 저장 쿠키 객체
      Cookie ck_memberno; // memberno 저장 쿠키 객체
      
      // ▶ id 저장 쿠키
      if (remember_id.equals("Y")) { // id를 저장할 경우
        ck_id = new Cookie("ck_id", id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
      } else { // N, id를 저장하지 않는 경우
        ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
      }
      response.addCookie(ck_id);
      
      // ▶ id 체크 박스 쿠기
      ck_remember_id = new Cookie("ck_remember_id", remember_id);
      ck_remember_id.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_remember_id);

      // ▶ pw 저장 쿠기
      if (remember_pw.equals("Y")) { // 패스워드 저장할 경우
        ck_pw = new Cookie("ck_pw", pw);
        ck_pw.setMaxAge(60 * 60 * 72 * 10); // 30 day
      } else { // N, 패스워드를 저장하지 않을 경우
        ck_pw = new Cookie("ck_pw", "");
        ck_pw.setMaxAge(0);
      }
      response.addCookie(ck_pw);

      // ▶ pw 체크 박스 쿠기
      ck_remember_pw = new Cookie("ck_remember_pw", remember_pw);
      ck_remember_pw.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_remember_pw);

      // ▶ nick 저장 쿠키
      ck_nick = new Cookie("ck_nick", memberVO.getNick());
      ck_nick.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_nick);

      // ▶ memberno 저장 쿠키
      ck_memberno = new Cookie("ck_memberno", Integer.toString(memberVO.getMemberno()));
      ck_memberno.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_nick);
    }
    
    JSONObject json = new JSONObject();
    json.put("count", count);
    
    return json.toString();
  }
  
  /**
   * 비밀번호 확인 폼
   */
  // http://localhost:9090/movie/member/check_pw.do 
  @ResponseBody
  @RequestMapping(value = "/member/check_pw.do", 
  method = RequestMethod.GET,
  produces = "text/plain;charset=UTF-8")
  public ModelAndView check_pw (int memberno, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    //int memberno = (int)session.getAttribute("memberno");
    mav.addObject("memberno", memberno);
    mav.addObject("id", this.memberProc.read(memberno).getId());
    mav.addObject("memthumb", this.memberProc.read(memberno).getMemthumb());
    
    mav.setViewName("/member/check_pw");

    return mav;
  }
  
  /**
   * 비밀번호 확인
   */
  // http://localhost:9090/movie/member/check_pw.do 
  @ResponseBody
  @RequestMapping(value = "/member/check_pw_proc.do", 
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String check_pw_proc (String id, String pw, HttpSession session) {
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("pw", pw);
    
    int count = memberProc.signin(map);
    // int memberno = (int)session.getAttribute("memberno");
    int memberno = 1;
    
    JSONObject json = new JSONObject();
    json.put("count", count);
    json.put("memberno", memberno);
    
    System.out.println("count: " + count);
    System.out.println("memberno: " + memberno);
    
    return json.toString();
  }
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/member/signout.do", 
                             method=RequestMethod.POST)
  public String signout(HttpSession session){
    session.invalidate(); // 모든 session 변수 삭제
    JSONObject json = new JSONObject();
    json.put("cnt", 1);
    return json.toString();
  }
  
  /**
   * 아이디 중복 확인
   */
  @ResponseBody
  @RequestMapping(value="/member/findduplicate_by_id.do", 
                             method=RequestMethod.POST)
  public String findduplicate_by_id(String id){
    int id_duplicated = this.memberProc.findduplicate_by_id(id);
    
    JSONObject json = new JSONObject();
    json.put("id_duplicated", id_duplicated);
    return json.toString();
  }
  
  /**
   * 닉네임 중복 확인
   */
  @ResponseBody
  @RequestMapping(value="/member/findduplicate_by_nick.do", 
  method=RequestMethod.POST)
  public String findduplicate_by_nick(String nick){
    int nick_duplicated = this.memberProc.findduplicate_by_nick(nick);
    
    JSONObject json = new JSONObject();
    json.put("nick_duplicated", nick_duplicated);
    return json.toString();
  }
  
  /**
   * 전화번호 중복 확인
   */
  @ResponseBody
  @RequestMapping(value="/member/findduplicate_by_tel.do", 
  method=RequestMethod.POST)
  public String findduplicate_by_tel(String tel){
    int tel_duplicated = this.memberProc.findduplicate_by_tel(tel);
    System.out.println("tel:" + tel);
    System.out.println("tel_duplicated:" + tel_duplicated);
    
    JSONObject json = new JSONObject();
    json.put("tel_duplicated", tel_duplicated);
    return json.toString();
  }
  
  /**
   * 이메일 중복 확인
   */
  @ResponseBody
  @RequestMapping(value="/member/findduplicate_by_email.do", 
  method=RequestMethod.POST)
  public String findduplicate_by_email(String email){
    int email_duplicated = this.memberProc.findduplicate_by_email(email);
    
    JSONObject json = new JSONObject();
    json.put("email_duplicated", email_duplicated);
    return json.toString();
  }
  
  

}
