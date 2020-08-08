/**********************************/
/* Table Name: ��ȭ �帣 */
/**********************************/
DROP TABLE fgenre CASCADE CONSTRAINTS;

CREATE TABLE fgenre(
        fgenreno                            NUMBER(38)       NOT NULL        PRIMARY KEY,
        genreno                             NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (genreno) REFERENCES genre (genreno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);


COMMENT ON TABLE fgenre is '��ȭ �帣';
COMMENT ON COLUMN fgenre.fgenreno is '��ȭ �帣 ��ȣ';
COMMENT ON COLUMN fgenre.genreno is '�帣 ��ȣ';
COMMENT ON COLUMN fgenre.filmno is '��ȭ ��ȣ';


DROP SEQUENCE fgenre_seq;

CREATE SEQUENCE fgenre_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


--------------------------------------------------------------------------------------------


-- ��CREATE��

INSERT INTO fgenre(fgenreno, genreno, filmno)
VALUES (fgenre_seq.nextval, 1, 1);

INSERT INTO fgenre(fgenreno, genreno, filmno)
VALUES (fgenre_seq.nextval, 2, 1);

INSERT INTO fgenre(fgenreno, genreno, filmno)
VALUES (fgenre_seq.nextval, 3, 1);


-- ��LIST��

SELECT fgenreno, genreno, filmno
FROM fgenre
  ORDER BY filmno DESC, fgenreno ASC;


-- ��READ��

SELECT fgenreno, genreno, filmno
FROM fgenre
WHERE fgenreno = 1;


-- ��UPDATE��

UPDATE fgenre
SET genreno = 4
WHERE fgenreno = 3;



-- ��DELETE��

DELETE 
FROM fgenre
WHERE fgenreno=3;  




