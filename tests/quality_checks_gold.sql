/*
=================================================================================
quality checks
=================================================================================
script purpose:
      This script performs quality checks validate the integrity,consistency,and accuracy of the Gold layer.These checks ensure:
-uniqueness of surrogate keys in dimension tables
-refrential integrity between fact and dimensions tables
-validate of relationships in the data model for analytical purposes

usage notes:
-Run these checks after data loading silver layer
-investigate and resolve any discrepanics found during the checks
===================================================================================
*/

--===============================================================================
--checking 'gold.dim_customers'
--=============================================================================
--checks for uniqueness of customer key in gold.dim_customers
--expectation:no result













SELECT *
FROM (
    SELECT
        pn.prd_id,
        pn.prd_key,
        pn.prd_nm,
        pn.prd_cost,
        pn.prd_line,
        pn.prd_start_dt,
        pn.prd_end_dt,
        pn.cat,      
        pc.subcat,
        pc.maintenance
    FROM silver.crm_prd_info pn
    LEFT JOIN silver.erp_loc_a101 pc          -- FIXED TABLE NAME
        ON pn.cat = pc.id                     -- FIXED JOIN COLUMN
    WHERE pn.prd_end_dt IS NULL
) t
GROUP BY prd_key
HAVING COUNT(*) > 1;











SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL;
