package dev.mvc.keyword;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.keyword.KeywordProc")
public class KeywordProc implements KeywordProcInter {

  @Autowired
  private KeywordDAOInter keywordDAO;

  @Override
  public int create(KeywordVO keywordVO) {
    int cnt = this.keywordDAO.create(keywordVO);
    return cnt;
  }

  @Override
  public ArrayList<KeywordVO> list() {
    ArrayList<KeywordVO> list = this.keywordDAO.list();
    return list;
  }

  @Override
  public KeywordVO read(int keywordno) {
    KeywordVO keywordVO = this.keywordDAO.read(keywordno);
    return keywordVO;
  }

  @Override
  public int update(KeywordVO keywordVO) {
    int cnt = this.keywordDAO.update(keywordVO);
    return cnt;
  }

  @Override
  public int delete(int keywordno) {
    int cnt = this.keywordDAO.delete(keywordno);
    return cnt;
  }
  

}
