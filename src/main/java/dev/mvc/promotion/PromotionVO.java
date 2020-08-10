package dev.mvc.promotion;

public class PromotionVO {
  
//    promono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//    promotitle                          VARCHAR2(300)        NOT NULL,
//    promocontent                        CLOB       NOT NULL,
//    promodisc                           NUMBER(3)        DEFAULT 0       NOT NULL,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

  private int promono; /**프로모션 번호*/
  private String promotitle; /**프로모션 제목*/
  private String promocontent; /**프로모션 내용*/
  private int promodisc; /**프로모션 할인율*/
  
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
  public String getPromocontent() {
    return promocontent;
  }
  public void setPromocontent(String promocontent) {
    this.promocontent = promocontent;
  }
  public int getPromodisc() {
    return promodisc;
  }
  public void setPromodisc(int promodisc) {
    this.promodisc = promodisc;
  }

}
