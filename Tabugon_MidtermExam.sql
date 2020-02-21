PGDMP                         x            d113j741bubchi     11.6 (Ubuntu 11.6-1.pgdg16.04+1)    12.0 9    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16571    d113j741bubchi    DATABASE     �   CREATE DATABASE d113j741bubchi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d113j741bubchi;
                zjeirjrdfpxdip    false            �           0    0    DATABASE d113j741bubchi    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d113j741bubchi FROM PUBLIC;
                   zjeirjrdfpxdip    false    3981                        2615    671471    tabugon_midtermexam    SCHEMA     #   CREATE SCHEMA tabugon_midtermexam;
 !   DROP SCHEMA tabugon_midtermexam;
                zjeirjrdfpxdip    false            �           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO zjeirjrdfpxdip;
                   postgres    false    677            �            1255    13661096 #   get_productname_qtyperunit(integer)    FUNCTION     T  CREATE FUNCTION tabugon_midtermexam.get_productname_qtyperunit(val integer DEFAULT 5) RETURNS TABLE(product_name character varying, qty_per_unit character varying)
    LANGUAGE plpgsql
    AS $$
	BEGIN
	RETURN QUERY
		SELECT products.product_name, products.quantity_per_unit
		FROM tabugon_midtermexam.products
		LIMIT val;
		
		END;
		$$;
 K   DROP FUNCTION tabugon_midtermexam.get_productname_qtyperunit(val integer);
       tabugon_midtermexam          zjeirjrdfpxdip    false    3            �            1259    828680 	   customers    TABLE     �  CREATE TABLE tabugon_midtermexam.customers (
    id integer NOT NULL,
    company character varying(50),
    last_name character varying(50),
    first_name character varying(50),
    email_address character varying(50),
    job_title character varying(50),
    business_phone character varying(25),
    home_phone character varying(25),
    mobile_phone character varying(25),
    fax_number character varying(25),
    address character varying(100),
    city character varying(50),
    state_province character varying(50),
    zip_postal_code character varying(15),
    country_region character varying(50),
    web_page character varying(100),
    notes character varying(500),
    attachments character varying(500)
);
 *   DROP TABLE tabugon_midtermexam.customers;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    837397    employee_privileges    TABLE     ~   CREATE TABLE tabugon_midtermexam.employee_privileges (
    employee_id integer NOT NULL,
    privilege_id integer NOT NULL
);
 4   DROP TABLE tabugon_midtermexam.employee_privileges;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    830862 	   employees    TABLE     �  CREATE TABLE tabugon_midtermexam.employees (
    id integer NOT NULL,
    company character varying(50),
    last_name character varying(50),
    first_name character varying(50),
    email_address character varying(50),
    job_title character varying(50),
    business_phone character varying(25),
    home_phone character varying(25),
    mobile_phone character varying(25),
    fax_number character varying(25),
    address character varying(100),
    city character varying(50),
    state_province character varying(50),
    zip_postal_code character varying(15),
    country_region character varying(50),
    web_page character varying(100),
    notes character varying(500),
    attachments character varying(500)
);
 *   DROP TABLE tabugon_midtermexam.employees;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    841332    inventory_transaction_types    TABLE        CREATE TABLE tabugon_midtermexam.inventory_transaction_types (
    id integer NOT NULL,
    type_name character varying(50)
);
 <   DROP TABLE tabugon_midtermexam.inventory_transaction_types;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660937    inventory_transactions    TABLE     �  CREATE TABLE tabugon_midtermexam.inventory_transactions (
    id integer NOT NULL,
    transaction_type integer NOT NULL,
    transaction_created_date time without time zone,
    transaction_modified_date time without time zone,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    purchase_order_id integer,
    customer_order_id integer,
    comments character varying(255) DEFAULT NULL::character varying
);
 7   DROP TABLE tabugon_midtermexam.inventory_transactions;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660942    invoices    TABLE     )  CREATE TABLE tabugon_midtermexam.invoices (
    id integer NOT NULL,
    order_id integer,
    invoice_date time without time zone,
    due_date time without time zone,
    tax numeric(19,4) DEFAULT 0.0000,
    shipping numeric(19,4) DEFAULT 0.0000,
    amount_due numeric(19,4) DEFAULT 0.0000
);
 )   DROP TABLE tabugon_midtermexam.invoices;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660949    order_details    TABLE     �  CREATE TABLE tabugon_midtermexam.order_details (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer,
    quantity numeric(18,4) DEFAULT 0.0000 NOT NULL,
    unit_price numeric(19,4) DEFAULT 0.0000,
    discount integer DEFAULT 0 NOT NULL,
    status_id integer,
    date_allocated time without time zone,
    purchase_order_id integer,
    inventory_id integer
);
 .   DROP TABLE tabugon_midtermexam.order_details;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660955    order_details_status    TABLE     �   CREATE TABLE tabugon_midtermexam.order_details_status (
    id integer NOT NULL,
    status_name character varying(50) NOT NULL
);
 5   DROP TABLE tabugon_midtermexam.order_details_status;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660958    orders    TABLE     �  CREATE TABLE tabugon_midtermexam.orders (
    id integer NOT NULL,
    employee_id integer,
    customer_id integer,
    order_date time without time zone,
    shipped_date time without time zone,
    shipper_id integer,
    ship_name character varying(50) DEFAULT NULL::character varying,
    ship_address text,
    ship_city character varying(50) DEFAULT NULL::character varying,
    ship_state_province character varying(50) DEFAULT NULL::character varying,
    ship_zip_postal_code character varying(50) DEFAULT NULL::character varying,
    ship_country_region character varying(50) DEFAULT NULL::character varying,
    shipping_fee numeric(19,4) DEFAULT 0.0000,
    taxes numeric(19,4) DEFAULT 0.0000,
    payment_type character varying(50) DEFAULT NULL::character varying,
    paid_date time without time zone,
    notes text,
    tax_rate integer DEFAULT 0,
    tax_status_id integer,
    status_id integer DEFAULT 0
);
 '   DROP TABLE tabugon_midtermexam.orders;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660974    orders_status    TABLE     |   CREATE TABLE tabugon_midtermexam.orders_status (
    id integer NOT NULL,
    status_name character varying(50) NOT NULL
);
 .   DROP TABLE tabugon_midtermexam.orders_status;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    842506    orders_tax_status    TABLE     {   CREATE TABLE tabugon_midtermexam.orders_tax_status (
    id integer NOT NULL,
    tax_status_name character varying(50)
);
 2   DROP TABLE tabugon_midtermexam.orders_tax_status;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    834386 
   privileges    TABLE     s   CREATE TABLE tabugon_midtermexam.privileges (
    id integer NOT NULL,
    privilege_name character varying(50)
);
 +   DROP TABLE tabugon_midtermexam.privileges;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660977    products    TABLE     �  CREATE TABLE tabugon_midtermexam.products (
    supplier_ids text,
    id integer NOT NULL,
    product_code character varying(25) DEFAULT NULL::character varying,
    product_name character varying(50) DEFAULT NULL::character varying,
    description text,
    standard_cost numeric(19,4) DEFAULT 0.0000,
    list_price numeric(19,4) DEFAULT 0.0000 NOT NULL,
    reorder_level integer,
    target_level integer,
    quantity_per_unit character varying(50) DEFAULT NULL::character varying,
    discontinued integer DEFAULT 0 NOT NULL,
    minimum_reorder_quantity integer,
    category character varying(50) DEFAULT NULL::character varying,
    attachments bytea
);
 )   DROP TABLE tabugon_midtermexam.products;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660990    purchase_order_details    TABLE     X  CREATE TABLE tabugon_midtermexam.purchase_order_details (
    id integer NOT NULL,
    purchase_order_id integer NOT NULL,
    product_id integer,
    quantity numeric(18,4) NOT NULL,
    unit_cost numeric(19,4) NOT NULL,
    date_received time without time zone,
    posted_to_inventory integer DEFAULT 0 NOT NULL,
    inventory_id integer
);
 7   DROP TABLE tabugon_midtermexam.purchase_order_details;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660994    purchase_order_status    TABLE     �   CREATE TABLE tabugon_midtermexam.purchase_order_status (
    id integer NOT NULL,
    status character varying(50) DEFAULT NULL::character varying
);
 6   DROP TABLE tabugon_midtermexam.purchase_order_status;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13661010    purchase_orders    TABLE     �  CREATE TABLE tabugon_midtermexam.purchase_orders (
    id integer NOT NULL,
    supplier_id integer,
    created_by integer,
    submitted_date time without time zone,
    creation_date time without time zone,
    status_id integer DEFAULT 0,
    expected_date time without time zone,
    shipping_fee numeric(19,4) DEFAULT 0.0000 NOT NULL,
    taxes numeric(19,4) DEFAULT 0.0000 NOT NULL,
    payment_date time without time zone,
    payment_amount numeric(19,4) DEFAULT 0.0000,
    payment_method character varying(50) DEFAULT NULL::character varying,
    notes text,
    approved_by integer,
    approved_date time without time zone,
    submitted_by integer
);
 0   DROP TABLE tabugon_midtermexam.purchase_orders;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13661022    sales_reports    TABLE     *  CREATE TABLE tabugon_midtermexam.sales_reports (
    group_by character varying(50) NOT NULL,
    display character varying(50) DEFAULT NULL::character varying,
    title character varying(50) DEFAULT NULL::character varying,
    filter_row_source text,
    "default" integer DEFAULT 0 NOT NULL
);
 .   DROP TABLE tabugon_midtermexam.sales_reports;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    841615    shippers    TABLE     �  CREATE TABLE tabugon_midtermexam.shippers (
    id integer NOT NULL,
    company character varying(50),
    last_name character varying(50),
    first_name character varying(50),
    email_address character varying(50),
    job_title character varying(50),
    business_phone character varying(25),
    home_phone character varying(25),
    mobile_phone character varying(25),
    fax_number character varying(25),
    address character varying(100),
    city character varying(50),
    state_province character varying(50),
    zip_postal_code character varying(15),
    country_region character varying(50),
    web_page character varying(100),
    notes character varying(500),
    attachments character varying(500)
);
 )   DROP TABLE tabugon_midtermexam.shippers;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13661031    strings    TABLE     �   CREATE TABLE tabugon_midtermexam.strings (
    string_id integer NOT NULL,
    string_data character varying(255) DEFAULT NULL::character varying
);
 (   DROP TABLE tabugon_midtermexam.strings;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            �            1259    13660769 	   suppliers    TABLE     �  CREATE TABLE tabugon_midtermexam.suppliers (
    supplier_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);
 *   DROP TABLE tabugon_midtermexam.suppliers;
       tabugon_midtermexam            zjeirjrdfpxdip    false    3            t          0    828680 	   customers 
   TABLE DATA             COPY tabugon_midtermexam.customers (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    196   �^       w          0    837397    employee_privileges 
   TABLE DATA           U   COPY tabugon_midtermexam.employee_privileges (employee_id, privilege_id) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    199   j`       u          0    830862 	   employees 
   TABLE DATA             COPY tabugon_midtermexam.employees (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    197   �`       x          0    841332    inventory_transaction_types 
   TABLE DATA           Q   COPY tabugon_midtermexam.inventory_transaction_types (id, type_name) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    200   �`       |          0    13660937    inventory_transactions 
   TABLE DATA           �   COPY tabugon_midtermexam.inventory_transactions (id, transaction_type, transaction_created_date, transaction_modified_date, product_id, quantity, purchase_order_id, customer_order_id, comments) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    204   �`       }          0    13660942    invoices 
   TABLE DATA           p   COPY tabugon_midtermexam.invoices (id, order_id, invoice_date, due_date, tax, shipping, amount_due) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    205   �`       ~          0    13660949    order_details 
   TABLE DATA           �   COPY tabugon_midtermexam.order_details (id, order_id, product_id, quantity, unit_price, discount, status_id, date_allocated, purchase_order_id, inventory_id) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    206   �`                 0    13660955    order_details_status 
   TABLE DATA           L   COPY tabugon_midtermexam.order_details_status (id, status_name) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    207   a       �          0    13660958    orders 
   TABLE DATA           .  COPY tabugon_midtermexam.orders (id, employee_id, customer_id, order_date, shipped_date, shipper_id, ship_name, ship_address, ship_city, ship_state_province, ship_zip_postal_code, ship_country_region, shipping_fee, taxes, payment_type, paid_date, notes, tax_rate, tax_status_id, status_id) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    208   5a       �          0    13660974    orders_status 
   TABLE DATA           E   COPY tabugon_midtermexam.orders_status (id, status_name) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    209   Ra       z          0    842506    orders_tax_status 
   TABLE DATA           M   COPY tabugon_midtermexam.orders_tax_status (id, tax_status_name) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    202   oa       v          0    834386 
   privileges 
   TABLE DATA           E   COPY tabugon_midtermexam.privileges (id, privilege_name) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    198   �a       �          0    13660977    products 
   TABLE DATA           �   COPY tabugon_midtermexam.products (supplier_ids, id, product_code, product_name, description, standard_cost, list_price, reorder_level, target_level, quantity_per_unit, discontinued, minimum_reorder_quantity, category, attachments) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    210   �a       �          0    13660990    purchase_order_details 
   TABLE DATA           �   COPY tabugon_midtermexam.purchase_order_details (id, purchase_order_id, product_id, quantity, unit_cost, date_received, posted_to_inventory, inventory_id) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    211   �a       �          0    13660994    purchase_order_status 
   TABLE DATA           H   COPY tabugon_midtermexam.purchase_order_status (id, status) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    212   �a       �          0    13661010    purchase_orders 
   TABLE DATA              COPY tabugon_midtermexam.purchase_orders (id, supplier_id, created_by, submitted_date, creation_date, status_id, expected_date, shipping_fee, taxes, payment_date, payment_amount, payment_method, notes, approved_by, approved_date, submitted_by) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    213    b       �          0    13661022    sales_reports 
   TABLE DATA           l   COPY tabugon_midtermexam.sales_reports (group_by, display, title, filter_row_source, "default") FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    214   b       y          0    841615    shippers 
   TABLE DATA             COPY tabugon_midtermexam.shippers (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    201   :b       �          0    13661031    strings 
   TABLE DATA           F   COPY tabugon_midtermexam.strings (string_id, string_data) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    215   �b       {          0    13660769 	   suppliers 
   TABLE DATA           �   COPY tabugon_midtermexam.suppliers (supplier_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, homepage) FROM stdin;
    tabugon_midtermexam          zjeirjrdfpxdip    false    203   �b       �           2606    828687    customers customers_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY tabugon_midtermexam.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY tabugon_midtermexam.customers DROP CONSTRAINT customers_pkey;
       tabugon_midtermexam            zjeirjrdfpxdip    false    196            �           2606    837401 ,   employee_privileges employee_privileges_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY tabugon_midtermexam.employee_privileges
    ADD CONSTRAINT employee_privileges_pkey PRIMARY KEY (employee_id, privilege_id);
 c   ALTER TABLE ONLY tabugon_midtermexam.employee_privileges DROP CONSTRAINT employee_privileges_pkey;
       tabugon_midtermexam            zjeirjrdfpxdip    false    199    199            �           2606    830869    employees employees_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY tabugon_midtermexam.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY tabugon_midtermexam.employees DROP CONSTRAINT employees_pkey;
       tabugon_midtermexam            zjeirjrdfpxdip    false    197            �           2606    841336 <   inventory_transaction_types inventory_transaction_types_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY tabugon_midtermexam.inventory_transaction_types
    ADD CONSTRAINT inventory_transaction_types_pkey PRIMARY KEY (id);
 s   ALTER TABLE ONLY tabugon_midtermexam.inventory_transaction_types DROP CONSTRAINT inventory_transaction_types_pkey;
       tabugon_midtermexam            zjeirjrdfpxdip    false    200            �           2606    842510 (   orders_tax_status orders_tax_status_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY tabugon_midtermexam.orders_tax_status
    ADD CONSTRAINT orders_tax_status_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY tabugon_midtermexam.orders_tax_status DROP CONSTRAINT orders_tax_status_pkey;
       tabugon_midtermexam            zjeirjrdfpxdip    false    202            �           2606    834390    privileges privileges_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY tabugon_midtermexam.privileges
    ADD CONSTRAINT privileges_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY tabugon_midtermexam.privileges DROP CONSTRAINT privileges_pkey;
       tabugon_midtermexam            zjeirjrdfpxdip    false    198            �           2606    841622    shippers shippers_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY tabugon_midtermexam.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY tabugon_midtermexam.shippers DROP CONSTRAINT shippers_pkey;
       tabugon_midtermexam            zjeirjrdfpxdip    false    201            �           2606    837402 5   employee_privileges fk_employee_privileges_employees1    FK CONSTRAINT     �   ALTER TABLE ONLY tabugon_midtermexam.employee_privileges
    ADD CONSTRAINT fk_employee_privileges_employees1 FOREIGN KEY (employee_id) REFERENCES tabugon_midtermexam.employees(id);
 l   ALTER TABLE ONLY tabugon_midtermexam.employee_privileges DROP CONSTRAINT fk_employee_privileges_employees1;
       tabugon_midtermexam          zjeirjrdfpxdip    false    3822    199    197            �           2606    837407 6   employee_privileges fk_employee_privileges_privileges1    FK CONSTRAINT     �   ALTER TABLE ONLY tabugon_midtermexam.employee_privileges
    ADD CONSTRAINT fk_employee_privileges_privileges1 FOREIGN KEY (privilege_id) REFERENCES tabugon_midtermexam.privileges(id);
 m   ALTER TABLE ONLY tabugon_midtermexam.employee_privileges DROP CONSTRAINT fk_employee_privileges_privileges1;
       tabugon_midtermexam          zjeirjrdfpxdip    false    3824    199    198            t   �  x���Mn�0F��Sh�.\Hv��KYNR�mX	\�L�D�$7Y�=B�ћ�$���2�,b�7����a"H���1H`Hk*$��S��4|�z��qw�(�m7��"p� 26ȭ&��Z+	�	�7y��]��iC��h�P&ȕ4�!���:���+z��+��'��|'��Jݡ�������.�m5b�V<�;��L�w.I���'�b"H+-�/y�yd�X�;�[�
Li����tզǞ~�??~�3I	j�ph�qC̈́+�[%��l��z�%����ԝI$�p��a
uT ��*r����r�9�"W�UP-^vW�塟?k�C%�xԦ�{�g��kҮ��B�'�F���w�h̕�y�E�d�MƐ��ĵJ�@|T�����7��>��u["
��Xb�q��zv>F"
���
Ɠ6��S���b�V�      w      x������ � �      u      x������ � �      x      x������ � �      |      x������ � �      }      x������ � �      ~      x������ � �            x������ � �      �      x������ � �      �      x������ � �      z      x������ � �      v      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      y   =   x�3�t�M�����Î���*�K�RSK8}Ss22�9C�8-A�34���+F��� rw      �      x������ � �      {      x������ � �     