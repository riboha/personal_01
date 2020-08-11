package dev.mvc.photo;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
public class PhotoCont {
  
  @Autowired
  @Qualifier("dev.mvc.photo.PhotoProc")
  private PhotoProcInter photoProc;
  

  /**
   * ��� ��
   * @return
   *  http://localhost:9090/movie/photo/create.do
   */
  @RequestMapping(value = "/photo/create.do",
                            method = RequestMethod.GET)
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/photo/create");
    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param photoVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/photo/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, PhotoVO photoVO) {
    
    System.out.println("Controller ����");
    // =============���� ���� �ڵ�===============
    
    String photoname = "";
    String photothumb = "";
    long photosize = 0;
    
    int count_upload = 0;
    String foldername = "photo/repository/" + photoVO.getFilmno();
    String upDir = Tool.getRealPath(request, foldername); // ���� ���
    File Folder = new File(upDir);
    if (!Folder.exists()) { // ������ ���� ���
      try{
        Folder.mkdir(); //���� ����
        System.out.println("������ �����Ǿ����ϴ�.");
      } 
      catch(Exception e){
        e.getStackTrace();
      }        
    }else {
      System.out.println("�̹� ������ �����Ǿ� �ֽ��ϴ�.");
    }
    
    List<MultipartFile> mf_list = photoVO.getPhotonameMF_list(); // ���� ���
    int count = mf_list.size(); // ���� ���� ����
    
    if (count > 0) { // ���� ������ �ִ� ���
      for (MultipartFile multipartFile:mf_list) { // ���� ����
        photosize = multipartFile.getSize(); // ���� ũ��
        
        if (photosize > 0) {
          photoname = Upload.saveFileSpring(multipartFile, upDir);
          if (Tool.isImage(photoname)) {
            photothumb = Tool.preview(upDir, photoname, 200, 200);
          }
        }
        PhotoVO VO = new PhotoVO();
        VO.setPhotoname(photoname);
        VO.setPhotothumb(photothumb);  
        VO.setPhotosize(photosize);
        VO.setFilmno(photoVO.getFilmno());
        count_upload = count_upload + this.photoProc.create(VO);
      }
    }

    // =============���� ���� �ڵ�===============
       
    
    JSONObject json = new JSONObject();
    json.put("count_upload", count_upload);
    
    return json.toString();
  }
  

  /**
   * ��ȸ
   * @return
   *  http://localhost:9090/movie/photo/read.do?dirno=1
   */
  @RequestMapping(value = "/photo/read.do",
                            method = RequestMethod.GET)
  public ModelAndView read (int photono) {
    ModelAndView mav = new ModelAndView();
    PhotoVO photoVO = this.photoProc.read(photono);
    mav.addObject("VO", photoVO);
    mav.setViewName("/photo/read");
    return mav;
  } 
  
  
  /**
   * ��� (�����ڿ�)
   * @return
   *  http://localhost:9090/movie/photo/list.do
   */
  @RequestMapping(value = "/photo/list.do",
                            method = RequestMethod.GET)
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    ArrayList<PhotoVO> list = this.photoProc.list();
    mav.addObject("list", list);
    mav.setViewName("/photo/list_admin");
    return mav;
  }
  

  
  /**
   * ���� ó��
   * @param photoVO
   * @param rephotot 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/photo/update.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String update (HttpServletRequest request, PhotoVO photoVO) {
    
    String foldername = "photo/repository/" + photoVO.getFilmno();
    String upDir = Tool.getRealPath(request, foldername); // ���� ���
    
    PhotoVO photoVO_old = this.photoProc.read(photoVO.getPhotono());
    MultipartFile photonameMF = photoVO.getPhotonameMF();

    String photoname = "";
    String photothumb = "";
    long photosize = photonameMF.getSize();
    long photosize_old = photoVO_old.getPhotosize();
    System.out.println("photosize: " + photosize);
    System.out.println("photosize_old: " + photosize_old);
    
    if (photosize != 0) { 
      System.out.println("���Ӱ� �ø��� ���");
      if (photosize_old == 0) { 
        System.out.println("������ ����");

      } else {
        System.out.println("������ ����");
        Tool.deleteFile(upDir, photoVO_old.getPhotoname()); 
        Tool.deleteFile(upDir, photoVO_old.getPhotothumb()); 
      }
      
      photoname = Upload.saveFileSpring(photonameMF, upDir);
      if (Tool.isImage(photoname)) {
        photothumb = Tool.preview(upDir, photoname, 200, 200);
      }
      photosize = photonameMF.getSize();
      
    } else {
      System.out.println("���Ӱ� �ø��� �ʴ� ���");
      if (photosize_old != 0) {
        System.out.println("������ ����");
        photoname = photoVO_old.getPhotoname();
        photothumb= photoVO_old.getPhotothumb();
        photosize = photoVO_old.getPhotosize();
        
      } else {
        System.out.println("������ ����");
        photoname = null;
        photothumb= null;
        photosize = 0;
      }
    }
    
    photoVO.setPhotoname(photoname);
    photoVO.setPhotothumb(photothumb);
    photoVO.setPhotosize(photosize);
    
    System.out.println("photoname: " + photoname);
    System.out.println("photothumb: " + photothumb);
    System.out.println("photosize: " + photosize);
    
    int cnt = this.photoProc.update(photoVO);
    // System.out.println("ó�� ���: " + cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  

  /**
   * ���� ó��
   * @param photoVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/photo/delete.do",
  method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String delete (HttpServletRequest request, int photono) {
    System.out.println("Controller ����");
    
    PhotoVO photoVO = this.photoProc.read(photono);
    
    String foldername = "photo/repository/" +photoVO.getFilmno();
    String upDir = Tool.getRealPath(request, foldername); // ���� ���
    
    Tool.deleteFile(upDir, photoVO.getPhotoname()); 
    Tool.deleteFile(upDir, photoVO.getPhotothumb()); 
    
    int cnt = this.photoProc.delete(photono);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    System.out.println("ó�� ��� cnt: " + cnt);
    return json.toString();
  }
  
  




}
