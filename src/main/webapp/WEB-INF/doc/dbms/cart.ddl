/**********************************/
/* Table Name: 장바구니 */
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

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니 번호';
COMMENT ON COLUMN cart.optionlan is '옵션 언어';
COMMENT ON COLUMN cart.optionqual is '옵션 화질';
COMMENT ON COLUMN cart.optionprice is '옵션 가격';
COMMENT ON COLUMN cart.optionrent is '옵션 대여';
COMMENT ON COLUMN cart.memberno is '회원 번호';
COMMENT ON COLUMN cart.filmno is '영화 번호';



DESC cart;


DROP SEQUENCE cart_seq;

CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO cart(cartno, optionlan, optionqual, optionrent, optionprice, memberno, filmno)
VALUES (cart_seq.nextval, 'EN', '720p', '30', 1000, 1, 24);

INSERT INTO cart(cartno, optionlan, optionqual, optionprice, memberno, filmno)
VALUES (cart_seq.nextval, 'FR', '1024p', '7', 1, 28);


COMMIT;

-- ♣LIST♣


SELECT cartno, optionlan, optionqual, optionrent, optionprice, memberno, filmno
FROM cart
WHERE memberno = 1
ORDER BY cartno DESC;



-- ♣UPDATE♣

UPDATE cart
SET optionlan = 'KR', optionqual='3', optionprice=3000, optionrent='7일'
WHERE cartno = 1;


-- ♣DELETE♣

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



-- cart 갯수

SELECT COUNT(cartno) as cnt
FROM cart
WHERE memberno=1;


-- 중복 확인

  SELECT COUNT(cartno) as cnt
  FROM cart
  WHERE memberno=1 AND filmno = 28;
















