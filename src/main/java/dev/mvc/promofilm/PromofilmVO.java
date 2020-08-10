package dev.mvc.promofilm;

public class PromofilmVO {
  
//      promofilmno                         NUMBER(10)       NOT NULL,
//      promono                             NUMBER(10)       NOT NULL,
//      filmno                              NUMBER(10)       NOT NULL

  private int promofilmno; /**프로모션 영화 번호*/
  private int promono; /**프로모션 번호*/
  private int filmno; /**영화 번호*/
  
  public int getPromofilmno() {
    return promofilmno;
  }
  public void setPromofilmno(int promofilmno) {
    this.promofilmno = promofilmno;
  }
  public int getPromono() {
    return promono;
  }
  public void setPromono(int promono) {
    this.promono = promono;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  
  
}
