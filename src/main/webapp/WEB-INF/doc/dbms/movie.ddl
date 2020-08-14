DROP TABLE rentprice CASCADE CONSTRAINTS;
DROP TABLE promofilm  CASCADE CONSTRAINTS;
DROP TABLE filmgenre CASCADE CONSTRAINTS;
DROP TABLE filmfav CASCADE CONSTRAINTS;
DROP TABLE directorfav CASCADE CONSTRAINTS;
DROP TABLE actorfav CASCADE CONSTRAINTS;
DROP TABLE photo CASCADE CONSTRAINTS;
DROP TABLE filmwish CASCADE CONSTRAINTS;
DROP TABLE genre CASCADE CONSTRAINTS;
DROP TABLE faq CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE quality CASCADE CONSTRAINTS;
DROP TABLE language CASCADE CONSTRAINTS;
DROP TABLE award CASCADE CONSTRAINTS;
DROP TABLE ques CASCADE CONSTRAINTS;
DROP TABLE qcate CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE keyword CASCADE CONSTRAINTS;
DROP TABLE cast CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE pay CASCADE CONSTRAINTS;
DROP TABLE promotion CASCADE CONSTRAINTS;
DROP TABLE paytotal CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE actor CASCADE CONSTRAINTS;
DROP TABLE film CASCADE CONSTRAINTS;
DROP TABLE director CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ���� */
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

COMMENT ON TABLE director is '����';
COMMENT ON COLUMN director.dirno is '���� ��ȣ';
COMMENT ON COLUMN director.dirnamekr is '���� �ѱ� �̸�';
COMMENT ON COLUMN director.dirnameen is '���� ���� �̸�';
COMMENT ON COLUMN director.dirnation is '���� ����';
COMMENT ON COLUMN director.dirphoto is '���� ����';
COMMENT ON COLUMN director.dirthumb is '���� ���� �����';
COMMENT ON COLUMN director.dirphotosize is '���� ���� ũ��';


/**********************************/
/* Table Name: ��ȭ */
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

COMMENT ON TABLE film is '��ȭ';
COMMENT ON COLUMN film.filmno is '��ȭ ��ȣ';
COMMENT ON COLUMN film.titlekr is '�ѱ� ���� ';
COMMENT ON COLUMN film.titleen is '���� ����';
COMMENT ON COLUMN film.lan is '���';
COMMENT ON COLUMN film.year is '�����⵵';
COMMENT ON COLUMN film.len is '����';
COMMENT ON COLUMN film.summary is '�ٰŸ�';
COMMENT ON COLUMN film.restrict is '������';
COMMENT ON COLUMN film.Youtube is '��Ʃ��';
COMMENT ON COLUMN film.url is 'Ȩ������';
COMMENT ON COLUMN film.poster is '������';
COMMENT ON COLUMN film.posterthumb is '�����';
COMMENT ON COLUMN film.postersize is '������ ������';
COMMENT ON COLUMN film.filmseq is '���';
COMMENT ON COLUMN film.hit is '��ȸ��';
COMMENT ON COLUMN film.dirno is '���� ��ȣ';


