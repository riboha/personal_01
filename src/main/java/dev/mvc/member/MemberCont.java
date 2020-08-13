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

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class MemberCont {
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  

  /**
   * ��� ��
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
   * ��� ó��
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, MemberVO memberVO) {
    
    System.out.println("Controller ����");
    // =============���� ���� �ڵ�===============
    
    String mempic = "";
    String memthumb = "";
    long mempicsize = 0;
    
    String upDir = Tool.getRealPath(request, "member/prof"); // ���� ���
     
    MultipartFile mf = memberVO.getMempicMF();
    mempicsize = mf.getSize();
    if (mempicsize > 0) {
      mempic = Upload.saveFileSpring(mf, upDir);
     
      if (Tool.isImage(mempic)) {
        memthumb = Tool.preview(upDir, mempic, 200, 200);
      }
    }
    // =============���� ���� �ڵ�===============
       
    memberVO.setMempic(mempic);
    memberVO.setMemthumb(memthumb);
    memberVO.setMempicsize(mempicsize);
     
    int cnt = this.memberProc.create(memberVO);
    
    
     System.out.println("ó�� ��� cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
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
   * ��� (�����ڿ�)
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
   * ��� (�� ��ȸ��)
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
   * ���� ó��
   * @param memberVO
   * @param remembert 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (HttpServletRequest request, MemberVO memberVO) {
    
    String upDir = Tool.getRealPath(request, "member/prof"); // ���� ���
    MemberVO memberVO_old = this.memberProc.read(memberVO.getMemberno());
    MultipartFile mempicMF = memberVO.getMempicMF();

    String mempic = "";
    String memthumb = "";
    long mempicsize = mempicMF.getSize();
    long mempicsize_old = memberVO_old.getMempicsize();
    System.out.println("mempicsize: " + mempicsize);
    System.out.println("mempicsize_old: " + mempicsize_old);
    
    if (mempicsize != 0) { 
      System.out.println("���Ӱ� �ø��� ���");
      if (mempicsize_old == 0) { 
        System.out.println("������ ����");

      } else {
        System.out.println("������ ����");
        Tool.deleteFile(upDir, memberVO_old.getMempic()); 
        Tool.deleteFile(upDir, memberVO_old.getMemthumb()); 
      }
      
      mempic = Upload.saveFileSpring(mempicMF, upDir);
      if (Tool.isImage(mempic)) {
        memthumb = Tool.preview(upDir, mempic, 200, 200);
      }
      mempicsize = mempicMF.getSize();
      
    } else {
      System.out.println("���Ӱ� �ø��� �ʴ� ���");
      if (mempicsize_old != 0) {
        System.out.println("������ ����");
        mempic = memberVO_old.getMempic();
        memthumb= memberVO_old.getMemthumb();
        mempicsize = memberVO_old.getMempicsize();
        
      } else {
        System.out.println("������ ����");
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
    // System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * �̹��� ���� ó��
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/delete_img.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete_img (HttpServletRequest request, int memberno) {
    
    System.out.println("Controller ����");

    
    String upDir = Tool.getRealPath(request, "member/prof"); // ���� ���
    MemberVO memberVO = this.memberProc.read(memberno);
    
    Tool.deleteFile(upDir, memberVO.getMempic()); 
    Tool.deleteFile(upDir, memberVO.getMemthumb()); 
    
    int cnt = this.memberProc.delete_img(memberno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  /**
   * ���� ó��
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (int memberno) {
    System.out.println("Controller ����");
    int cnt = this.memberProc.delete(memberno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  
  /**
   * �α��� ��
   * @return
   *  http://localhost:9090/movie/member/siginin.do
   */
  @RequestMapping(value = "/member/signin.do",
                            method = RequestMethod.GET)
  public ModelAndView signin (HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id ����
    String ck_remember_id = ""; // id ���� ���θ� üũ
    String ck_pw = ""; // passwd ����
    String ck_remember_pw = ""; // passwd ���� ���θ� üũ
    
    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // ��Ű ��ü ����
        
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
   * �α��� ó��
   * @param request Cookie�� �б����� �ʿ�
   * @param response Cookie�� �������� �ʿ�
   * @param session �α��� ������ �޸𸮿� ���
   * @param id  ȸ�� ���̵�
   * @param signin ȸ�� �н�����
   * @param id_save ȸ�� ���̵� Cookie�� ���� ����
   * @param passwd_save �н����� Cookie�� ���� ����
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
    if (count == 1) { // �α��� ����
      // System.out.println(id + " �α��� ����");
      memberVO = memberProc.read_by_id(id);
      session.setAttribute("memberno", memberVO.getMemberno());
      session.setAttribute("id", id);
      session.setAttribute("nick", memberVO.getNick());
      
      Cookie ck_id; // id ���� ��Ű ��ü
      Cookie ck_pw; // pw ���� ��Ű ��ü
      Cookie ck_remember_id; // id üũ�ڽ� ���� ��Ű ��ü
      Cookie ck_remember_pw; // pw üũ�ڽ� ���� ��Ű ��ü
      
      Cookie ck_nick; // nick ���� ��Ű ��ü
      
      // �� id ���� ��Ű
      if (remember_id.equals("Y")) { // id�� ������ ���
        ck_id = new Cookie("ck_id", id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, �ʴ���
      } else { // N, id�� �������� �ʴ� ���
        ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
      }
      response.addCookie(ck_id);
      
      // �� id üũ �ڽ� ���
      ck_remember_id = new Cookie("ck_remember_id", remember_id);
      ck_remember_id.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_remember_id);

      // �� pw ���� ���
      if (remember_pw.equals("Y")) { // �н����� ������ ���
        ck_pw = new Cookie("ck_pw", pw);
        ck_pw.setMaxAge(60 * 60 * 72 * 10); // 30 day
      } else { // N, �н����带 �������� ���� ���
        ck_pw = new Cookie("ck_pw", "");
        ck_pw.setMaxAge(0);
      }
      response.addCookie(ck_pw);

      // �� pw üũ �ڽ� ���
      ck_remember_pw = new Cookie("ck_remember_pw", remember_pw);
      ck_remember_pw.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_remember_pw);

      // �� nick üũ �ڽ� ���
      ck_nick = new Cookie("ck_nick", memberVO.getNick());
      ck_nick.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_nick);
      
    }
    JSONObject json = new JSONObject();
    json.put("count", count);
    
    return json.toString();
  }

}
