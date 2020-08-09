package dev.mvc.qcate;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.qcate.QcateProc")
public class QcateProc implements QcateProcInter {

  @Autowired
  private QcateDAOInter qcateDAO;

  @Override
  public int create(QcateVO qcateVO) {
    int cnt = this.qcateDAO.create(qcateVO);
    return cnt;
  }

  @Override
  public ArrayList<QcateVO> list() {
    ArrayList<QcateVO> list = this.qcateDAO.list();
    return list;
  }

  @Override
  public QcateVO read(int qcateno) {
    QcateVO qcateVO = this.qcateDAO.read(qcateno);
    return qcateVO;
  }

  @Override
  public int update(QcateVO qcateVO) {
    int cnt = this.qcateDAO.update(qcateVO);
    return cnt;
  }

  @Override
  public int delete(int qcateno) {
    int cnt = this.qcateDAO.delete(qcateno);
    return cnt;
  }
  

}
