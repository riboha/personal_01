package dev.mvc.promofilm;

public class Film_Promotion_VO {

  /**PromovionVO*/
  private int filmno; /**��ȭ ��ȣ*/

  /**PromovionVO*/
  private int promono; /**���θ�� ��ȣ*/
  private String promotitle; /**���θ�� ����*/
  private int promopercent; /**���θ�� ������*/
  private int promoamount; /**���θ�� ���ξ�*/
  
  /**PromofilmVO*/
  private int promofilmno; /**���θ�� ��ȭ ��ȣ*/
  private int promovalid; /**���θ�� ���� ����*/
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
