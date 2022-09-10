SELECT idProduct, productname, price, active, type, idDepartment, stock
    FROM bb_product;

SELECT idShopper, b.idBasket, b.orderplaced, b.dtordered, b.dtcreated
    FROM bb_shopper s INNER JOIN bb_basket b
        USING (idShopper);

SELECT idProduct, p.productname, pc.categoryname, pd.optionname
    FROM bb_product p INNER JOIN bb_productoption
        USING(idProduct)
            INNER JOIN bb_productoptiondetail pd
                USING(idOption)
                    INNER JOIN bb_productoptioncategory pc
                        USING(idOptioncategory);

------------------------------------------------------------------------------

select idproduct "Product ID", productname "Product Name", sum(b.quantity) "Quantity of product sold"
from bb_product join bb_basketitem b using(idproduct)
join bb_basket using(idbasket)
group by idproduct, productname
order by idproduct;

select idbasket, idproduct, productname, description
from bb_product p join bb_basketitem bi using (idproduct)
join bb_basket b using(idbasket);

select idbasket,lastname, idproduct, productname, description
from bb_product join bb_basketitem using (idproduct)
join bb_basket using(idbasket)
join bb_shopper using(idshopper)
order by lastname;

select idbasket "Basket ID", idshopper "Shopper ID", to_char(dtcreated, 'MONTH DD, YYYY') "Date Ordered" 
from bb_shopper join bb_basket using(idshopper)
where dtcreated between '01-FEB-12' and '29-FEB-12'

select idproduct, sum(b.quantity)
from bb_basketitem join bb_basket b using(idbasket)
group by idproduct
order by idproduct;

select idproduct "Product ID", b.quantity "Quantity Sold"
from bb_basketitem join bb_basket b using(idbasket)
where b.quantity < 3
order by idproduct;

select idproduct "Product ID", productname "Product Name", price "Price"
from bb_product
where type='C' and price > (select avg(price) from bb_product where type='C');

create table contacts (
    NUMBER(4),
    Company_name  VARCHAR2(30),
    Email        VARCHAR2(30),
    DATE,
    Con_cnt       NUMBER(3),
    CONSTRAINT con_id_pk PRIMARY KEY(Con_id)
);

DESC CONTACTS;

insert into contacts
    values(1, 'Apple', 'iphone432@apple.com', '08-JUL-21', 1);
insert into contacts
    values(2, 'Seperet', 'help@seperetclothingsupply.com', sysdate, 2);
commit;

-----

update contacts
    set email = 'noreply@seperetclothingsupply.com'
    where con_id = 2;