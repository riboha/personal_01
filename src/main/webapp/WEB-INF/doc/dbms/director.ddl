
/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE director CASCADE CONSTRAINTS;

CREATE TABLE director(
        dirno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
        dirnamekr                           VARCHAR2(200)        NOT NULL   UNIQUE,
        dirnameen                           VARCHAR2(200)        NOT NULL   UNIQUE,
        dirnation                           VARCHAR2(100)        NOT NULL,
        dirphoto                            VARCHAR2(300)        NULL ,
        dirthumb                            VARCHAR2(300)        NULL ,
        dirphotosize                        NUMBER(10)       NULL 
);

COMMENT ON TABLE director is '����';
COMMENT ON COLUMN director.dirno is '���� ��ȣ';
COMMENT ON COLUMN director.dirnamekr is '���� �ѱ� �̸�';
COMMENT ON COLUMN director.dirnameen is '���� ���� �̸�';
COMMENT ON COLUMN director.dirnation is '���� ����';
COMMENT ON COLUMN director.dirphoto is '���� ����';
COMMENT ON COLUMN director.dirthumb is '���� ���� �����';
COMMENT ON COLUMN director.dirphotosize is '���� ���� ũ��';



-- ALTER TABLE film ADD (postersize NUMBER(10));
-- ALTER TABLE film RENAME COLUMN thumb TO posterthumb;

-- ALTER TABLE director RENAME COLUMN directorno TO dirno;
-- ALTER TABLE director RENAME COLUMN directorname TO dirnamekr;
-- ALTER TABLE director RENAME COLUMN directornation TO dirnation;

-- ALTER TABLE director ADD (dirnameen VARCHAR(200));

-- ALTER TABLE director ADD (dirphoto VARCHAR(300));
-- ALTER TABLE director ADD (dirthumb VARCHAR(300));
-- ALTER TABLE director ADD (dirphotosize VARCHAR(300));

-- ALTER TABLE director ADD  UNIQUE (dirnamekr);
-- ALTER TABLE director ADD  UNIQUE (dirnameen);

-- ALTER TABLE  director DROP  UNIQUE (dirnamekr, dirnameen);
-- ALTER TABLE  director DROP  UNIQUE (dirnameen);
-- ALTER TABLE  director DROP  UNIQUE (dirnamekr);

DESC director;

DROP SEQUENCE director_seq;

CREATE SEQUENCE director_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  --------------------------------------------------------------------------------------------
  
  
-- ��CREATE��



INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation)
VALUES (director_seq.nextval, '���̺�� ��ó', 'David Fincher', 'USA');

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
VALUES (director_seq.nextval, '��ƾ Ÿ��Ƽ��', 'Quentin Tarantino', 'USA', null, null, null);


INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
VALUES (director_seq.nextval, 'ũ�������� ���', 'Christopher Edward Nolan', 'England', null, null, null);




INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
VALUES (director_seq.nextval, '���� �з�', 'George Miller', 'Australia', null, null, null);

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
  VALUES (director_seq.nextval, '�Ӽ���', 'Yim Soon-rye', 'South Korea', null, 0, null);
  
  INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
  VALUES (director_seq.nextval, '�� �к��', 'John Favreau', 'USA', null, 0, null);

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
  VALUES (director_seq.nextval, 'a', 'a', 'a', null, 0, null);

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation)
VALUES (director_seq.nextval, 'Kathryn Bigelow', 'USA');

COMMIT;


-- ��LIST��

SELECT dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb
FROM director
ORDER BY dirno;


SELECT * FROM director;


-- ��UPDATE��

UPDATE director
SET dirnamekr='���̺�� ��ó', dirnameen='David Fincher', dirnation='USA'
WHERE dirno = 1;

UPDATE director
SET dirnamekr='ũ�������� ���', dirnameen='Christopher Nolan', dirnation='England'
WHERE dirno = 2;

UPDATE director
SET dirnamekr='ĳ���� ��۷ο�', dirnameen='Kathryn Bigelow', dirnation='USA'
WHERE dirno = 3;



-- ��DELETE��

DELETE 
FROM director
WHERE dirno=3;  


ROLLBACK;


COMMIT;



-- ��SELECT: AUTOCOMPLETE �ڵ��ϼ� �˻� ��ɢ�

-- Preset: Case insensitive �� NOT WORKING! DONT KNOW WHY
-- ALTER SESSION SET NLS_COMP=LINGUISTIC;

-- �� LIKE Ű���� + UPPER 

SELECT dirnamekr, dirnameen, dirno
FROM director
WHERE upper(dirnameen) like upper('%W%') OR  dirnamekr like '%W%';


