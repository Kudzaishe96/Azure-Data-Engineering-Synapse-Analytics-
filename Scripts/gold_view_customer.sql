-- This is auto-generated code
CREATE VIEW gold_customer AS
SELECT
   ROW_NUMBER() Over(ORDER BY b.cst_id ASC) "customer_key",
   b.cst_id "customer_id",
   b.cst_key "customer_number",
   b.cst_firstname "first_name",
   b.cst_lastname "last_name",
   b.cst_marital_status "marital_status",
   v.country "country",
   CASE when b.cst_gndr is NOT NULL then b.cst_gndr
    when c.gender is NOT NULL then c.gender
    ELSE 'h'
    End AS "gender",
   c.birthday "birthday",
   b.cst_create_date "created_date"
   
FROM
    OPENROWSET(
        BULK 'https://kudzaishelake.dfs.core.windows.net/dataengineering/Silver Layer/customer_info/delta_customer_info/part-00000-0f639636-80bf-4018-8b78-861c096ca558-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    )  b LEFT JOIN
    OPENROWSET(
        BULK 'https://kudzaishelake.dfs.core.windows.net/dataengineering/Silver Layer/customer_erp/delta_customer_erp/part-00000-52351ec7-4c99-48e4-9d85-0a1a3001d474-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    )  c
   on b.cst_key=c.cid_no
   LEFT JOIN
       OPENROWSET(
        BULK 'https://kudzaishelake.dfs.core.windows.net/dataengineering/Silver Layer/location/delta_location/part-00000-21070e74-6d12-4c50-bf8f-022d6fe58f7f-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) v 
    on b.cst_key = v.cid
