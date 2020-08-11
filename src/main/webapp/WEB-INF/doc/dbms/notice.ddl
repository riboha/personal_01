/**********************************/
/* Table Name: 공지 */
/**********************************/

DROP TABLE notice CASCADE CONSTRAINTS;

CREATE TABLE notice(
        noticeno                            NUMBER(10)       NOT NULL        PRIMARY KEY,
        noticetitle                         VARCHAR2(200)       NOT NULL,
        noticecontent                       CLOB         NOT NULL,
		noticedate                    		DATE		 NOT NULL,
        noticeshow                          NUMBER(1)        DEFAULT 1       NOT NULL,
        noticeseq                           NUMBER(10)       DEFAULT 1       NOT NULL,
        adminno                             NUMBER(10)       NOT NULL,
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


DROP SEQUENCE notice_seq;

CREATE SEQUENCE notice_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  --------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO notice(noticeno, noticetitle, noticecontent, noticedate, noticeshow, noticeseq, adminno)
VALUES (notice_seq.nextval, '자막 관련 공지', '자막 추가 안내', sysdate, 1, 1, 1);

COMMIT;


-- ♣LIST♣

SELECT noticeno, noticetitle, noticecontent, noticedate, noticeshow, noticeseq, adminno
FROM notice
ORDER BY noticeno;



-- ♣UPDATE♣

UPDATE notice
SET noticetitle = '더빙 언어 추가 안내', noticecontent = '영어 추가', noticeshow = 1, noticeseq = 5
WHERE noticeno = 1;



-- ♣DELETE♣

DELETE 
FROM notice;
WHERE noticeno=3;  



  