/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE actor(
		actorno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		actornameen                   		VARCHAR2(100)		 NOT NULL,
		actornamekr                   		VARCHAR2(100)		 NOT NULL,
		birth                         		DATE		 NOT NULL,
		nation                        		VARCHAR2(100)		 NOT NULL,
		actorpic                      		VARCHAR2(100)		 NULL ,
		actorthumb                    		VARCHAR2(100)		 NULL ,
		actorpicsize                  		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		actorhit                      		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE actor is '���';
COMMENT ON COLUMN actor.actorno is '��� ��ȣ';
COMMENT ON COLUMN actor.actornameen is '���� �̸�';
COMMENT ON COLUMN actor.actornamekr is '�ѱ� �̸�';
COMMENT ON COLUMN actor.birth is '�������';
COMMENT ON COLUMN actor.nation is '����';
COMMENT ON COLUMN actor.actorpic is '������';
COMMENT ON COLUMN actor.actorthumb is '�����';
COMMENT ON COLUMN actor.actorpicsize is '������ ũ��';
COMMENT ON COLUMN actor.actorhit is '���ƿ��';


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		id                            		VARCHAR2(60)		 NOT NULL,
		pw                            		VARCHAR2(60)		 NOT NULL,
		nick                          		VARCHAR2(60)		 NOT NULL,
		tel                           		NUMBER(11)		 NOT NULL,
		pnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		birth                         		DATE		 NOT NULL,
		email                         		VARCHAR2(100)		 NULL ,
		memthumb                      		VARCHAR2(60)		 NULL ,
		mempic                        		VARCHAR2(60)		 NULL ,
		mempicsize                    		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE member is 'ȸ��';
COMMENT ON COLUMN member.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN member.id is '���̵�';
COMMENT ON COLUMN member.pw is '��й�ȣ';
COMMENT ON COLUMN member.nick is '�г���';
COMMENT ON COLUMN member.tel is '�޴���';
COMMENT ON COLUMN member.pnt is '����Ʈ';
COMMENT ON COLUMN member.birth is '�������';
COMMENT ON COLUMN member.email is '�̸���';
COMMENT ON COLUMN member.memthumb is '�����';
COMMENT ON COLUMN member.mempic is '������';
COMMENT ON COLUMN member.mempicsize is '������ ũ��';


/**********************************/
/* Table Name: �Ѱ��� */
/**********************************/
CREATE TABLE paytotal(
		paytotalno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		pricetotal                    		NUMBER(10)		 NOT NULL,
		pntsave                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		method                        		NUMBER(1)		 NOT NULL,
		paydate                       		DATE		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE paytotal is '�Ѱ���';
COMMENT ON COLUMN paytotal.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN paytotal.pricetotal is '�� ������';
COMMENT ON COLUMN paytotal.pntsave is '���� ����Ʈ';
COMMENT ON COLUMN paytotal.method is '���� ���';
COMMENT ON COLUMN paytotal.paydate is '���� ����';
COMMENT ON COLUMN paytotal.memberno is 'ȸ�� ��ȣ';


/**********************************/
/* Table Name: ���θ�� */
/**********************************/
CREATE TABLE promotion(
		promono                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		promotitle                    		VARCHAR2(300)		 NOT NULL,
		promocontent                  		CLOB(300)		 NOT NULL,
		promodisc                     		NUMBER(3)		 DEFAULT 0		 NOT NULL,
		promovalid                    		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		promostart                    		DATE		 NOT NULL,
		promoend                      		DATE		 NOT NULL
);

COMMENT ON TABLE promotion is '���θ��';
COMMENT ON COLUMN promotion.promono is '���θ�� ��ȣ';
COMMENT ON COLUMN promotion.promotitle is '���θ�� ����';
COMMENT ON COLUMN promotion.promocontent is '���θ�� ����';
COMMENT ON COLUMN promotion.promodisc is '���θ�� ������';
COMMENT ON COLUMN promotion.promovalid is '���θ�� ���� ����';
COMMENT ON COLUMN promotion.promostart is '���θ�� ����';
COMMENT ON COLUMN promotion.promoend is '���θ�� ����';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE pay(
		payno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		optionlan                     		VARCHAR2(10)		 NOT NULL,
		optionqual                    		VARCHAR2(10)		 NOT NULL,
		optionprice                   		NUMBER(10)		 NOT NULL,
		optionrent                    		VARCHAR2(10)		 NOT NULL,
		pntdisc                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		promodiscper                  		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		promodiscsub                  		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		priceoriginal                 		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		price                         		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		paytotalno                    		NUMBER(10)		 NOT NULL,
		promono                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (paytotalno) REFERENCES paytotal (paytotalno),
  FOREIGN KEY (promono) REFERENCES promotion (promono),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE pay is '����';
COMMENT ON COLUMN pay.payno is '���� ��ȣ';
COMMENT ON COLUMN pay.optionlan is '�ɼ� ���';
COMMENT ON COLUMN pay.optionqual is '�ɼ� ȭ��';
COMMENT ON COLUMN pay.optionprice is '�ɼ� ����';
COMMENT ON COLUMN pay.optionrent is '�ɼ� �뿩';
COMMENT ON COLUMN pay.pntdisc is '����Ʈ ���ξ�';
COMMENT ON COLUMN pay.promodiscper is '���θ�� ������';
COMMENT ON COLUMN pay.promodiscsub is '���θ�� ���ξ�';
COMMENT ON COLUMN pay.priceoriginal is '���� �� �ݾ�';
COMMENT ON COLUMN pay.price is '���� ���� �ݾ�';
COMMENT ON COLUMN pay.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN pay.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN pay.promono is '���θ�� ��ȣ';
COMMENT ON COLUMN pay.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		review                        		VARCHAR2(1000)		 NOT NULL,
		rate                          		NUMBER(2, 1)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		payno                         		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (payno) REFERENCES pay (payno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE review is '����';
COMMENT ON COLUMN review.reviewno is '���� ��ȣ';
COMMENT ON COLUMN review.title is '����';
COMMENT ON COLUMN review.review is '����';
COMMENT ON COLUMN review.rate is '����';
COMMENT ON COLUMN review.rdate is '���� ��¥';
COMMENT ON COLUMN review.payno is '���� ���� ��ȣ';
COMMENT ON COLUMN review.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: �⿬�� */
/**********************************/
CREATE TABLE cast(
		castno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		actorno                       		NUMBER(10)		 NOT NULL,
		role                          		VARCHAR2(60)		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (actorno) REFERENCES actor (actorno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cast is '�⿬��';
COMMENT ON COLUMN cast.castno is '�⿬�� ��ȣ';
COMMENT ON COLUMN cast.actorno is '��� ��ȣ';
COMMENT ON COLUMN cast.role is '����';
COMMENT ON COLUMN cast.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: Ű���� */
/**********************************/
CREATE TABLE keyword(
		keywordno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		keyword                       		VARCHAR2(60)		 NOT NULL,
		keywordseq                    		NUMBER(30)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE keyword is 'Ű����';
COMMENT ON COLUMN keyword.keywordno is 'Ű���� ��ȣ';
COMMENT ON COLUMN keyword.keyword is 'Ű���� ����';
COMMENT ON COLUMN keyword.keywordseq is 'Ű���� ��¼���';
COMMENT ON COLUMN keyword.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		adminid                       		VARCHAR2(60)		 NOT NULL,
		adminpw                       		VARCHAR2(60)		 NOT NULL,
		admingrade                    		NUMBER(1)		 DEFAULT 1		 NOT NULL
);

COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.adminno is '������ ��ȣ';
COMMENT ON COLUMN admin.adminid is '���̵�';
COMMENT ON COLUMN admin.adminpw is '��й�ȣ';
COMMENT ON COLUMN admin.admingrade is '���';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		noticetitle                   		VARCHAR2(200)		 NOT NULL,
		noticecontent                 		CLOB(10)		 NOT NULL,
		noticedate                    		DATE		 NOT NULL,
		noticeshow                    		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		noticeseq                     		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		adminno                       		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE notice is '����';
COMMENT ON COLUMN notice.noticeno is '���� ��ȣ';
COMMENT ON COLUMN notice.noticetitle is '���� ����';
COMMENT ON COLUMN notice.noticecontent is '���� ����';
COMMENT ON COLUMN notice.noticedate is '���� ��¥';
COMMENT ON COLUMN notice.noticeshow is '���� ��� ����';
COMMENT ON COLUMN notice.noticeseq is '��� ����';
COMMENT ON COLUMN notice.adminno is '������ ��ȣ';


/**********************************/
/* Table Name: ���� ī�װ� */
/**********************************/
CREATE TABLE qcate(
		qcateno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		qcatetitle                    		VARCHAR2(100)		 NOT NULL,
		qcateicon                     		VARCHAR2(100)		 NOT NULL,
		qcateseq                      		NUMBER(10)		 DEFAULT 1		 NOT NULL
);

COMMENT ON TABLE qcate is '���� ī�װ�';
COMMENT ON COLUMN qcate.qcateno is '���� ī�� ��ȣ';
COMMENT ON COLUMN qcate.qcatetitle is '���� ī�� ����';
COMMENT ON COLUMN qcate.qcateicon is '���� ī�� ������';
COMMENT ON COLUMN qcate.qcateseq is '���� ī�� ����';


/**********************************/
/* Table Name: ���ǻ��� */
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

COMMENT ON TABLE ques is '���ǻ���';
COMMENT ON COLUMN ques.quesno is '���� ��ȣ';
COMMENT ON COLUMN ques.questitle is '���� ����';
COMMENT ON COLUMN ques.quescontent is '���� ����';
COMMENT ON COLUMN ques.quesdate is '���� ��¥';
COMMENT ON COLUMN ques.qcateno is '���� ī�� ��ȣ';
COMMENT ON COLUMN ques.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN ques.payno is '���� ���� ��ȣ';
COMMENT ON COLUMN ques.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���� */
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

COMMENT ON TABLE award is '����';
COMMENT ON COLUMN award.awardno is '�����ȣ';
COMMENT ON COLUMN award.awardname is '�û�ĸ�';
COMMENT ON COLUMN award.prize is '�ι�';
COMMENT ON COLUMN award.year is '�⵵';
COMMENT ON COLUMN award.awardseq is '���� ��¼���';
COMMENT ON COLUMN award.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���� ��� */
/**********************************/
CREATE TABLE language(
		languageno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		en                            		NUMBER(1)		 DEFAULT 0		 NOT NULL,
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
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE language is '���� ���';
COMMENT ON COLUMN language.languageno is '���� ��� ��ȣ';
COMMENT ON COLUMN language.en is '����';
COMMENT ON COLUMN language.ch is '�߱���(����ȭ)';
COMMENT ON COLUMN language.es is '�����ξ�';
COMMENT ON COLUMN language.fr is '��������';
COMMENT ON COLUMN language.ar is '�ƶ���(ǥ��)';
COMMENT ON COLUMN language.rs is '���þƾ�';
COMMENT ON COLUMN language.pt is '����������';
COMMENT ON COLUMN language.de is '���Ͼ�';
COMMENT ON COLUMN language.jp is '�Ϻ���';
COMMENT ON COLUMN language.hi is '�����';
COMMENT ON COLUMN language.kr is '�ѱ���';
COMMENT ON COLUMN language.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���� ȭ�� */
/**********************************/
CREATE TABLE quality(
		qualno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		q576                          		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		q720                          		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		q1024                         		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		q1440                         		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE quality is '���� ȭ��';
COMMENT ON COLUMN quality.qualno is '���� ȭ�� ��ȣ';
COMMENT ON COLUMN quality.q576 is '576p';
COMMENT ON COLUMN quality.q720 is '720P';
COMMENT ON COLUMN quality.q1024 is '1024p';
COMMENT ON COLUMN quality.q1440 is '1440p';
COMMENT ON COLUMN quality.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
CREATE TABLE cart(
		cartno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		optionlan                     		VARCHAR2(10)		 NOT NULL,
		optionqual                    		VARCHAR2(10)		 NOT NULL,
		optionprice                   		NUMBER(10)		 NOT NULL,
		optionrent                    		VARCHAR2(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cart is '��ٱ���';
COMMENT ON COLUMN cart.cartno is '��ٱ��� ��ȣ';
COMMENT ON COLUMN cart.optionlan is '�ɼ� ���';
COMMENT ON COLUMN cart.optionqual is '�ɼ� ȭ��';
COMMENT ON COLUMN cart.optionprice is '�ɼ� ����';
COMMENT ON COLUMN cart.optionrent is '�ɼ� �뿩';
COMMENT ON COLUMN cart.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN cart.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���ֹ������� */
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

COMMENT ON TABLE faq is '���ֹ�������';
COMMENT ON COLUMN faq.faqno is '�ڹ��� ��ȣ';
COMMENT ON COLUMN faq.faqtitle is '�ڹ��� ����';
COMMENT ON COLUMN faq.faqq is '�ڹ��� ����';
COMMENT ON COLUMN faq.faqa is '�ڹ��� �亯';
COMMENT ON COLUMN faq.faqhit is '�ڹ��� ��ȸ��';
COMMENT ON COLUMN faq.qcateno is '���� ī�� ��ȣ';


/**********************************/
/* Table Name: �帣 */
/**********************************/
CREATE TABLE genre(
		genreno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		genrename                     		VARCHAR2(60)		 NOT NULL,
		genreseq                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE genre is '�帣';
COMMENT ON COLUMN genre.genreno is '�帣 ��ȣ';
COMMENT ON COLUMN genre.genrename is '�帣��';
COMMENT ON COLUMN genre.genreseq is '��¼���';


/**********************************/
/* Table Name: ������� ��ȭ */
/**********************************/
CREATE TABLE filmwish(
		filmwishno                    		NUMBER(30)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE filmwish is '������� ��ȭ';
COMMENT ON COLUMN filmwish.filmwishno is '������� ��ȭ ��ȣ';
COMMENT ON COLUMN filmwish.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN filmwish.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ��ȭ ���� */
/**********************************/
CREATE TABLE photo(
		photono                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		photoname                     		VARCHAR2(300)		 NOT NULL,
		photoalt                      		VARCHAR2(1000)		 NULL ,
		photothumb                    		VARCHAR2(300)		 NOT NULL,
		photosize                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE photo is '��ȭ ����';
COMMENT ON COLUMN photo.photono is '��ȭ ���� ��ȣ';
COMMENT ON COLUMN photo.photoname is '��ȭ ����';
COMMENT ON COLUMN photo.photoalt is '��ȭ ���� ����';
COMMENT ON COLUMN photo.photothumb is '��ȭ ���� �����';
COMMENT ON COLUMN photo.photosize is '��ȭ ���� ������';
COMMENT ON COLUMN photo.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: �����ϴ� ��� */
/**********************************/
CREATE TABLE actorfav(
		actorfavno                    		NUMBER(30)		 NOT NULL		 PRIMARY KEY,
		actorno                       		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (actorno) REFERENCES actor (actorno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE actorfav is '�����ϴ� ���';
COMMENT ON COLUMN actorfav.actorfavno is '�����ϴ� ��� ��ȣ';
COMMENT ON COLUMN actorfav.actorno is '��� ��ȣ';
COMMENT ON COLUMN actorfav.memberno is 'ȸ�� ��ȣ';


/**********************************/
/* Table Name: �����ϴ� ���� */
/**********************************/
CREATE TABLE directorfav(
		dirfavno                      		NUMBER(30)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		dirno                         		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (dirno) REFERENCES director (dirno)
);

COMMENT ON TABLE directorfav is '�����ϴ� ����';
COMMENT ON COLUMN directorfav.dirfavno is '�����ϴ� ���� ��ȣ';
COMMENT ON COLUMN directorfav.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN directorfav.dirno is '���� ��ȣ';


/**********************************/
/* Table Name: �����ϴ� ��ȭ */
/**********************************/
CREATE TABLE filmfav(
		filmfavno                     		NUMBER(30)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE filmfav is '�����ϴ� ��ȭ';
COMMENT ON COLUMN filmfav.filmfavno is '�����ϴ� ��ȭ ��ȣ';
COMMENT ON COLUMN filmfav.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN filmfav.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ��ȭ �帣 */
/**********************************/
CREATE TABLE filmgenre(
		filmgenreno                   		NUMBER(30)		 NOT NULL		 PRIMARY KEY,
		genreno                       		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (genreno) REFERENCES genre (genreno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE filmgenre is '��ȭ �帣';
COMMENT ON COLUMN filmgenre.filmgenreno is '��ȭ �帣 ��ȣ';
COMMENT ON COLUMN filmgenre.genreno is '�帣 ��ȣ';
COMMENT ON COLUMN filmgenre.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���θ�� ��ȭ */
/**********************************/
CREATE TABLE promofilm (
		promofilmno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		promono                       		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (promono) REFERENCES promotion (promono),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE promofilm  is '���θ�� ��ȭ';
COMMENT ON COLUMN promofilm .promofilmno is '���θ�� ��ȭ ��ȣ';
COMMENT ON COLUMN promofilm .promono is '���θ�� ��ȣ';
COMMENT ON COLUMN promofilm .filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: �뿩�� ���� */
/**********************************/
CREATE TABLE rentprice(
		rentpriceno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		day1                          		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		day3                          		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		day7                          		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		day30                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		dayperm                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE rentprice is '�뿩�� ����';
COMMENT ON COLUMN rentprice.rentpriceno is '�뿩�� ���� ��ȣ';
COMMENT ON COLUMN rentprice.day1 is '1��';
COMMENT ON COLUMN rentprice.day3 is '3��';
COMMENT ON COLUMN rentprice.day7 is '7��';
COMMENT ON COLUMN rentprice.day30 is '30��';
COMMENT ON COLUMN rentprice.dayperm is '��������';
COMMENT ON COLUMN rentprice.filmno is '��ȭ ��ȣ';


