package dev.mvc.promotion;

public class PromotionVO {
  
  //  promono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
  //  promotitle                          VARCHAR2(300)        NOT NULL,
  //  promodetail                         CLOB(300)        NOT NULL,
  //  promopercent                        NUMBER(3)        DEFAULT 0       NOT NULL,
  //  promoamount                         NUMBER(10)       DEFAULT 0       NOT NULL,
  //  promovalid                          NUMBER(1)        DEFAULT 1       NOT NULL,
  //  promostart                          DATE         NOT NULL,
  //  promoend                            DATE         NOT NULL
  private int promono; /**���θ�� ��ȣ*/
  private String promotitle; /**���θ�� ����*/
  private String promodetail; /**���θ�� ����*/
  private int promopercent; /**���θ�� ������*/
  private int promoamount; /**���θ�� ���ξ�*/
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
  public String getPromodetail() {
    return promodetail;
  }
  public void setPromodetail(String promodetail) {
    this.promodetail = promodetail;
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
