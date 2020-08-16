package dev.mvc.paytotal;

public class PaytotalVO {
  
  //paytotalno                          NUMBER(10)       NOT NULL        PRIMARY KEY,
  //pricetotaloriginal                  NUMBER(10)       DEFAULT 0       NOT NULL,
  //pricetotaldiscount                  NUMBER(10)       DEFAULT 0       NOT NULL,
  //pricetotalfinal                  NUMBER(10)       DEFAULT 0       NOT NULL,
  //pntsave                             NUMBER(10)       DEFAULT 0       NOT NULL,
  //method                              NUMBER(1)        DEFAULT 0       NOT NULL,
  //paytotaldate                        DATE         DEFAULT '2020-08-15'        NOT NULL,
  //memberno                            NUMBER(10)       NOT NULL,
  //FOREIGN KEY (memberno) REFERENCES member (memberno)

  private int paytotalno; /**�Ѱ��� ��ȣ*/
  private int pricetotaloriginal; /**�Ѱ��� �� �ݾ�*/
  private int pricetotaldiscount; /**�Ѱ��� ���� �ݾ�*/
  private int pricetotalfinal; /**�Ѱ��� ���� �ݾ�*/
  private int pntsave; /**�Ѱ��� ���� ����Ʈ*/
  private int method; /**���� ���*/
  private String paytotaldate; /**���� ����*/
  private int memberno; /**ȸ�� ��ȣ*/
  
  
  public int getPaytotalno() {
    return paytotalno;
  }
  public void setPaytotalno(int paytotalno) {
    this.paytotalno = paytotalno;
  }
  public int getPricetotaloriginal() {
    return pricetotaloriginal;
  }
  public void setPricetotaloriginal(int pricetotaloriginal) {
    this.pricetotaloriginal = pricetotaloriginal;
  }
  public int getPricetotaldiscount() {
    return pricetotaldiscount;
  }
  public void setPricetotaldiscount(int pricetotaldiscount) {
    this.pricetotaldiscount = pricetotaldiscount;
  }
  public int getPricetotalfinal() {
    return pricetotalfinal;
  }
  public void setPricetotalfinal(int pricetotalfinal) {
    this.pricetotalfinal = pricetotalfinal;
  }
  public int getPntsave() {
    return pntsave;
  }
  public void setPntsave(int pntsave) {
    this.pntsave = pntsave;
  }
  public int getMethod() {
    return method;
  }
  public void setMethod(int method) {
    this.method = method;
  }
  public String getPaytotaldate() {
    return paytotaldate;
  }
  public void setPaytotaldate(String paytotaldate) {
    this.paytotaldate = paytotaldate;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  
  
  
}
