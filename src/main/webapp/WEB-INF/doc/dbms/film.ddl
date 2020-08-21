/**********************************/
/* Table Name: ��ȭ */
/**********************************/

DROP TABLE film CASCADE CONSTRAINTS;

CREATE TABLE film(
		filmno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		titlekr                       		VARCHAR2(100)		 NOT NULL,
		titleen                       		VARCHAR2(100)		 NOT NULL,
		lan                           		VARCHAR2(60)		 NOT NULL,
		year                          		NUMBER(4)		 NOT NULL,
		len                           		NUMBER(4)		 NULL ,
		summary                       		CLOB		 NOT NULL,
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

ALTER TABLE film RENAME COLUMN directorno TO dirno;

DESC film;

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
COMMENT ON COLUMN film.thumb is '�����';
COMMENT ON COLUMN film.filmseq is '���';
COMMENT ON COLUMN film.hit is '��ȸ��';
COMMENT ON COLUMN film.dirno is '���� ��ȣ';

-- ALTER TABLE film ADD (postersize NUMBER(10));
ALTER TABLE film ADD (titlekr VARCHAR2(100));
ALTER TABLE film RENAME COLUMN title TO titleen;
ALTER TABLE film RENAME COLUMN Youtube TO youtube;
-- ALTER TABLE film RENAME COLUMN thumb TO posterthumb;

-- ALTER TABLE film MODIFY  postersize DEFAULT 0		 NOT NULL;
ALTER TABLE film MODIFY  postersize VARCHAR2(200);
-- DESC film;

DROP SEQUENCE film_seq;

CREATE SEQUENCE film_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  --------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO film(filmno, titleen, titlekr, lan, year, len, summary, restrict, dirno)
VALUES (film_seq.nextval, 'Zodiac', '�����', 'EN', 2007, 157, 'Zodiac Killer', 15, 1);

INSERT INTO film(filmno, titleen, titlekr, lan, year, len, summary, restrict, dirno)
VALUES (film_seq.nextval, 'The Curious Case of Benjamin Button', '���ڹ� ��ư�� �ð��� �Ųٷ� ����', 'EN', 2008, 168, 'Benjamin Button', 12, 1);

INSERT INTO film(filmno, titleen, titlekr, lan, year, len, summary, restrict, dirno)
VALUES (film_seq.nextval, 'Zero Dark Thirty', '���� ��ũ ��Ƽ', 'EN', 2012, 157, 'Osama bin Laden' ,18, 3);

INSERT INTO film(filmno, titleen, titlekr, lan, year, len, summary, restrict, dirno)
VALUES (film_seq.nextval, 'Iron Man', '���̾��', 'EN', 2008, 157, 
            'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.' ,15, 27);

INSERT INTO film(filmno, titleen, titlekr, lan, year, len, summary, restrict, dirno)
VALUES (film_seq.nextval, 'Iron Man3', '���̾��3', 'EN', 2013, 130, 
            'Tony Stark must' ,12, 27);

INSERT INTO film(filmno, titleen, titlekr, lan, year, len, summary, restrict, dirno)
VALUES (film_seq.nextval, 'Iron Man3', '���̾��3', 'EN', 2013, 124, 
            'Tony Stark must' ,12, 27);

COMMIT;



-- ��LIST��

SELECT filmno, titleen, titlekr, lan, year, len, restrict, dirno, postersize, poster, posterthumb
FROM film
ORDER BY filmno;


-- �� ���� �������� �ֽż� 6�� ���ڵ� ���
SELECT filmno, titlekr, poster
FROM film
WHERE ROWNUM <= 6
ORDER BY filmno DESC;


-- ��LIST (BY FILMNO)��

SELECT filmno, titleen, titlekr, lan, year, len, restrict, dirno, postersize, poster, posterthumb
FROM film
--WHERE filmno = 8
--ORDER BY photono ASC, filmno DESC;


-- ��READ��

SELECT filmno, titlekr, titleen, lan, year, len, summary, restrict, dirno, youtube, url, 
            poster, posterthumb, postersize,
            filmseq, hit, dirno
FROM film
WHERE filmno = 8;


SELECT url
FROM film
WHERE filmno = 8;



-- ��UPDATE��

UPDATE film
SET youtube = 
'<iframe width="560" height="315" src="https://www.youtube.com/embed/6ZOZwUQKu3E"
frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
allowfullscreen></iframe>'
WHERE filmno = 8;

UPDATE film
SET postersize = 0, poster = null, posterthumb = null
WHERE filmno = 2;

UPDATE film
SET url = 'http://'
WHERE filmno = 8;


-- ��DELETE��

DELETE 
FROM film
WHERE filmno=3;  





SELECT filmno, titleen, titlekr, lan, year, len, restrict, dirno, postersize, poster, posterthumb
FROM film
ORDER BY filmno;


SELECT languageno, filmno, en, ch, es, fr, ar, rs, pt, de, jp, hi, kr
FROM language
ORDER BY filmno;









-- �� Paging + Searching ��
-- Film + Language + Quality + Genre + Filmgenre  Join
-- filter by genreno / quality / language 
          
     
-- ���
SELECT filmno
FROM ( 
          SELECT filmno,  rownum as r
          FROM (
                      SELECT DISTINCT f.filmno                         
                      FROM film f, quality q, language l, genre g, filmgenre x            
                      WHERE f.filmno = q.filmno AND f.filmno = l.filmno AND f.filmno = x.filmno AND g.genreno = x.genreno 
                      ORDER BY filmno DESC
                    )          
         )
WHERE r >= 1 AND r <= 10;
         


-- ����

SELECT  COUNT(filmno) as cnt
FROM (
              SELECT DISTINCT f.filmno
              FROM film f, quality q, language l, genre g, filmgenre x            
              WHERE f.filmno = q.filmno AND f.filmno = l.filmno AND f.filmno = x.filmno AND g.genreno = x.genreno
              ORDER BY filmno DESC
            );

            
-- filmno ���

SELECT DISTINCT f.filmno
FROM film f, quality q, language l, genre g, filmgenre x            
WHERE f.filmno = q.filmno AND f.filmno = l.filmno AND f.filmno = x.filmno AND g.genreno = x.genreno
ORDER BY filmno DESC;


SELECT filmno, r
FROM ( 
          SELECT filmno, titlekr, titleen, poster, restrict, rownum as r
          FROM (
                      SELECT DISTINCT filmno, titlekr, titleen, poster, restrict
                      FROM (
                                  SELECT f.filmno, f.titleen, f.titlekr, f.lan, f.year, f.poster, f.restrict                                            
                                  FROM film f, quality q, language l, genre g, filmgenre x            
                                  WHERE f.filmno = q.filmno AND f.filmno = l.filmno AND f.filmno = x.filmno AND g.genreno = x.genreno 
                               )
                      ORDER BY filmno DESC
                    )          
         )
WHERE r >= 1 AND r <= 10;















    