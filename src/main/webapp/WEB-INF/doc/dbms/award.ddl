
/**********************************/
/* Table Name: ���� */
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

COMMENT ON TABLE award is '����';
COMMENT ON COLUMN award.awardno is '�����ȣ';
COMMENT ON COLUMN award.awardname is '�û�ĸ�';
COMMENT ON COLUMN award.prize is '�ι�';
COMMENT ON COLUMN award.year is '�⵵';
COMMENT ON COLUMN award.awardseq is '���� ��¼���';
COMMENT ON COLUMN award.filmno is '��ȭ ��ȣ';

DESC award;


DROP SEQUENCE award_seq;

CREATE SEQUENCE award_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO award(awardno, awardname, prize, year, filmno)
VALUES (award_seq.nextval, 'Dublin Film Critics Circle', 'Best Director', 2007, 2);


INSERT INTO award(awardno, awardname, prize, year, filmno)
VALUES (award_seq.nextval, 'Dublin Film Critics Circle', 'Best Director', 2007, 3);



INSERT INTO award(awardno, awardname, prize, year, filmno)
VALUES (award_seq.nextval, 'Dublin Film Critics Circle', 'Best Director', 2007, 8);


COMMIT;

-- ��LIST��

SELECT awardno, awardname, prize, year, awardseq, filmno
FROM award
ORDER BY awardno;




-- ��READ��

SELECT awardno, awardname, prize, year, filmno
FROM award
WHERE awardno = 1;


-- ��UPDATE��

UPDATE award
SET awardname = 'Dublic Film Critics Circle', prize='Best Director', year=2007, awardseq=2
WHERE awardno = 1;


-- ��DELETE��

DELETE 
FROM award
WHERE awardno=1;  































