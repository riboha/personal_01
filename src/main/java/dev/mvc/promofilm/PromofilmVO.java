package dev.mvc.promofilm;

public class PromofilmVO {
  
//      promofilmno                         NUMBER(10)       NOT NULL,
//      promono                             NUMBER(10)       NOT NULL,
//      filmno                              NUMBER(10)       NOT NULL

  private int promofilmno; /**���θ�� ��ȭ ��ȣ*/
  private int promono; /**���θ�� ��ȣ*/
  private int filmno; /**��ȭ ��ȣ*/
  
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
