package dev.mvc.quality;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.quality.QualityProc")
public class QualityProc implements QualityProcInter {
  
  
  @Autowired
  private QualityDAOInter qualityDAO;

  @Override
  // ���
  public int create (QualityVO qualityVO) {
    int cnt = this.qualityDAO.create(qualityVO );
    return cnt;
  }

  @Override
  // ���
  public ArrayList<QualityVO> list() {
    ArrayList<QualityVO> list = this.qualityDAO.list();
    return list;
  }

  @Override
  // ��ȸ
  public QualityVO read(int qualityno) {
    QualityVO qualityVO = this.qualityDAO.read(qualityno);
    return qualityVO;
  }

  @Override
  // ����
  public int update (QualityVO qualityVO) {
    int cnt = this.qualityDAO.update(qualityVO);
    return cnt;
  }

  @Override
  // ����
  public int delete(int qualityno) {
    int cnt = this.qualityDAO.delete(qualityno);
    return cnt;
  }
  


}
