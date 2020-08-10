package dev.mvc.member;

import java.util.ArrayList;

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

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class MemberCont {
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  

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
        memthumb = Tool.preview(upDir, mempic, 200, 200);
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
        memthumb = Tool.preview(upDir, mempic, 200, 200);
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
   * 삭제 처리
   * @param memberVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (int memberno) {
    System.out.println("Controller 진입");
    int cnt = this.memberProc.delete(memberno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("처리 결과 cnt: " + cnt);
    return json.toString();
  }
  
  




}
