
/**********************************/
/* Table Name: Ű���� */
/**********************************/
DROP TABLE keyword CASCADE CONSTRAINTS;

CREATE TABLE keyword(
		keywordno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		keyword                       		VARCHAR2(60)		 NOT NULL,
		keywordseq                    		NUMBER(30)		 DEFAULT 1		 NOT NULL,
		filmno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE keyword is 'Ű����';
COMMENT ON COLUMN keyword.keywordno is 'Ű���� ��ȣ';
COMMENT ON COLUMN keyword.keyword is 'Ű���� ����';
COMMENT ON COLUMN keyword.keywordseq is 'Ű���� ��¼���';
COMMENT ON COLUMN keyword.filmno is '��ȭ ��ȣ';



DROP SEQUENCE keyword_seq;

CREATE SEQUENCE keyword_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
 
 --------------------------------------------------------------------------------------------


-- ��CREATE��

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '���԰�', 1);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '����', 1);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '��ȭ', 1);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '���԰�', 2);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '����', 2);

INSERT INTO keyword( keywordno, keyword, filmno)
VALUES (keyword_seq.nextval, '��ȭ', 2);


COMMIT;



-- ��LIST��

SELECT keywordno, keyword, filmno, keywordseq
FROM keyword
ORDER BY keywordseq ASC, keywordno DESC;


-- ��UPDATE��

UPDATE keyword
SET keyword = '����', keywordseq=2
WHERE keywordno = 2;


-- ��DELETE��

DELETE 
FROM keyword 
WHERE keywordno=3;  

























