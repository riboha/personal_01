package dev.mvc.review;

public class Member_Review_VO {


  /**ReviewVO*/
  private int reviewno; /**리뷰 번호*/
  private String title; /**제목*/
  private String review; /**내용*/
  private double rate; /**평점*/
  private String rdate; /**리뷰 날짜*/
  private int payno; /**결제 세부 번호*/
  private int memberno; /**회원 번호*/
  private int filmno; /**영화 번호*/  
  
  /**MemberVO*/
  private int m_memberno; /**회원 번호*/
  private String nick; /**닉네임*/
  private String memthumb; /**프로필 썸네일*/
  
  
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
