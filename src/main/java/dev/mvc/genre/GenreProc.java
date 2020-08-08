package dev.mvc.genre;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.genre.GenreProc")
public class GenreProc implements GenreProcInter{
  
  @Autowired
  private GenreDAOInter genreDAO;

  // 등록
  @Override
  public int create(GenreVO genreVO) {
    int cnt = this.genreDAO.create(genreVO);
    return cnt;
  }

  // 목록
  @Override
  public ArrayList<GenreVO> list() {
    ArrayList<GenreVO> list = this.genreDAO.list();
    return list;
  }

  // 조회
  @Override
  public GenreVO read(int genreno) {
    GenreVO genreVO = this.genreDAO.read(genreno);
    return genreVO;
  }

  // 수정
  @Override
  public int update(HashMap<String, Object> hashMap) {
    int cnt = this.genreDAO.update(hashMap);
    return cnt;
  }

  // 삭제
  @Override
  public int delete(int genreno) {
    int cnt = this.genreDAO.delete(genreno);
    return cnt;
  }
  
  


}
