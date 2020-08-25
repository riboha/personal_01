package dev.mvc.actor;

import java.util.ArrayList;
import java.util.HashMap;

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

import dev.mvc.actorfav.ActorfavProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ActorCont {
  
  @Autowired
  @Qualifier("dev.mvc.actor.ActorProc")
  private ActorProcInter actorProc;
  
  @Autowired
  @Qualifier("dev.mvc.actorfav.ActorfavProc")
  private ActorfavProcInter actorfavProc;
  
  

  /**
   * 등록 폼
   * @return
   *  http://localhost:9090/movie/actor/create.do
   */
  @RequestMapping(value = "/actor/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/actor/create");
    return mav;
  }
  
  
  /**
   * 등록 처리
   * @param actorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, ActorVO actorVO) {
    
    System.out.println("Controller 진입");
    // =============파일 전송 코드===============
    
    String actorpic = "";
    String actorthumb = "";
    long actorpicsize = 0;
    
    String upDir = Tool.getRealPath(request, "actor/prof"); // 절대 경로
     
    MultipartFile mf = actorVO.getActorpicMF();
    actorpicsize = mf.getSize();
    if (actorpicsize > 0) {
      actorpic = Upload.saveFileSpring(mf, upDir);
     
      if (Tool.isImage(actorpic)) {
        actorthumb = Tool.preview(upDir, actorpic, 300, 300);
      }
    }
    // =============파일 전송 코드===============
       
    actorVO.setActorpic(actorpic);
    actorVO.setActorthumb(actorthumb);
    actorVO.setActorpicsize(actorpicsize);
     
    int cnt = this.actorProc.create(actorVO);
    
    
     System.out.println("처리 결과 cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * 조회
   * @return
   *  http://localhost:9090/movie/actor/read.do?dirno=1
   */
  @RequestMapping(value = "/actor/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int actorno) {
    ModelAndView mav = new ModelAndView();
    ActorVO actorVO = this.actorProc.read(actorno);
    mav.addObject("VO", actorVO);
    mav.setViewName("/actor/read");
    return mav;
  } 
  
  
  /**
   * 목록 (관리자용)
   * @return
   *  http://localhost:9090/movie/actor/list.do
   */
  @RequestMapping(value = "/actor/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<ActorVO> list = this.actorProc.list();
    mav.addObject("list", list);
    mav.setViewName("/actor/list_admin");
    return mav;
  }
  
  
  /**
   * 목록 (회원용)
   * @return
   *  http://localhost:9090/movie/actor/list_customer.do
   */
  @RequestMapping(value = "/actor/list_customer.do",
                            method = RequestMethod.GET)
  public ModelAndView list_customer (
      @RequestParam(value="search_actor",  required=false) String search_actor,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("search_actor", search_actor );
    hashMap.put("nowPage", nowPage );
    
    // 검색 레코드 갯수
    int search_count = this.actorProc.list_paging_search_actor_count(hashMap);
    
    // 검색 목록
    ArrayList<ActorVO> list_paging_search_actor = this.actorProc.list_paging_search_actor(hashMap);
    ArrayList<ActorVO> actorVO_list = new ArrayList<>();
    
    ActorVO actorVO = new ActorVO(); 
    
    System.out.println("list_paging_search_actor.size(): " + list_paging_search_actor.size());
    
    int actorno = 0;
    for (int i = 0; i < list_paging_search_actor.size(); i ++) {
      
      actorno = list_paging_search_actor.get(i).getActorno();
      actorVO = this.actorProc.read(actorno);
      actorVO.setActorhit(this.actorfavProc.count_actorfav(actorno)); // 좋아요 갯수
      actorVO_list.add(actorVO);
    }
    
    // 페이징 박스
    String paging = this.actorProc.pagingBox("list_customer.do", search_count, nowPage, search_actor);
    
    if (search_actor != null) {
      mav.addObject("search_actor", search_actor);
    } else {
      mav.addObject("search_actor", null);
    }
    mav.addObject("search_count", search_count);
    mav.addObject("actorVO_list", actorVO_list);
    mav.addObject("paging", paging);
    
    mav.setViewName("/actor/list_customer");
    return mav;
  }
  


  
  /**
   * 수정 처리
   * @param actorVO
   * @param reactort 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (HttpServletRequest request, ActorVO actorVO) {
    
    String upDir = Tool.getRealPath(request, "actor/prof"); // 절대 경로
    ActorVO actorVO_old = this.actorProc.read(actorVO.getActorno());
    MultipartFile actorpicMF = actorVO.getActorpicMF();

    String actorpic = "";
    String actorthumb = "";
    long actorpicsize = actorpicMF.getSize();
    long actorpicsize_old = actorVO_old.getActorpicsize();
    //System.out.println("actorpicsize: " + actorpicsize);
    //System.out.println("actorpicsize_old: " + actorpicsize_old);
    
    if (actorpicsize != 0) { 
      System.out.println("새롭게 올리는 경우");
      if (actorpicsize_old == 0) { 
        System.out.println("기존에 없음");

      } else {
        System.out.println("기존에 있음");
        Tool.deleteFile(upDir, actorVO_old.getActorpic()); 
        Tool.deleteFile(upDir, actorVO_old.getActorthumb()); 
      }
      
      actorpic = Upload.saveFileSpring(actorpicMF, upDir);
      if (Tool.isImage(actorpic)) {
        actorthumb = Tool.preview(upDir, actorpic, 300, 300);
      }
      actorpicsize = actorpicMF.getSize();
      
    } else {
      System.out.println("새롭게 올리지 않는 경우");
      if (actorpicsize_old != 0) {
        System.out.println("기존에 있음");
        actorpic = actorVO_old.getActorpic();
        actorthumb= actorVO_old.getActorthumb();
        actorpicsize = actorVO_old.getActorpicsize();
        
      } else {
        System.out.println("기존에 없음");
        actorpic = null;
        actorthumb= null;
        actorpicsize = 0;
      }
    }
    
    actorVO.setActorpic(actorpic);
    actorVO.setActorthumb(actorthumb);
    actorVO.setActorpicsize(actorpicsize);
    
    System.out.println("actorpic: " + actorpic);
    System.out.println("actorthumb: " + actorthumb);
    System.out.println("actorpicsize: " + actorpicsize);
    
    int cnt = this.actorProc.update(actorVO);
    // System.out.println("처리 결과: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * 이미지 삭제 처리
   * @param actorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/delete_img.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete_img (HttpServletRequest request, int actorno) {
    
    // System.out.println("Controller 진입");
    String upDir = Tool.getRealPath(request, "actor/prof"); // 절대 경로
    ActorVO actorVO = this.actorProc.read(actorno);
    
    Tool.deleteFile(upDir, actorVO.getActorpic()); 
    Tool.deleteFile(upDir, actorVO.getActorthumb()); 
    
    int cnt = this.actorProc.delete_img(actorno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("처리 결과 cnt: " + cnt);
    return json.toString();
  }
  
  /**
   * 삭제 처리
   * @param actorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (HttpServletRequest request, int actorno) {

    ActorVO actorVO = this.actorProc.read(actorno);
    
    String upDir = Tool.getRealPath(request, "director/prof");
    Tool.deleteFile(upDir, actorVO.getActorpic()); 
    Tool.deleteFile(upDir, actorVO.getActorthumb()); 
    
    int cnt = this.actorProc.delete(actorno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    // System.out.println("처리 결과 cnt: " + cnt);
    return json.toString();
  }
  
  




}
