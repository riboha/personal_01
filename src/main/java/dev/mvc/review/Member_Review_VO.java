package dev.mvc.review;

public class Member_Review_VO {


  /**ReviewVO*/
  private int reviewno; /**���� ��ȣ*/
  private String title; /**����*/
  private String review; /**����*/
  private double rate; /**����*/
  private String rdate; /**���� ��¥*/
  private int payno; /**���� ���� ��ȣ*/
  private int memberno; /**ȸ�� ��ȣ*/
  private int filmno; /**��ȭ ��ȣ*/  
  
  /**MemberVO*/
  private int m_memberno; /**ȸ�� ��ȣ*/
  private String nick; /**�г���*/
  private String memthumb; /**������ �����*/
  
  
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getReview() {
    return review;
  }
  public void setReview(String review) {
    this.review = review;
  }
  public double getRate() {
    return rate;
  }
  public void setRate(double rate) {
    this.rate = rate;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getPayno() {
    return payno;
  }
  public void setPayno(int payno) {
    this.payno = payno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  public int getM_memberno() {
    return m_memberno;
  }
  public void setM_memberno(int m_memberno) {
    this.m_memberno = m_memberno;
  }
  public String getNick() {
    return nick;
  }
  public void setNick(String nick) {
    this.nick = nick;
  }
  public String getMemthumb() {
    return memthumb;
  }
  public void setMemthumb(String memthumb) {
    this.memthumb = memthumb;
  }
  
  
  

}
