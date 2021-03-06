package dev.mvc.promofilm;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.promofilm.PromofilmProc")
public class PromofilmProc implements PromofilmProcInter{
  
  @Autowired
  private PromofilmDAOInter promofilmDAO;

  // 등록
  @Override
  public int create(PromofilmVO promofilmVO) {
    int cnt = this.promofilmDAO.create(promofilmVO);
    return cnt;
  }

  // 목록
  @Override
  public ArrayList<PromofilmVO> list_by_promono(int promono) {
    ArrayList<PromofilmVO> list = this.promofilmDAO.list_by_promono(promono);
    return list;
  }

  // 조회
  @Override
  public PromofilmVO read(int promofilmno) {
    PromofilmVO promofilmVO = this.promofilmDAO.read(promofilmno);
    return promofilmVO;
  }

  // 수정
  @Override
  public int update(PromofilmVO promofilmVO) {
    int cnt = this.promofilmDAO.update(promofilmVO);
    return cnt;
  }

  // 삭제
  @Override
  public int delete(int promofilmno) {
    int cnt = this.promofilmDAO.delete(promofilmno);
    return cnt;
  }

  // 
  @Override
  public ArrayList<Film_Promotion_VO> promotion_list_by_filmno(int filmno) {
    ArrayList<Film_Promotion_VO> promotion_list_by_filmno 
    = this.promofilmDAO.promotion_list_by_filmno(filmno);
    return promotion_list_by_filmno;
  }



  
}
