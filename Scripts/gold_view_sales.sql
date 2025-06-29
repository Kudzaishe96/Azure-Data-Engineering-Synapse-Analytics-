-- Create gold_sales view
CREATE VIEW gold_sales AS
SELECT
    s.sls_ord_num  "order_number",
    c.customer_key "customer_key",
    p.product_key "product_key",
    s.sls_order_dt "order_date",
    s.sls_ship_dt  "ship_date" ,
    s.sls_due_dt   "due_date",
    s.sls_sales   "sales",
    s.sls_quantity "quantity",
    s.sls_price "price",
    s.dwd_date "created_date"


FROM
    OPENROWSET(
        BULK 'https://kudzaishelake.dfs.core.windows.net/dataengineering/Silver Layer/sales/delta_sales/part-00000-d0db1578-3297-4652-92e3-d1723ed06ae5-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) s
    LEFT JOIN
    dbo.gold_customer c
    on s.sls_cust_id =c.customer_id
    LEFT JOIN 
    dbo.gold_products p
    on s.sls_prd_key=p.product_key_number
