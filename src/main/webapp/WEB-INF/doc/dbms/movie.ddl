/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE director(
		dirno                         		NUMBER(10)		 NOT NULL,
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
		filmno                        		NUMBER(10)		 NOT NULL,
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
		dirno                         		NUMBER(10)		 NOT NULL
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
		actorno                       		NUMBER(10)		 NOT NULL,
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
		memberno                      		NUMBER(10)		 NOT NULL,
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
		paytotalno                    		NUMBER(10)		 NOT NULL,
		totalprice                    		NUMBER(10)		 NOT NULL,
		method                        		NUMBER(1)		 NOT NULL,
		paydate                       		DATE		 NOT NULL
);

COMMENT ON TABLE paytotal is '�Ѱ���';
COMMENT ON COLUMN paytotal.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN paytotal.totalprice is '�� ������';
COMMENT ON COLUMN paytotal.method is '���� ���';
COMMENT ON COLUMN paytotal.paydate is '���� ����';


/**********************************/
/* Table Name: ���θ�� */
/**********************************/
CREATE TABLE promotion(
		promono                       		NUMBER(10)		 NOT NULL,
		promotitle                    		VARCHAR2(300)		 NOT NULL,
		promocontent                  		CLOB(300)		 NOT NULL,
		promodisc                     		NUMBER(3)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE promotion is '���θ��';
COMMENT ON COLUMN promotion.promono is '���θ�� ��ȣ';
COMMENT ON COLUMN promotion.promotitle is '���θ�� ����';
COMMENT ON COLUMN promotion.promocontent is '���θ�� ����';
COMMENT ON COLUMN promotion.promodisc is '���θ�� ������';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE pay(
		payno                         		NUMBER(10)		 NOT NULL,
		promodisc                     		NUMBER(3)		 NOT NULL,
		pointdisc                     		NUMBER(10)		 NOT NULL,
		originalprice                 		NUMBER(10)		 NOT NULL,
		payprice                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		paytotalno                    		NUMBER(10)		 NOT NULL,
		promono                       		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE pay is '����';
COMMENT ON COLUMN pay.payno is '���� ��ȣ';
COMMENT ON COLUMN pay.promodisc is '���� ������';
COMMENT ON COLUMN pay.pointdisc is '����Ʈ ���ξ�';
COMMENT ON COLUMN pay.originalprice is '���� �� �ݾ�';
COMMENT ON COLUMN pay.payprice is '���� ���� �ݾ�';
COMMENT ON COLUMN pay.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN pay.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN pay.promono is '���θ�� ��ȣ';
COMMENT ON COLUMN pay.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		payno                         		NUMBER(10)		 NOT NULL,
		words                         		VARCHAR2(1000)		 NULL ,
		rate                          		NUMBER(5)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE review is '����';
COMMENT ON COLUMN review.reviewno is '���� ��ȣ';
COMMENT ON COLUMN review.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review.payno is '���� ���� ��ȣ';
COMMENT ON COLUMN review.words is '����';
COMMENT ON COLUMN review.rate is '����';
COMMENT ON COLUMN review.rdate is '���� ��¥';
COMMENT ON COLUMN review.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: �⿬�� */
/**********************************/
CREATE TABLE cast(
		castno                        		NUMBER(10)		 NOT NULL,
		actorno                       		NUMBER(10)		 NOT NULL,
		role                          		VARCHAR2(60)		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL 
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
		keywordno                     		NUMBER(10)		 NOT NULL,
		keyword                       		VARCHAR2(60)		 NOT NULL,
		keywordseq                    		NUMBER(30)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL 
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
		adminno                       		NUMBER(10)		 NOT NULL,
		adminid                       		VARCHAR2(60)		 NOT NULL,
		adminpw                       		VARCHAR2(60)		 NOT NULL,
		admingrade                    		NUMBER(1)		 NOT NULL
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
		noticeno                      		NUMBER(10)		 NOT NULL,
		noticetitle                   		VARCHAR2(2000)		 NOT NULL,
		noticecontent                 		CLOB(10)		 NOT NULL,
		noticedate                    		VARCHAR2(8)		 NOT NULL,
		noticeshow                    		NUMBER(0)		 DEFAULT 1		 NOT NULL,
		noticeseq                     		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL 
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
		qcateno                       		NUMBER(10)		 NOT NULL,
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
		quesno                        		NUMBER(10)		 NOT NULL,
		questitle                     		VARCHAR2(1000)		 NOT NULL,
		quescontent                   		CLOB(10)		 NOT NULL,
		quesdate                      		DATE		 NOT NULL,
		qcateno                       		NUMBER(3)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		payno                         		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL 
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
		awardno                       		NUMBER(10)		 NOT NULL,
		awardname                     		VARCHAR2(100)		 NOT NULL,
		prize                         		VARCHAR2(100)		 NOT NULL,
		year                          		NUMBER(4)		 NOT NULL,
		awardseq                      		NUMBER(30)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL
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
		languageno                    		NUMBER(10)		 NOT NULL,
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
		filmno                        		NUMBER(10)		 NULL 
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
		qualno                        		NUMBER(10)		 NOT NULL,
		q576                          		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		q720                          		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		q1024                         		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		q1440                         		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL
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
		cartno                        		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE cart is '��ٱ���';
COMMENT ON COLUMN cart.cartno is '��ٱ��� ��ȣ';
COMMENT ON COLUMN cart.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN cart.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���ֹ������� */
/**********************************/
CREATE TABLE faq(
		faqno                         		NUMBER(10)		 NOT NULL,
		faqtitle                      		VARCHAR2(100)		 NOT NULL,
		faqq                          		CLOB(10)		 NOT NULL,
		faqa                          		CLOB(10)		 NOT NULL,
		faqhit                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		qcateno                       		NUMBER(10)		 NOT NULL
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
		genreno                       		NUMBER(10)		 NOT NULL,
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
CREATE TABLE wish(
		wishno                        		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE wish is '������� ��ȭ';
COMMENT ON COLUMN wish.wishno is 'ȸ�� ���� ��ȣ';
COMMENT ON COLUMN wish.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN wish.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE photo(
		photono                       		NUMBER(10)		 NOT NULL,
		photoname                     		VARCHAR2(300)		 NOT NULL,
		photohumb                     		VARCHAR2(300)		 NOT NULL,
		photosize                     		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE photo is '����';
COMMENT ON COLUMN photo.photono is '���� ��ȣ';
COMMENT ON COLUMN photo.photoname is '���� ���ϸ�';
COMMENT ON COLUMN photo.photohumb is '���� �����';
COMMENT ON COLUMN photo.photosize is '���� ������';
COMMENT ON COLUMN photo.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: �����ϴ� ��� */
/**********************************/
CREATE TABLE favactor(
		favactorno                    		NUMBER(10)		 NOT NULL,
		actorno                       		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE favactor is '�����ϴ� ���';
COMMENT ON COLUMN favactor.favactorno is '�����ϴ� ��� ��ȣ';
COMMENT ON COLUMN favactor.actorno is '��� ��ȣ';
COMMENT ON COLUMN favactor.memberno is 'ȸ�� ��ȣ';


/**********************************/
/* Table Name: �����ϴ� ���� */
/**********************************/
CREATE TABLE favdirector(
		favedirno                     		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
		dirno                         		NUMBER(10)		 NULL 
);

COMMENT ON TABLE favdirector is '�����ϴ� ����';
COMMENT ON COLUMN favdirector.favedirno is '�����ϴ� ���� ��ȣ';
COMMENT ON COLUMN favdirector.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN favdirector.dirno is '���� ��ȣ';


/**********************************/
/* Table Name: �����ϴ� ��ȭ */
/**********************************/
CREATE TABLE favmovie(
		favmovieno                    		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		filmno                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE favmovie is '�����ϴ� ��ȭ';
COMMENT ON COLUMN favmovie.favmovieno is '�����ϴ� ��ȭ ��ȣ';
COMMENT ON COLUMN favmovie.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN favmovie.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ��ȭ �帣 */
/**********************************/
CREATE TABLE fgenre(
		fgenreno                      		NUMBER(38)		 NOT NULL,
		genreno                       		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE fgenre is '��ȭ �帣';
COMMENT ON COLUMN fgenre.fgenreno is '��ȭ �帣 ��ȣ';
COMMENT ON COLUMN fgenre.genreno is '�帣 ��ȣ';
COMMENT ON COLUMN fgenre.filmno is '��ȭ ��ȣ';


/**********************************/
/* Table Name: ���θ�� ��ȭ */
/**********************************/
CREATE TABLE promofilm (
		promofilmno                   		NUMBER(10)		 NOT NULL,
		promono                       		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE promofilm  is '���θ�� ��ȭ';
COMMENT ON COLUMN promofilm .promofilmno is '���θ�� ��ȭ ��ȣ';
COMMENT ON COLUMN promofilm .promono is '���θ�� ��ȣ';
COMMENT ON COLUMN promofilm .filmno is '��ȭ ��ȣ';



ALTER TABLE director ADD CONSTRAINT IDX_director_PK PRIMARY KEY (dirno);

ALTER TABLE film ADD CONSTRAINT IDX_film_PK PRIMARY KEY (filmno);
ALTER TABLE film ADD CONSTRAINT IDX_film_FK0 FOREIGN KEY (dirno) REFERENCES director (dirno);

ALTER TABLE actor ADD CONSTRAINT IDX_actor_PK PRIMARY KEY (actorno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (memberno);

ALTER TABLE paytotal ADD CONSTRAINT IDX_paytotal_PK PRIMARY KEY (paytotalno);

ALTER TABLE promotion ADD CONSTRAINT IDX_promotion_PK PRIMARY KEY (promono);

ALTER TABLE pay ADD CONSTRAINT IDX_pay_PK PRIMARY KEY (payno);
ALTER TABLE pay ADD CONSTRAINT IDX_pay_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);
ALTER TABLE pay ADD CONSTRAINT IDX_pay_FK1 FOREIGN KEY (paytotalno) REFERENCES paytotal (paytotalno);
ALTER TABLE pay ADD CONSTRAINT IDX_pay_FK2 FOREIGN KEY (promono) REFERENCES promotion (promono);
ALTER TABLE pay ADD CONSTRAINT IDX_pay_FK3 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (reviewno);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (payno) REFERENCES pay (payno);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK2 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE cast ADD CONSTRAINT IDX_cast_PK PRIMARY KEY (castno);
ALTER TABLE cast ADD CONSTRAINT IDX_cast_FK0 FOREIGN KEY (actorno) REFERENCES actor (actorno);
ALTER TABLE cast ADD CONSTRAINT IDX_cast_FK1 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE keyword ADD CONSTRAINT IDX_keyword_PK PRIMARY KEY (keywordno);
ALTER TABLE keyword ADD CONSTRAINT IDX_keyword_FK0 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE admin ADD CONSTRAINT IDX_admin_PK PRIMARY KEY (adminno);

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (noticeno);
ALTER TABLE notice ADD CONSTRAINT IDX_notice_FK0 FOREIGN KEY (adminno) REFERENCES admin (adminno);

ALTER TABLE qcate ADD CONSTRAINT IDX_qcate_PK PRIMARY KEY (qcateno);

ALTER TABLE ques ADD CONSTRAINT IDX_ques_PK PRIMARY KEY (quesno);
ALTER TABLE ques ADD CONSTRAINT IDX_ques_FK0 FOREIGN KEY (qcateno) REFERENCES qcate (qcateno);
ALTER TABLE ques ADD CONSTRAINT IDX_ques_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);
ALTER TABLE ques ADD CONSTRAINT IDX_ques_FK2 FOREIGN KEY (payno) REFERENCES pay (payno);
ALTER TABLE ques ADD CONSTRAINT IDX_ques_FK3 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE award ADD CONSTRAINT IDX_award_PK PRIMARY KEY (awardno);
ALTER TABLE award ADD CONSTRAINT IDX_award_FK0 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE language ADD CONSTRAINT IDX_language_PK PRIMARY KEY (languageno);
ALTER TABLE language ADD CONSTRAINT IDX_language_FK0 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE quality ADD CONSTRAINT IDX_quality_PK PRIMARY KEY (qualno);
ALTER TABLE quality ADD CONSTRAINT IDX_quality_FK0 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cartno);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE faq ADD CONSTRAINT IDX_faq_PK PRIMARY KEY (faqno);
ALTER TABLE faq ADD CONSTRAINT IDX_faq_FK0 FOREIGN KEY (qcateno) REFERENCES qcate (qcateno);

ALTER TABLE genre ADD CONSTRAINT IDX_genre_PK PRIMARY KEY (genreno);

ALTER TABLE wish ADD CONSTRAINT IDX_wish_PK PRIMARY KEY (wishno);
ALTER TABLE wish ADD CONSTRAINT IDX_wish_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);
ALTER TABLE wish ADD CONSTRAINT IDX_wish_FK1 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE photo ADD CONSTRAINT IDX_photo_PK PRIMARY KEY (photono);
ALTER TABLE photo ADD CONSTRAINT IDX_photo_FK0 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE favactor ADD CONSTRAINT IDX_favactor_PK PRIMARY KEY (favactorno);
ALTER TABLE favactor ADD CONSTRAINT IDX_favactor_FK0 FOREIGN KEY (actorno) REFERENCES actor (actorno);
ALTER TABLE favactor ADD CONSTRAINT IDX_favactor_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);

ALTER TABLE favdirector ADD CONSTRAINT IDX_favdirector_PK PRIMARY KEY (favedirno);
ALTER TABLE favdirector ADD CONSTRAINT IDX_favdirector_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);
ALTER TABLE favdirector ADD CONSTRAINT IDX_favdirector_FK1 FOREIGN KEY (dirno) REFERENCES director (dirno);

ALTER TABLE favmovie ADD CONSTRAINT IDX_favmovie_PK PRIMARY KEY (favmovieno);
ALTER TABLE favmovie ADD CONSTRAINT IDX_favmovie_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);
ALTER TABLE favmovie ADD CONSTRAINT IDX_favmovie_FK1 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE fgenre ADD CONSTRAINT IDX_fgenre_PK PRIMARY KEY (fgenreno);
ALTER TABLE fgenre ADD CONSTRAINT IDX_fgenre_FK0 FOREIGN KEY (genreno) REFERENCES genre (genreno);
ALTER TABLE fgenre ADD CONSTRAINT IDX_fgenre_FK1 FOREIGN KEY (filmno) REFERENCES film (filmno);

ALTER TABLE promofilm  ADD CONSTRAINT IDX_promofilm _PK PRIMARY KEY (promofilmno);
ALTER TABLE promofilm  ADD CONSTRAINT IDX_promofilm _FK0 FOREIGN KEY (promono) REFERENCES promotion (promono);
ALTER TABLE promofilm  ADD CONSTRAINT IDX_promofilm _FK1 FOREIGN KEY (filmno) REFERENCES film (filmno);

