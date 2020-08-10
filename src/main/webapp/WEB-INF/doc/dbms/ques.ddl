
/**********************************/
/* Table Name: 문의사항 */
/**********************************/

DROP TABLE ques CASCADE CONSTRAINTS;


CREATE TABLE ques(
        quesno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
        questitle                           VARCHAR2(1000)       NOT NULL,
        quescontent                         CLOB         NOT NULL,
        quesdate                            DATE         NOT NULL,
        qcateno                             NUMBER(10)        NOT NULL,
        memberno                            NUMBER(10)       NOT NULL,
        payno                               NUMBER(10)       NULL ,
        filmno                              NUMBER(10)       NULL
  -- FOREIGN KEY (quesno) REFERENCES ques (quesno),
  -- FOREIGN KEY (memberno) REFERENCES member (memberno),
  -- FOREIGN KEY (payno) REFERENCES pay (payno),
  -- FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE ques is '문의사항';
COMMENT ON COLUMN ques.quesno is '문의 번호';
COMMENT ON COLUMN ques.questitle is '문의 제목';
COMMENT ON COLUMN ques.quescontent is '문의 내용';
COMMENT ON COLUMN ques.quesdate is '문의 날짜';
COMMENT ON COLUMN ques.quesno is '문의 카테 번호';
COMMENT ON COLUMN ques.memberno is '회원 번호';
COMMENT ON COLUMN ques.payno is '결제 세부 번호';
COMMENT ON COLUMN ques.filmno is '영화 번호';


DROP SEQUENCE ques_seq;

CREATE SEQUENCE ques_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO ques (quesno, questitle, `, quesdate, qcateno, memberno, payno, filmno )
VALUES (ques_seq.nextval, '도와주세요', '이상해요', sysdate, 1, 1, 1, 1);

COMMIT;



-- ♣LIST♣

SELECT quesno, questitle, quescontent, quesdate, qcateno, memberno, payno, filmno
FROM ques
ORDER BY quesno DESC;



-- ♣UPDATE♣

UPDATE ques
SET questitle = '결제 했는데', quescontent='오ㅐ 재생이 안되나요', qcateno=6
WHERE quesno = 1;



-- ♣DELETE♣

DELETE 
FROM ques
WHERE quesno=3;  


