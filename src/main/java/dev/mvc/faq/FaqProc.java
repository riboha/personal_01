package dev.mvc.faq;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.faq.FaqProc")
public class FaqProc implements FaqProcInter {

  @Autowired
  private FaqDAOInter faqDAO;

  @Override
  public int create(FaqVO faqVO) {
    int cnt = this.faqDAO.create(faqVO);
    return cnt;
  }

  @Override
  public ArrayList<FaqVO> list() {
    ArrayList<FaqVO> list = this.faqDAO.list();
    return list;
  }

  @Override
  public FaqVO read(int faqno) {
    FaqVO faqVO = this.faqDAO.read(faqno);
    return faqVO;
  }

  @Override
  public int update(FaqVO faqVO) {
    int cnt = this.faqDAO.update(faqVO);
    return cnt;
  }

  @Override
  public int delete(int faqno) {
    int cnt = this.faqDAO.delete(faqno);
    return cnt;
  }
  

}
