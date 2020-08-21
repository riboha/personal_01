/**********************************/
/* Table Name: �뿩�� ���� */
/**********************************/

DROP TABLE rentprice CASCADE CONSTRAINTS;

CREATE TABLE rentprice(
        rentpriceno                         NUMBER(10)       NOT NULL        PRIMARY KEY,
        day1                                NUMBER(10)       DEFAULT 0       NOT NULL,
        day3                                NUMBER(10)       DEFAULT 0       NOT NULL,
        day7                                NUMBER(10)       DEFAULT 0       NOT NULL,
        day30                               NUMBER(10)       DEFAULT 0       NOT NULL,
        dayperm                             NUMBER(10)       DEFAULT 0       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE rentprice is '�뿩�� ����';
COMMENT ON COLUMN rentprice.rentpriceno is '�뿩�� ���� ��ȣ';
COMMENT ON COLUMN rentprice.day1 is '1��';
COMMENT ON COLUMN rentprice.day3 is '3��';
COMMENT ON COLUMN rentprice.day7 is '7��';
COMMENT ON COLUMN rentprice.day30 is '30��';
COMMENT ON COLUMN rentprice.dayperm is '��������';
COMMENT ON COLUMN rentprice.filmno is '��ȭ ��ȣ';



--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (1, 1000, 3000, 7000, 10000, 15000, 1);
             
INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (2, 1000, 3000, 7000, 10000, 15000, 2);
            
INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (3, 1000, 3000, 7000, 10000, 15000, 3);
INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (5, 1000, 3000, 7000, 10000, 15000, 5);

INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (24, 1000, 3000, 7000, 10000, 15000, 24);

INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (25, 1000, 3000, 7000, 10000, 15000, 25);         

INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (26, 1000, 3000, 7000, 10000, 15000, 26);            

INSERT INTO rentprice (rentpriceno, day1, day3, day7, day30, dayperm, filmno)
VALUES (27, 1000, 3000, 7000, 10000, 15000, 27);         
COMMIT;


-- ��LIST by fimno��

SELECT rentpriceno, day1, day3, day7, day30, dayperm, filmno
FROM price
ORDER BY rentpriceno;


-- ��READ��

SELECT rentpriceno, day1, day3, day7, day30, dayperm, filmno
FROM price
WHERE rentpriceno = 24;


-- ��UPDATE��

UPDATE price
SET day1 = 1000, day3 = 2000, day7 = 4000, day30 = 7000, dayperm = 10000
WHERE rentpriceno = 1;


-- ��DELETE��

DELETE 
FROM price
WHERE rentpriceno=1;  


