/**********************************/
/* Table Name: ��� */
/**********************************/
DROP TABLE actor CASCADE CONSTRAINTS;

CREATE TABLE actor(
        actorno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        actornameen                         VARCHAR2(100)        NOT NULL,
        actornamekr                         VARCHAR2(100)        NOT NULL,
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
FROM actor
WHERE actorno=1;  































