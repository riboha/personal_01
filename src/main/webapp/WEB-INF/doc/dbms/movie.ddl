/**********************************/
/* Table Name: 감독 */
/**********************************/
CREATE TABLE director(
		dirno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		dirnamekr                     		VARCHAR2(200)		 NOT NULL,
		dirnameen                     		VARCHAR2(200)		 NOT NULL,
		dirnation                     		VARCHAR2(100)		 NOT NULL,
		dirphoto                      		VARCHAR2(300)		 NULL ,
		dirthumb                      		VARCHAR2(300)		 NULL ,
		dirphotosize                  		NUMBER(10)		 NULL 
);

COMMENT ON TABLE director is '감독';
COMMENT ON COLUMN director.dirno is '감독 번호';
COMMENT ON COLUMN director.dirnamekr is '감독 한글 이름';
COMMENT ON COLUMN director.dirnameen is '감독 영어 이름';
COMMENT ON COLUMN director.dirnation is '감독 국적';
COMMENT ON COLUMN director.dirphoto is '감독 사진';
COMMENT ON COLUMN director.dirthumb is '감독 사진 썸네일';
COMMENT ON COLUMN director.dirphotosize is '감독 사진 크기';


/**********************************/
/* Table Name: 영화 */
/**********************************/
CREATE TABLE film(
		filmno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		titlekr                       		VARCHAR2(100)		 NOT NULL,
		titleen                       		VARCHAR2(100)		 NOT NULL,
		lan                           		VARCHAR2(60)		 NOT NULL,
		year                          		NUMBER(4)		 NOT NULL,
		len                           		NUMBER(4)		 NULL ,
		summary                       		CLOB(10)		 NOT NULL,
		restrict                      		NUMBER(10)		 NOT NULL,
		Youtube                       		VARCHAR2(1000)		 NULL ,
		url                           		VARCHAR2(1000)		 NULL ,
		poster                        		VARCHAR2(100)		 NULL ,
		posterthumb                   		VARCHAR2(100)		 NULL ,
		postersize                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		filmseq                       		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		hit                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		dirno                         		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (dirno) REFERENCES director (dirno)
);

COMMENT ON TABLE film is '영화';
COMMENT ON COLUMN film.filmno is '영화 번호';
COMMENT ON COLUMN film.titlekr is '한글 제목 ';
COMMENT ON COLUMN film.titleen is '영문 제목';
COMMENT ON COLUMN film.lan is '언어';
COMMENT ON COLUMN film.year is '개봉년도';
COMMENT ON COLUMN film.len is '길이';
COMMENT ON COLUMN film.summary is '줄거리';
COMMENT ON COLUMN film.restrict is '관람가';
COMMENT ON COLUMN film.Youtube is '유튜브';
COMMENT ON COLUMN film.url is '홈페이지';
COMMENT ON COLUMN film.poster is '포스터';
COMMENT ON COLUMN film.posterthumb is '썸네일';
COMMENT ON COLUMN film.postersize is '포스터 사이즈';
COMMENT ON COLUMN film.filmseq is '출력';
COMMENT ON COLUMN film.hit is '조회수';
COMMENT ON COLUMN film.dirno is '감독 번호';


