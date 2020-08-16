package dev.mvc.promofilm;

public class Film_Promotion_VO {

  /**PromovionVO*/
  private int filmno; /**영화 번호*/

  /**PromovionVO*/
  private int promono; /**프로모션 번호*/
  private String promotitle; /**프로모션 제목*/
  private int promopercent; /**프로모션 할인율*/
  private int promoamount; /**프로모션 할인액*/
  
  /**PromofilmVO*/
  private int promofilmno; /**프로모션 영화 번호*/
  private int promovalid; /**프로모션 진행 여부*/
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  public int getPromono() {
    return promono;
  }
  public void setPromono(int promono) {
    this.promono = promono;
  }
  public String getPromotitle() {
    return promotitle;
  }
  public void setPromotitle(String promotitle) {
    this.promotitle = promotitle;
  }
  public int getPromopercent() {
    return promopercent;
  }
  public void setPromopercent(int promopercent) {
    this.promopercent = promopercent;
  }
  public int getPromoamount() {
    return promoamount;
  }
  public void setPromoamount(int promoamount) {
    this.promoamount = promoamount;
  }
  public int getPromofilmno() {
    return promofilmno;
  }
  public void setPromofilmno(int promofilmno) {
    this.promofilmno = promofilmno;
  }
  public int getPromovalid() {
    return promovalid;
  }
  public void setPromovalid(int promovalid) {
    this.promovalid = promovalid;
  }

  
    
}
