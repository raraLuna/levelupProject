ALTER TABLE PAYMENT
ADD CHAR_NAME VARCHAR2(30);

ALTER TABLE PAYMENT
ADD PAYMENT_KEY VARCHAR2(50);

ALTER TABLE PAYMENT
MODIFY PAYMENT_DATE DEFAULT SYSDATE;

ALTER TABLE PAYMENT
MODIFY PAYMENT_STATUS VARCHAR2(50 BYTE);

alter table payment add UNIQUE_ID number not null;

alter table payment add EMAIL_STATUS VARCHAR2(1 BYTE) default 'N' not null;

comment on column payment.CHAR_NAME is '캐릭터이름';

comment on column payment.PAYMENT_KEY is '페이먼트키';

comment on column payment.UNIQUE_ID is '아이템고유번호';

comment on column payment.EMAIL_STATUS is '이메일확인상태(Y or N)';

update item set discount_rate = 10 where item_id = 1000;

update item set discount_rate = 15 where item_id = 1011;

update item set discount_rate = 15 where item_id = 625;
update item set discount_rate = 20 where item_id = 1012;



commit;