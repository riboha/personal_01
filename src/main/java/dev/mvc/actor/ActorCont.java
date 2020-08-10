package dev.mvc.actor;

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
public class ActorCont {
  
  @Autowired
  @Qualifier("dev.mvc.actor.ActorProc")
  private ActorProcInter actorProc;
  
  

  /**
   * ��� ��
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
   * ��� ó��
   * @param actorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, ActorVO actorVO) {
    
    System.out.println("Controller ����");
    // =============���� ���� �ڵ�===============
    
    String actorpic = "";
    String actorthumb = "";
    long actorpicsize = 0;
    
    String upDir = Tool.getRealPath(request, "actor/prof"); // ���� ���
     
    MultipartFile mf = actorVO.getActorpicMF();
    actorpicsize = mf.getSize();
    if (actorpicsize > 0) {
      actorpic = Upload.saveFileSpring(mf, upDir);
     
      if (Tool.isImage(actorpic)) {
        actorthumb = Tool.preview(upDir, actorpic, 200, 200);
      }
    }
    // =============���� ���� �ڵ�===============
       
    actorVO.setActorpic(actorpic);
    actorVO.setActorthumb(actorthumb);
    actorVO.setActorpicsize(actorpicsize);
     
    int cnt = this.actorProc.create(actorVO);
    
    
     System.out.println("ó�� ��� cnt: " + cnt);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
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
   * ��� (�����ڿ�)
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
   * ��� (�� ��ȸ��)
   * @return
   *  http://localhost:9090/movie/actor/list.do
   */
  @RequestMapping(value = "/actor/list_.do",
                            method = RequestMethod.GET)
  public ModelAndView list_ () {
    ModelAndView mav = new ModelAndView();
    ArrayList<ActorVO> list = this.actorProc.list();
    mav.addObject("list", list);
    mav.setViewName("/actor/list_");
    return mav;
  }
  


  
  /**
   * ���� ó��
   * @param actorVO
   * @param reactort 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (HttpServletRequest request, ActorVO actorVO) {
    
    String upDir = Tool.getRealPath(request, "actor/prof"); // ���� ���
    ActorVO actorVO_old = this.actorProc.read(actorVO.getActorno());
    MultipartFile actorpicMF = actorVO.getActorpicMF();

    String actorpic = "";
    String actorthumb = "";
    long actorpicsize = actorpicMF.getSize();
    long actorpicsize_old = actorVO_old.getActorpicsize();
    System.out.println("actorpicsize: " + actorpicsize);
    System.out.println("actorpicsize_old: " + actorpicsize_old);
    
    if (actorpicsize != 0) { 
      System.out.println("���Ӱ� �ø��� ���");
      if (actorpicsize_old == 0) { 
        System.out.println("������ ����");

      } else {
        System.out.println("������ ����");
        Tool.deleteFile(upDir, actorVO_old.getActorpic()); 
        Tool.deleteFile(upDir, actorVO_old.getActorthumb()); 
      }
      
      actorpic = Upload.saveFileSpring(actorpicMF, upDir);
      if (Tool.isImage(actorpic)) {
        actorthumb = Tool.preview(upDir, actorpic, 200, 200);
      }
      actorpicsize = actorpicMF.getSize();
      
    } else {
      System.out.println("���Ӱ� �ø��� �ʴ� ���");
      if (actorpicsize_old != 0) {
        System.out.println("������ ����");
        actorpic = actorVO_old.getActorpic();
        actorthumb= actorVO_old.getActorthumb();
        actorpicsize = actorVO_old.getActorpicsize();
        
      } else {
        System.out.println("������ ����");
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
    // System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  /**
   * �̹��� ���� ó��
   * @param actorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/delete_img.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete_img (HttpServletRequest request, int actorno) {
    
    System.out.println("Controller ����");

    
    String upDir = Tool.getRealPath(request, "actor/prof"); // ���� ���
    ActorVO actorVO = this.actorProc.read(actorno);
    
    Tool.deleteFile(upDir, actorVO.getActorpic()); 
    Tool.deleteFile(upDir, actorVO.getActorthumb()); 
    
    int cnt = this.actorProc.delete_img(actorno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  /**
   * ���� ó��
   * @param actorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/actor/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (int actorno) {
    System.out.println("Controller ����");
    int cnt = this.actorProc.delete(actorno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  




}
