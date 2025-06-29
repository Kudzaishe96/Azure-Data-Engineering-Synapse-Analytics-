-- Create a gold products view
CREATE VIEW gold_products As
SELECT
    ROW_NUMBER()OVER(ORDER BY d.prd_id) "product_key",
    d.prd_id "product_id",
    d.prd_key "product_number",
    d.prd_nm  "product_name",
    d.prd_sk "product_key_number",
    d.prd_cost "product_cost",
    d.prd_line "product_line",
    d.prod_cat_sk "catergory_id",
    c.category   "category",
    c.sub_category  "sub_category",
    c.Maintenance "maintainance",
    d.prd_start_dt "start_date",
    d.Nw_end_date  "end_date",
    d.dwd_date "created_date"

FROM
    OPENROWSET(
        BULK 'https://kudzaishelake.dfs.core.windows.net/dataengineering/Silver Layer/products/delta_products/part-00000-6aac7ffb-7980-4118-bc21-ff0a8056c6c8-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) d
    LEFT Join 
    OPENROWSET(
        BULK 'https://kudzaishelake.dfs.core.windows.net/dataengineering/Silver Layer/product_catergory/delta_product_catergory/part-00000-3b7a23e6-2dd4-4adf-89bb-c9c62921b8ce-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) c
    on d.prod_cat_sk =c.id
    where d.Nw_end_date  is NULL
