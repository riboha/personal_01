package dev.mvc.quality;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.quality.QualityProc")
public class QualityProc implements QualityProcInter {
  
  
  @Autowired
  private QualityDAOInter qualityDAO;

  @Override
  // ���
  public int create(HashMap<String, Object> hashMap) {
    int cnt = this.qualityDAO.create(hashMap);
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
  public int update(HashMap<String, Object> hashMap) {
    int cnt = this.qualityDAO.update(hashMap);
    return cnt;
  }

  @Override
  // ����
  public int delete(int qualityno) {
    int cnt = this.qualityDAO.delete(qualityno);
    return cnt;
  }
  


}
