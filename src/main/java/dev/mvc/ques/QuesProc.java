package dev.mvc.ques;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.ques.QuesProc")
public class QuesProc implements QuesProcInter {

  @Autowired
  private QuesDAOInter quesDAO;

  @Override
  public int create(QuesVO quesVO) {
    int cnt = this.quesDAO.create(quesVO);
    return cnt;
  }

  @Override
  public ArrayList<QuesVO> list() {
    ArrayList<QuesVO> list = this.quesDAO.list();
    return list;
  }

  @Override
  public QuesVO read(int quesno) {
    QuesVO quesVO = this.quesDAO.read(quesno);
    return quesVO;
  }

  @Override
  public int update(QuesVO quesVO) {
    int cnt = this.quesDAO.update(quesVO);
    return cnt;
  }

  @Override
  public int delete(int quesno) {
    int cnt = this.quesDAO.delete(quesno);
    return cnt;
  }
  

}
