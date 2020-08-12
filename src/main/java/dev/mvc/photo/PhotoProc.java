package dev.mvc.photo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.photo.PhotoProc")
public class PhotoProc implements PhotoProcInter {

  @Autowired
  private PhotoDAOInter photoDAO;

  @Override
  public int create(PhotoVO photoVO) {
    int cnt = this.photoDAO.create(photoVO);
    return cnt;
  }

  @Override
  public ArrayList<PhotoVO> list() {
    ArrayList<PhotoVO> list = this.photoDAO.list();
    return list;
  }

  @Override
  public ArrayList<PhotoVO> list_by_filmno(int filmno) {
    ArrayList<PhotoVO> list = this.photoDAO.list_by_filmno(filmno);
    return list;
  }

  @Override
  public PhotoVO read(int photono) {
    PhotoVO photoVO = this.photoDAO.read(photono);
    return photoVO;
  }

  @Override
  public int update(PhotoVO photoVO) {
    int cnt = this.photoDAO.update(photoVO);
    return cnt;
  }

  @Override
  public int delete(int photono) {
    int cnt = this.photoDAO.delete(photono);
    return cnt;
  }

}
