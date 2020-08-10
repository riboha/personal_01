
/**********************************/
/* Table Name: ���ǻ��� */
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

COMMENT ON TABLE ques is '���ǻ���';
COMMENT ON COLUMN ques.quesno is '���� ��ȣ';
COMMENT ON COLUMN ques.questitle is '���� ����';
COMMENT ON COLUMN ques.quescontent is '���� ����';
COMMENT ON COLUMN ques.quesdate is '���� ��¥';
COMMENT ON COLUMN ques.quesno is '���� ī�� ��ȣ';
COMMENT ON COLUMN ques.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN ques.payno is '���� ���� ��ȣ';
COMMENT ON COLUMN ques.filmno is '��ȭ ��ȣ';


DROP SEQUENCE ques_seq;

CREATE SEQUENCE ques_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO ques (quesno, questitle, `, quesdate, qcateno, memberno, payno, filmno )
VALUES (ques_seq.nextval, '�����ּ���', '�̻��ؿ�', sysdate, 1, 1, 1, 1);

COMMIT;



-- ��LIST��

SELECT quesno, questitle, quescontent, quesdate, qcateno, memberno, payno, filmno
FROM ques
ORDER BY quesno DESC;



-- ��UPDATE��

UPDATE ques
SET questitle = '���� �ߴµ�', quescontent='���� ����� �ȵǳ���', qcateno=6
WHERE quesno = 1;



-- ��DELETE��

DELETE 
FROM ques
WHERE quesno=3;  


