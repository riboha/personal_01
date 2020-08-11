package dev.mvc.promotion;

public class PromotionVO {
  
//    promono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//    promotitle                          VARCHAR2(300)        NOT NULL,
//    promocontent                        CLOB       NOT NULL,
//    promodisc                           NUMBER(3)        DEFAULT 0       NOT NULL,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)

  private int promono; /**���θ�� ��ȣ*/
  private String promotitle; /**���θ�� ����*/
  private String promocontent; /**���θ�� ����*/
  private int promodisc; /**���θ�� ������*/
  private int promovalid; /**���θ�� ���� ����*/
  private String promostart; /**���θ�� ����*/
  private String promoend; /**���θ�� ����*/
  
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
  public int getPromovalid() {
    return promovalid;
  }
  public void setPromovalid(int promovalid) {
    this.promovalid = promovalid;
  }
  public String getPromostart() {
    return promostart;
  }
  public void setPromostart(String promostart) {
    this.promostart = promostart;
  }
  public String getPromoend() {
    return promoend;
  }
  public void setPromoend(String promoend) {
    this.promoend = promoend;
  }

}
