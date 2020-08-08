
/**********************************/
/* Table Name: 수상 */
/**********************************/
DROP TABLE award CASCADE CONSTRAINTS;

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

DESC award;


DROP SEQUENCE award_seq;

CREATE SEQUENCE award_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO award(awardno, awardname, prize, year, filmno)
VALUES (award_seq.nextval, 'Dublin Film Critics Circle', 'Best Director', 2007, 2);


INSERT INTO award(awardno, awardname, prize, year, filmno)
VALUES (award_seq.nextval, 'Dublin Film Critics Circle', 'Best Director', 2007, 3);



INSERT INTO award(awardno, awardname, prize, year, filmno)
VALUES (award_seq.nextval, 'Dublin Film Critics Circle', 'Best Director', 2007, 8);


COMMIT;

-- ♣LIST♣

SELECT awardno, awardname, prize, year, awardseq, filmno
FROM award
ORDER BY awardno;




-- ♣READ♣

SELECT awardno, awardname, prize, year, filmno
FROM award
WHERE awardno = 1;


-- ♣UPDATE♣

UPDATE award
SET awardname = 'Dublic Film Critics Circle', prize='Best Director', year=2007, awardseq=2
WHERE awardno = 1;


-- ♣DELETE♣

DELETE 
FROM award
WHERE awardno=1;  































