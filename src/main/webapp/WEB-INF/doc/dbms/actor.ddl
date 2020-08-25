/**********************************/
/* Table Name: ��� */
/**********************************/
DROP TABLE actor CASCADE CONSTRAINTS;

CREATE TABLE actor(
        actorno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        actornameen                         VARCHAR2(100)        NOT NULL       UNIQUE,
        actornamekr                         VARCHAR2(100)        NOT NULL       UNIQUE,
        birth                               DATE         NOT NULL,
        nation                              VARCHAR2(100)        NOT NULL,
        actorpic                            VARCHAR2(100)        NULL ,
        actorthumb                          VARCHAR2(100)        NULL ,
        actorpicsize                        NUMBER(10)       DEFAULT 0       NOT NULL,
        actorhit                            NUMBER(10)       DEFAULT 0       NOT NULL
);

COMMENT ON TABLE actor is '���';
COMMENT ON COLUMN actor.actorno is '��� ��ȣ';
COMMENT ON COLUMN actor.actornameen is '���� �̸�';
COMMENT ON COLUMN actor.actornamekr is '�ѱ� �̸�';
COMMENT ON COLUMN actor.birth is '�������';
COMMENT ON COLUMN actor.nation is '����';
COMMENT ON COLUMN actor.actorpic is '������';
COMMENT ON COLUMN actor.actorthumb is '������ �����';
COMMENT ON COLUMN actor.actorpicsize is '������ ũ��';
COMMENT ON COLUMN actor.actorhit is '���ƿ��';


DESC actor;

ALTER TABLE actor ADD  UNIQUE (actornamekr);
ALTER TABLE actor ADD  UNIQUE (actornameen);


DROP SEQUENCE actor_seq;

CREATE SEQUENCE actor_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Zooey Deschanel', '���� �����', '1980-01-17', 'USA', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Chris Hemsworth', 'ũ���� �ܽ�����', '1983-08-11', 'Australia', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Sarah Shahi', '��� ����', '1980-01-10', 'USA', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Emily Blunt', '���и� ��Ʈ', '1983-02-23', 'England', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Anne Hathaway', '�� �ؼ�����', '1982-11-12', 'USA', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Meryl Streep', '�޸� ��Ʈ��', '1949-06-22', 'USA', null, null, 0);

COMMIT;

-- ��LIST��

SELECT actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize
FROM actor
ORDER BY actorno;


-- ��READ��

SELECT actorno, actornameen, actornamekr, birth, nation, actorpic, actorthumb, actorpicsize
FROM actor
WHERE actorno = 4;


-- ��UPDATE��

UPDATE actor
SET actornameen = 'Maya Hawke', actornamekr='���� ȣũ', birth='1998-07-08', nation='USA', 
        actorpic=null, actorthumb=null, actorpicsize=0
WHERE actorno = 1;

UPDATE actor 
SET actorpic = null, actorthumb = null, actorpicsize = 0
WHERE actorno= 1;



-- ��DELETE��

DELETE 
FROM actor;  


DELETE 
FROM actor
WHERE actorno=1;  


-- �˻� ��� (�̸�)

SELECT DISTINCT actornameen, actornamekr, actorno
FROM actor
WHERE upper(dirnameen) like upper('%y%') OR  dirnamekr like '%y%';
        AND ROWID IN (SELECT MAX(ROWID) FROM actor GROUP BY actorno)


-- '��� �̸�' �迭�� ���� '��� ��ȣ' �迭 ��ȯ
SELECT actorno
FROM actor
WHERE actornameen = 'Chris Hemsworth';



-- �� Paging + Searching ��

-- �˻� ����: ActorVO actornameen, actornamekr, nation
                    -- Cast role, 
                    -- Film titleen, titlekr

-- actorno ���         

SELECT actorno
FROM (
            SELECT actorno,  rownum as r
            FROM (            
                        SELECT DISTINCT  a.actorno
                        FROM actor a, film f, cast c
                        --WHERE UPPER(a.actornameen) LIKE UPPER('%tom%') OR a.actornamekr LIKE '%tom%' OR a.nation LIKE '%tom%' 
                        --            OR c.role LIKE '%tom%' 
                        --            OR f.titleen LIKE '%tom%' OR f.titlekr LIKE '%tom%' 
                        ORDER BY actorno
                      )
          )
WHERE r >= 1 AND r <= 12;         

                      

-- actorno ����

SELECT  COUNT (actorno) as cnt
FROM (
            SELECT DISTINCT  a.actorno
            FROM actor a, film f, cast c
            WHERE UPPER(a.actornameen) LIKE UPPER('%tom%') OR a.actornamekr LIKE '%tom%' OR a.nation LIKE '%tom%' 
                        OR c.role LIKE '%tom%' 
                        OR f.titleen LIKE '%tom%' OR f.titlekr LIKE '%tom%' 
          );


-- �˻� ����
SELECT actorno,  actornamekr, r
FROM (
          SELECT actorno,  actornamekr, rownum as r
          FROM (            
                      SELECT DISTINCT  a.actorno, a.actornamekr
                      FROM actor a, film f, cast c
                      WHERE f.filmno = c.filmno AND a.actorno = c.actorno
                      
                      -- ��� ���� �̸� / �ѱ� �̸� / ���� �˻�
                      AND (UPPER(a.actornameen) LIKE UPPER('%ro%') OR a.actornamekr LIKE '%ro%' OR UPPER(a.nation) LIKE UPPER('%ro%'))
                      
                      -- ���� �˻�
                      -- AND (UPPER (c.role) LIKE UPPER ('%���%'))
                      
                      -- ��ȭ �ѱ� ���� / ���� ���� �˻�
                      -- AND (UPPER(f.titleen) LIKE UPPER('%���%') OR f.titlekr LIKE '%���%' )
                 
                      ORDER BY actorno
                    )
        )


SELECT  COUNT (actorno) as cnt
FROM (
SELECT DISTINCT  a.actorno
FROM actor a, film f, cast c
WHERE f.filmno = c.filmno AND a.actorno = c.actorno
AND UPPER (a.actornameen) LIKE UPPER ( '%' || 'ro' || '%') 
OR a.actornamekr LIKE  '%' || 'ro' || '%'
OR a.nation LIKE  '%' || 'ro' || '%'
OR c.role LIKE '%' || 'ro' || '%'
OR UPPER (f.titleen) LIKE UPPER ( '%' || 'ro' || '%') 
OR f.titlekr LIKE  '%' || 'ro' || '%'

            )










