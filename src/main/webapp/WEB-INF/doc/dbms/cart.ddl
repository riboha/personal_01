/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/

DROP TABLE cart CASCADE CONSTRAINTS;

CREATE TABLE cart(
        cartno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
        optionlan                           VARCHAR2(10)         NOT NULL,
        optionqual                          VARCHAR2(10)         NOT NULL,
        optionprice                         NUMBER(10)       NOT NULL,
        optionrent                          VARCHAR2(10)         NOT NULL,
        memberno                            NUMBER(10)       NOT NULL ,
        filmno                              NUMBER(10)       NOT NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cart is '��ٱ���';
COMMENT ON COLUMN cart.cartno is '��ٱ��� ��ȣ';
COMMENT ON COLUMN cart.optionlan is '�ɼ� ���';
COMMENT ON COLUMN cart.optionqual is '�ɼ� ȭ��';
COMMENT ON COLUMN cart.optionprice is '�ɼ� ����';
COMMENT ON COLUMN cart.optionrent is '�ɼ� �뿩';
COMMENT ON COLUMN cart.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN cart.filmno is '��ȭ ��ȣ';



DESC cart;


DROP SEQUENCE cart_seq;

CREATE SEQUENCE cart_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO cart(cartno, optionlan, optionqual, optionrent, optionprice, memberno, filmno)
VALUES (cart_seq.nextval, 'EN', '720p', '30', 1000, 1, 24);

INSERT INTO cart(cartno, optionlan, optionqual, optionprice, memberno, filmno)
VALUES (cart_seq.nextval, 'FR', '1024p', '7', 1, 28);


COMMIT;

-- ��LIST��


SELECT cartno, optionlan, optionqual, optionrent, optionprice, memberno, filmno
FROM cart
WHERE memberno = 1
ORDER BY cartno DESC;



-- ��UPDATE��

UPDATE cart
SET optionlan = 'KR', optionqual='3', optionprice=3000, optionrent='7��'
WHERE cartno = 1;


-- ��DELETE��

DELETE 
FROM cart;
WHERE cartno=1;  




-- Film, Cart Join

SELECT f.titlekr, f.titleen, c.optionlan, c.optionqual, c.optionprice, c.filmno
FROM film f, cart c
WHERE f.filmno = c.filmno AND c.memberno = 1
ORDER BY c.cartno DESC;


SELECT f.titlekr, f.titleen, c.optionlan, c.optionqual, c.optionprice, f.filmno, p.day1, p.day3, p.day7, p.day30, p.dayperm
FROM film f, cart c, price p
WHERE f.filmno = c.filmno AND f.filmno = p.filmno AND c.memberno = 1
ORDER BY c.cartno DESC;


SELECT priceno, day1, day3, day7, day30, dayperm, filmno
FROM price
ORDER BY priceno;



-- cart ����

SELECT COUNT(cartno) as cnt
FROM cart
WHERE memberno=1;


-- �ߺ� Ȯ��

  SELECT COUNT(cartno) as cnt
  FROM cart
  WHERE memberno=1 AND filmno = 28;
