/**********************************/
/* Table Name: 배우 */
/**********************************/
CREATE TABLE actor(
		actorno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		actorname                     		VARCHAR2(10)		 NOT NULL,
		born                          		VARCHAR2(8)		 NOT NULL,
		nation                        		VARCHAR2(60)		 NOT NULL,
		actorpic                      		VARCHAR2(100)		 NULL ,
		actorthumb                    		VARCHAR2(100)		 NULL ,
		actorpicsize                  		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE actor is '배우';
COMMENT ON COLUMN actor.actorno is '배우 번호';
COMMENT ON COLUMN actor.actorname is '이름';
COMMENT ON COLUMN actor.born is '생일';
COMMENT ON COLUMN actor.nation is '국적';
COMMENT ON COLUMN actor.actorpic is '프로필';
COMMENT ON COLUMN actor.actorthumb is '썸네일';
COMMENT ON COLUMN actor.actorpicsize is '프로필 크기';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		id                            		VARCHAR2(60)		 NOT NULL,
		pw                            		VARCHAR2(60)		 NOT NULL,
		nick                          		VARCHAR2(60)		 NOT NULL,
		tel                           		NUMBER(11)		 NOT NULL,
		pnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		birth                         		VARCHAR2(8)		 NOT NULL,
		email                         		VARCHAR2(100)		 NULL ,
		memthumb                      		VARCHAR2(60)		 NULL ,
		memfpic                       		VARCHAR2(60)		 NULL ,
		mempicsize                    		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원 번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.pw is '비밀번호';
COMMENT ON COLUMN member.nick is '닉네임';
COMMENT ON COLUMN member.tel is '휴대폰';
COMMENT ON COLUMN member.pnt is '포인트';
COMMENT ON COLUMN member.birth is '생년월일';
COMMENT ON COLUMN member.email is '이메일';
COMMENT ON COLUMN member.memthumb is '썸네일';
COMMENT ON COLUMN member.memfpic is '프로필';
COMMENT ON COLUMN member.mempicsize is '프로필 크기';


/**********************************/
/* Table Name: 총결제 */
/**********************************/
CREATE TABLE paytotal(
		paytotalno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		totalprice                    		NUMBER(10)		 NOT NULL,
		method                        		NUMBER(1)		 NOT NULL,
		paydate                       		DATE		 NOT NULL
);

COMMENT ON TABLE paytotal is '총결제';
COMMENT ON COLUMN paytotal.paytotalno is '총결제 번호';
COMMENT ON COLUMN paytotal.totalprice is '총 결제액';
COMMENT ON COLUMN paytotal.method is '결제 방식';
COMMENT ON COLUMN paytotal.paydate is '결제 일자';


/**********************************/
/* Table Name: 프로모션 */
/**********************************/
CREATE TABLE promotion(
		promono                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		promotitle                    		VARCHAR2(300)		 NOT NULL,
		promocontent                  		CLOB(300)		 NOT NULL,
		promodisc                     		NUMBER(3)		 DEFAULT 0		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE promotion is '프로모션';
COMMENT ON COLUMN promotion.promono is '프로모션 번호';
COMMENT ON COLUMN promotion.promotitle is '프로모션 제목';
COMMENT ON COLUMN promotion.promocontent is '프로모션 내용';
COMMENT ON COLUMN promotion.promodisc is '프로모션 할인율';
COMMENT ON COLUMN promotion.filmno is '영화 번호';


/**********************************/
/* Table Name: 결제 */
/**********************************/
CREATE TABLE pay(
		payno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		promodisc                     		NUMBER(3)		 NOT NULL,
		pointdisc                     		NUMBER(10)		 NOT NULL,
		originalprice                 		NUMBER(10)		 NOT NULL,
		payprice                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		paytotalno                    		NUMBER(10)		 NOT NULL,
		promono                       		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (paytotalno) REFERENCES paytotal (paytotalno),
  FOREIGN KEY (promono) REFERENCES promotion (promono),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE pay is '결제';
COMMENT ON COLUMN pay.payno is '결제 번호';
COMMENT ON COLUMN pay.promodisc is '결제 할인율';
COMMENT ON COLUMN pay.pointdisc is '포인트 할인액';
COMMENT ON COLUMN pay.originalprice is '결제 원 금액';
COMMENT ON COLUMN pay.payprice is '결제 최종 금액';
COMMENT ON COLUMN pay.memberno is '회원 번호';
COMMENT ON COLUMN pay.paytotalno is '총결제 번호';
COMMENT ON COLUMN pay.promono is '프로모션 번호';
COMMENT ON COLUMN pay.filmno is '영화 번호';


/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		payno                         		NUMBER(10)		 NOT NULL,
		words                         		VARCHAR2(1000)		 NULL ,
		rate                          		NUMBER(5)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (payno) REFERENCES pay (payno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE review is '리뷰';
COMMENT ON COLUMN review.reviewno is '리뷰 번호';
COMMENT ON COLUMN review.memberno is '회원 번호';
COMMENT ON COLUMN review.payno is '결제 세부 번호';
COMMENT ON COLUMN review.words is '리뷰';
COMMENT ON COLUMN review.rate is '평점';
COMMENT ON COLUMN review.rdate is '리뷰 날짜';
COMMENT ON COLUMN review.filmno is '영화 번호';


/**********************************/
/* Table Name: 출연진 */
/**********************************/
CREATE TABLE cast(
		castno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		actorno                       		NUMBER(10)		 NOT NULL,
		role                          		VARCHAR2(60)		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (actorno) REFERENCES actor (actorno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cast is '출연진';
COMMENT ON COLUMN cast.castno is '출연진 번호';
COMMENT ON COLUMN cast.actorno is '배우 번호';
COMMENT ON COLUMN cast.role is '역할';
COMMENT ON COLUMN cast.filmno is '영화 번호';


/**********************************/
/* Table Name: 키워드 */
/**********************************/
CREATE TABLE keyword(
		keywordno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		keyword                       		VARCHAR2(60)		 NOT NULL,
		keywordseq                    		NUMBER(30)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE keyword is '키워드';
COMMENT ON COLUMN keyword.keywordno is '키워드 번호';
COMMENT ON COLUMN keyword.keyword is '키워드 내용';
COMMENT ON COLUMN keyword.keywordseq is '키워드 출력순서';
COMMENT ON COLUMN keyword.filmno is '영화 번호';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		adminid                       		VARCHAR2(60)		 NOT NULL,
		adminpw                       		VARCHAR2(60)		 NOT NULL,
		admingrade                    		NUMBER(1)		 NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN admin.adminid is '아이디';
COMMENT ON COLUMN admin.adminpw is '비밀번호';
COMMENT ON COLUMN admin.admingrade is '등급';


/**********************************/
/* Table Name: 공지 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		noticetitle                   		VARCHAR2(2000)		 NOT NULL,
		noticecontent                 		CLOB(10)		 NOT NULL,
		noticedate                    		VARCHAR2(8)		 NOT NULL,
		noticeshow                    		NUMBER(0)		 DEFAULT 1		 NOT NULL,
		noticeseq                     		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE notice is '공지';
COMMENT ON COLUMN notice.noticeno is '공지 번호';
COMMENT ON COLUMN notice.noticetitle is '공지 제목';
COMMENT ON COLUMN notice.noticecontent is '공지 내용';
COMMENT ON COLUMN notice.noticedate is '공지 날짜';
COMMENT ON COLUMN notice.noticeshow is '공지 출력 여부';
COMMENT ON COLUMN notice.noticeseq is '출력 순서';
COMMENT ON COLUMN notice.adminno is '관리자 번호';


/**********************************/
/* Table Name: 문의 카테고리 */
/**********************************/
CREATE TABLE qcate(
		qcateno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		qcatetitle                    		VARCHAR2(100)		 NOT NULL,
		qcateicon                     		VARCHAR2(100)		 NOT NULL,
		qcateseq                      		NUMBER(10)		 DEFAULT 1		 NOT NULL
);

COMMENT ON TABLE qcate is '문의 카테고리';
COMMENT ON COLUMN qcate.qcateno is '문의 카테 번호';
COMMENT ON COLUMN qcate.qcatetitle is '문의 카테 제목';
COMMENT ON COLUMN qcate.qcateicon is '문의 카테 아이콘';
COMMENT ON COLUMN qcate.qcateseq is '문의 카테 순서';


/**********************************/
/* Table Name: 문의사항 */
/**********************************/
CREATE TABLE ques(
		quesno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		questitle                     		VARCHAR2(1000)		 NOT NULL,
		quescontent                   		CLOB(10)		 NOT NULL,
		quesdate                      		DATE		 NOT NULL,
		qcateno                       		NUMBER(3)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		payno                         		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (qcateno) REFERENCES qcate (qcateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (payno) REFERENCES pay (payno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE ques is '문의사항';
COMMENT ON COLUMN ques.quesno is '문의 번호';
COMMENT ON COLUMN ques.questitle is '문의 제목';
COMMENT ON COLUMN ques.quescontent is '문의 내용';
COMMENT ON COLUMN ques.quesdate is '문의사항 날짜';
COMMENT ON COLUMN ques.qcateno is '문의 카테 번호';
COMMENT ON COLUMN ques.memberno is '회원 번호';
COMMENT ON COLUMN ques.payno is '결제 세부 번호';
COMMENT ON COLUMN ques.filmno is '영화 번호';


/**********************************/
/* Table Name: 수상 */
/**********************************/
CREATE TABLE award(
		awardno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		awardname                     		VARCHAR2(100)		 NOT NULL,
		prize                         		VARCHAR2(100)		 NOT NULL,
		year                          		NUMBER(4)		 NOT NULL,
		awardseq                      		NUMBER(30)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE award is '수상';
COMMENT ON COLUMN award.awardno is '수상번호';
COMMENT ON COLUMN award.awardname is '시상식명';
COMMENT ON COLUMN award.prize is '부문';
COMMENT ON COLUMN award.year is '년도';
COMMENT ON COLUMN award.awardseq is '수상 출력순서';
COMMENT ON COLUMN award.filmno is '영화 번호';


/**********************************/
/* Table Name: 지원 언어 */
/**********************************/
CREATE TABLE language(
		languageno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		en                            		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		ch                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		es                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		fr                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		ar                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		rs                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		pt                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		de                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		jp                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		hi                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		kr                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE language is '지원 언어';
COMMENT ON COLUMN language.languageno is '지원 언어 번호';
COMMENT ON COLUMN language.en is '영어';
COMMENT ON COLUMN language.ch is '중국어(보통화)';
COMMENT ON COLUMN language.es is '스페인어';
COMMENT ON COLUMN language.fr is '프랑스어';
COMMENT ON COLUMN language.ar is '아랍어(표준)';
COMMENT ON COLUMN language.rs is '러시아어';
COMMENT ON COLUMN language.pt is '포르투갈어';
COMMENT ON COLUMN language.de is '독일어';
COMMENT ON COLUMN language.jp is '일본어';
COMMENT ON COLUMN language.hi is '힌디어';
COMMENT ON COLUMN language.kr is '한국어';
COMMENT ON COLUMN language.filmno is '영화 번호';


/**********************************/
/* Table Name: 지원 화질 */
/**********************************/
CREATE TABLE quality(
		qualno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		q576                          		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		q720                          		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		q1024                         		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		q1440                         		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE quality is '지원 화질';
COMMENT ON COLUMN quality.qualno is '지원 화질 번호';
COMMENT ON COLUMN quality.q576 is '576p';
COMMENT ON COLUMN quality.q720 is '720P';
COMMENT ON COLUMN quality.q1024 is '1024p';
COMMENT ON COLUMN quality.q1440 is '1440p';
COMMENT ON COLUMN quality.filmno is '영화 번호';


/**********************************/
/* Table Name: 장바구니 */
/**********************************/
CREATE TABLE cart(
		cartno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니 번호';
COMMENT ON COLUMN cart.memberno is '회원 번호';
COMMENT ON COLUMN cart.filmno is '영화 번호';


/**********************************/
/* Table Name: 자주묻는질문 */
/**********************************/
CREATE TABLE faq(
		faqno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		faqtitle                      		VARCHAR2(100)		 NOT NULL,
		faqq                          		CLOB(10)		 NOT NULL,
		faqa                          		CLOB(10)		 NOT NULL,
		faqhit                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		qcateno                       		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (qcateno) REFERENCES qcate (qcateno)
);

COMMENT ON TABLE faq is '자주묻는질문';
COMMENT ON COLUMN faq.faqno is '자묻질 번호';
COMMENT ON COLUMN faq.faqtitle is '자묻질 제목';
COMMENT ON COLUMN faq.faqq is '자묻질 내용';
COMMENT ON COLUMN faq.faqa is '자묻질 답변';
COMMENT ON COLUMN faq.faqhit is '자묻질 조회수';
COMMENT ON COLUMN faq.qcateno is '문의 카테 번호';


/**********************************/
/* Table Name: 장르 */
/**********************************/
CREATE TABLE genre(
		genreno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		genrename                     		VARCHAR2(60)		 NOT NULL,
		genreseq                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE genre is '장르';
COMMENT ON COLUMN genre.genreno is '장르 번호';
COMMENT ON COLUMN genre.genrename is '장르명';
COMMENT ON COLUMN genre.genreseq is '출력순서';


/**********************************/
/* Table Name: 보고싶은 영화 */
/**********************************/
CREATE TABLE wish(
		wishno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE wish is '보고싶은 영화';
COMMENT ON COLUMN wish.wishno is '회원 위시 번호';
COMMENT ON COLUMN wish.memberno is '회원 번호';
COMMENT ON COLUMN wish.filmno is '영화 번호';


/**********************************/
/* Table Name: 사진 */
/**********************************/
CREATE TABLE photo(
		photono                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		photoname                     		VARCHAR2(300)		 NOT NULL,
		photohumb                     		VARCHAR2(300)		 NOT NULL,
		photosize                     		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE photo is '사진';
COMMENT ON COLUMN photo.photono is '사진 번호';
COMMENT ON COLUMN photo.photoname is '사진 파일명';
COMMENT ON COLUMN photo.photohumb is '사진 썸네일';
COMMENT ON COLUMN photo.photosize is '사진 사이즈';
COMMENT ON COLUMN photo.filmno is '영화 번호';


/**********************************/
/* Table Name: 좋아하는 배우 */
/**********************************/
CREATE TABLE favactor(
		favactorno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		actorno                       		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (actorno) REFERENCES actor (actorno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE favactor is '좋아하는 배우';
COMMENT ON COLUMN favactor.favactorno is '좋아하는 배우 번호';
COMMENT ON COLUMN favactor.actorno is '배우 번호';
COMMENT ON COLUMN favactor.memberno is '회원 번호';


/**********************************/
/* Table Name: 좋아하는 감독 */
/**********************************/
CREATE TABLE favdirector(
		favedirno                     		NUMBER(10)		 NULL 		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
		dirno                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (dirno) REFERENCES director (dirno)
);

COMMENT ON TABLE favdirector is '좋아하는 감독';
COMMENT ON COLUMN favdirector.favedirno is '좋아하는 감독 번호';
COMMENT ON COLUMN favdirector.memberno is '회원 번호';
COMMENT ON COLUMN favdirector.dirno is '감독 번호';


/**********************************/
/* Table Name: 좋아하는 영화 */
/**********************************/
CREATE TABLE favmovie(
		favmovieno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE favmovie is '좋아하는 영화';
COMMENT ON COLUMN favmovie.favmovieno is '좋아하는 영화 번호';
COMMENT ON COLUMN favmovie.memberno is '회원 번호';
COMMENT ON COLUMN favmovie.filmno is '영화 번호';


/**********************************/
/* Table Name: 영화 장르 */
/**********************************/
CREATE TABLE fgenre(
		fgenreno                      		NUMBER(38)		 NOT NULL		 PRIMARY KEY,
		genreno                       		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (genreno) REFERENCES genre (genreno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE fgenre is '영화 장르';
COMMENT ON COLUMN fgenre.fgenreno is '영화 장르 번호';
COMMENT ON COLUMN fgenre.genreno is '장르 번호';
COMMENT ON COLUMN fgenre.filmno is '영화 번호';


