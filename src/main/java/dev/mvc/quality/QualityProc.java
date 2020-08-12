package dev.mvc.quality;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.quality.QualityProc")
public class QualityProc implements QualityProcInter {
  
  
  @Autowired
  private QualityDAOInter qualityDAO;

  @Override
  // 등록
  public int create (QualityVO qualityVO) {
    int cnt = this.qualityDAO.create(qualityVO );
    return cnt;
  }

  @Override
  // 목록
  public ArrayList<QualityVO> list() {
    ArrayList<QualityVO> list = this.qualityDAO.list();
    return list;
  }

  @Override
  // 조회
  public QualityVO read(int qualityno) {
    QualityVO qualityVO = this.qualityDAO.read(qualityno);
    return qualityVO;
  }

  @Override
  // 수정
  public int update (QualityVO qualityVO) {
    int cnt = this.qualityDAO.update(qualityVO);
    return cnt;
  }

  @Override
  // 삭제
  public int delete(int qualityno) {
    int cnt = this.qualityDAO.delete(qualityno);
    return cnt;
  }
  


}
