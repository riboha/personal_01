package dev.mvc.director;

import org.springframework.web.multipart.MultipartFile;

public class DirectorVO {
  
//  dirno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
//  dirnamekr                           VARCHAR2(200)        NOT NULL,
//  dirnameen                           VARCHAR2(200)        NOT NULL,
//  dirnation                           VARCHAR2(100)        NOT NULL,
//  dirphoto                            VARCHAR2(300)        NULL ,
//  dirthumb                            VARCHAR2(300)        NULL ,
//  dirphotosize                        NUMBER(10)       NULL 
  
  private int dirno; /**���� ��ȣ*/
  
  private String dirnamekr; /**���� �ѱ� �̸�*/
  private String dirnameen; /**���� ���� �̸�*/
  private String dirnation; /**���� ����*/
  
  private String dirphoto; /**���� ����*/
  private String dirthumb; /**���� ���� �����*/
  private long dirphotosize; /**���� ���� ũ��*/
  
  private MultipartFile dirphotoMF; /**�̹��� MultipartFile*/
  
  public int getDirno() {
    return dirno;
  }
  public String getDirnameen() {
    return dirnameen;
  }
  public void setDirnameen(String dirnameen) {
    this.dirnameen = dirnameen;
  }
  public void setDirno(int dirno) {
    this.dirno = dirno;
  }
  public String getDirnamekr() {
    return dirnamekr;
  }
  public void setDirnamekr(String dirnamekr) {
    this.dirnamekr = dirnamekr;
  }

  public String getDirnation() {
    return dirnation;
  }
  public void setDirnation(String dirnation) {
    this.dirnation = dirnation;
  }
  public String getDirphoto() {
    return dirphoto;
  }
  public void setDirphoto(String dirphoto) {
    this.dirphoto = dirphoto;
  }
  public String getDirthumb() {
    return dirthumb;
  }
  public void setDirthumb(String dirthumb) {
    this.dirthumb = dirthumb;
  }
  public long getDirphotosize() {
    return dirphotosize;
  }
  public void setDirphotosize(long dirphotosize) {
    this.dirphotosize = dirphotosize;
  }
  public MultipartFile getDirphotoMF() {
    return dirphotoMF;
  }
  public void setDirphotoMF(MultipartFile dirphotoMF) {
    this.dirphotoMF = dirphotoMF;
  }
  
  
  
  
}
