package dev.mvc.quality;

public class QualityVO {
  

//CREATE TABLE quality(
//        qualno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
//        q576                                NUMBER(1)        DEFAULT 1       NOT NULL,
//        q720                                NUMBER(1)        DEFAULT 1       NOT NULL,
//        q1024                               NUMBER(1)        DEFAULT 1       NOT NULL,
//        q1440                               NUMBER(1)        DEFAULT 1       NOT NULL,
//        filmno                              NUMBER(10)       NOT NULL,
//  FOREIGN KEY (filmno) REFERENCES film (filmno)
//);

  private int qualno; /**지원 화질 번호*/
  private int q576; /**576p*/
  private int q720; /**720p*/
  private int q1024; /**1024p*/
  private int q1440; /**1440p*/
  private int filmno; /**영화 번호*/
  public int getQualno() {
    return qualno;
  }
  public void setQualno(int qualno) {
    this.qualno = qualno;
  }
  public int getQ576() {
    return q576;
  }
  public void setQ576(int q576) {
    this.q576 = q576;
  }
  public int getQ720() {
    return q720;
  }
  public void setQ720(int q720) {
    this.q720 = q720;
  }
  public int getQ1024() {
    return q1024;
  }
  public void setQ1024(int q1024) {
    this.q1024 = q1024;
  }
  public int getQ1440() {
    return q1440;
  }
  public void setQ1440(int q1440) {
    this.q1440 = q1440;
  }
  public int getFilmno() {
    return filmno;
  }
  public void setFilmno(int filmno) {
    this.filmno = filmno;
  }
  
  @Override
  public String toString() {
    return "QualityVO [qualno=" + qualno + ", q576=" + q576 + ", q720=" + q720 + ", q1024=" + q1024 + ", q1440=" + q1440
        + ", filmno=" + filmno + "]";
  }
  
  
  

}
