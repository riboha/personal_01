package dev.mvc.director;

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

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class DirectorCont {
  @Autowired
  @Qualifier("dev.mvc.director.DirectorProc")
  private DirectorProcInter directorProc;
  
  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/director/create.do
   */
  @RequestMapping(value = "/director/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/director/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param directorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/director/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, DirectorVO directorVO) {
    
    // =============���� ���� �ڵ�===============
        
    String dirphoto = "";
    String dirthumb = "";
    long dirphotosize = 0;
    
    String upDir = Tool.getRealPath(request, "director/prof"); // ���� ���
     
    MultipartFile mf = directorVO.getDirphotoMF();    
    dirphotosize = mf.getSize();
    if (dirphotosize > 0) {
      dirphoto = Upload.saveFileSpring(mf, upDir);
     
      if (Tool.isImage(dirphoto)) {
        dirthumb = Tool.preview(upDir, dirphoto, 200, 200);
      }
    }
    // =============���� ���� �ڵ�===============
       
    directorVO.setDirphoto(dirphoto);
    directorVO.setDirphotosize(dirphotosize);
    directorVO.setDirthumb(dirthumb);
     
    int cnt = this.directorProc.create(directorVO);
    
    // ---------------------------------------------------------------------------------------
    // cnt, dirno return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> memVO <-----> MyBATIS
    // Spring�� MyBATIS�� MemVO�� �����ϰ� ����.
    // MyBATIS�� insert�� PK �÷��� mem_no������ ���� ������ PK�� �Ҵ���.
    int dirno = directorVO.getDirno();  // MyBATIS ���ϵ� PK
    // ---------------------------------------------------------------------------------------
    
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("dirno", dirno);
    
    System.out.println("dirno: " + dirno);
    
    return json.toString();
  }
  
  
  
  
  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/director/read.do?dirno=1
   */
  @RequestMapping(value = "/director/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int dirno) {
    ModelAndView mav = new ModelAndView();
    DirectorVO directorVO = this.directorProc.read(dirno);
    mav.addObject("directorVO", directorVO);
    mav.setViewName("/director/read");
    return mav;
  } 
  
  
  /**
   * ���
   * @return
   *  http://localhost:9090/movie/director/list.do
   */
  @RequestMapping(value = "/director/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<DirectorVO> list = this.directorProc.list();
    mav.addObject("list", list);
    mav.setViewName("/director/list");
    return mav;
  }
  
  

  /**
   * ���� ��
   * @return
   *  http://localhost:9090/movie/director/update.do
   */
  @RequestMapping(value = "/director/update.do",
      method = RequestMethod.GET)
  public ModelAndView update (int dirno) {
    ModelAndView mav = new ModelAndView();
    DirectorVO directorVO = this.directorProc.read(dirno);
    mav.addObject("directorVO", directorVO);
    mav.setViewName("/director/update");
    return mav;
  }
  
  /**
   * ���� ó��
   * @param directorVO
   * @param request 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/director/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (DirectorVO directorVO, HttpServletRequest request) {
    
    DirectorVO directorVO_old = this.directorProc.read(directorVO.getDirno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("dirnamekr", directorVO.getDirnamekr());
    hashMap.put("dirnameen", directorVO.getDirnameen());
    hashMap.put("dirnation", directorVO.getDirnation());
    hashMap.put("dirno", directorVO.getDirno());
    
    if (directorVO.getDirphoto() != null) {
      
      // ��ũ���� ������ ���� ����
      String upDir = Tool.getRealPath(request, "director/prof"); 
      Tool.deleteFile(upDir, directorVO.getDirphoto()); 
      Tool.deleteFile(upDir, directorVO.getDirthumb()); 
      
      // ��ũ���� �� ������ ���� ���
      String dirphoto = "";
      String dirthumb = "";
      long dirphotosize = 0;
      
      MultipartFile mf = directorVO.getDirphotoMF();    
      dirphotosize = mf.getSize();
      if (dirphotosize > 0) {
        dirphoto = Upload.saveFileSpring(mf, upDir);
        if (Tool.isImage(dirphoto)) {
          dirthumb = Tool.preview(upDir, dirphoto, 200, 200);
        }
      }
      hashMap.put("dirphoto", dirphoto);
      hashMap.put("dirphotosize", dirphotosize);
      hashMap.put("dirthumb", dirthumb);
      
    } else {
      hashMap.put("dirphoto", directorVO_old.getDirphoto());
      hashMap.put("dirphotosize", directorVO_old.getDirphotosize());
      hashMap.put("dirthumb", directorVO_old.getDirthumb());
    }
    
    int cnt = this.directorProc.update(hashMap);
    System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  
  

  
  /**
   * ���� ó��
   * @param directorVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/director/delete.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String delete (int dirno) {
    
    System.out.println("Controller ����");
    
    // int cnt_film = this.filmProc.delete(dirno);
    int cnt = this.directorProc.delete(dirno);
    System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
}
