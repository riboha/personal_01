/**********************************/
/* Table Name: �⿬�� */
/**********************************/

DROP TABLE cast CASCADE CONSTRAINTS;

CREATE TABLE cast(
        castno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
        actorno                             NUMBER(10)       NOT NULL,
        role                                VARCHAR2(60)         NOT NULL,
        filmno                              NUMBER(10)       NULL ,
  FOREIGN KEY (actorno) REFERENCES actor (actorno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cast is '�⿬��';
COMMENT ON COLUMN cast.castno is '�⿬�� ��ȣ';
COMMENT ON COLUMN cast.actorno is '��� ��ȣ';
COMMENT ON COLUMN cast.role is '����';
COMMENT ON COLUMN cast.filmno is '��ȭ ��ȣ';

DESC cast;


DROP SEQUENCE cast_seq;

CREATE SEQUENCE cast_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO cast(castno, actorno, role, filmno)
VALUES (cast_seq.nextval, 1, 'Yerin', 8);

INSERT INTO cast(castno, actorno, role, filmno)
VALUES (cast_seq.nextval, 1, 'Peter', 6);

INSERT INTO cast(castno, actorno, role, filmno)
VALUES (cast_seq.nextval, 1, 'Tony',7);

INSERT INTO cast(castno, actorno, role, filmno)
VALUES (cast_seq.nextval, 8, 'Emily',8);

INSERT INTO cast(castno, actorno, role, filmno)
VALUES (cast_seq.nextval, 9, 'Andy Sachs',8);

INSERT INTO cast(castno, actorno, role, filmno)
VALUES (cast_seq.nextval, 10, 'Miranda Priestly',8);


COMMIT;

-- ��LIST��

SELECT castno, actorno, role, filmno
FROM cast
WHERE filmno = 8
ORDER BY castno;

SELECT castno, actorno, role, filmno
FROM cast
WHERE actorno = 1
ORDER BY castno;

-- ��READ��

SELECT castno, actorno, role, filmno
FROM cast
WHERE castno = 1;


-- ��UPDATE��

UPDATE cast
SET role = 2
WHERE castno = 1;


-- ��DELETE��

DELETE 
FROM cast
WHERE castno=1;  


-- ��캰 �⿬ ���

SELECT a.actorno, a.actornameen, a.actornamekr,
           f.filmno, f.titleen, f.titlekr,
           c.castno, c.actorno as c_actorno, c.role, c.filmno as c_filmno
FROM actor a, film f, cast c
WHERE c.filmno = f.filmno AND c.actorno = a.actorno AND a.actorno = 2
ORDER BY c.castno DESC;



-- ��ȭ�� �⿬�� ���

SELECT a.actorno, a.actornameen, a.actornamekr,
           f.filmno, f.titleen, f.titlekr,
           c.castno, c.actorno as c_actorno, c.role, c.filmno as c_filmno
FROM actor a, film f, cast c
WHERE f.filmno = c.filmno AND c.actorno = a.actorno AND f.filmno = 8
ORDER BY c.castno DESC;






