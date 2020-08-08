
/**********************************/
/* Table Name: 키워드 */
/**********************************/
DROP TABLE keyword CASCADE CONSTRAINTS;

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



DROP SEQUENCE keyword_seq;

CREATE SEQUENCE keyword_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
 
 --------------------------------------------------------------------------------------------


-- ♣CREATE♣

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '몰입감', 1);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '명작', 1);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '실화', 1);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '몰입감', 2);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '명작', 2);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '실화', 2);


COMMIT;



-- ♣LIST♣

SELECT keywordno, keyword, filmno, keywordseq
FROM keyword
ORDER BY keywordseq ASC, keywordno DESC;


-- ♣UPDATE♣

UPDATE keyword
SET keyword = '공포', keywordseq=2
WHERE keywordno = 2;


-- ♣DELETE♣

DELETE 
FROM keyword 
WHERE keywordno=3;  

























