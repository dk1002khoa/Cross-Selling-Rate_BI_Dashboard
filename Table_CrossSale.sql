WITH sale AS (
    SELECT 
        s.CreateDate,
        s.date_final AS `Date`,
        s.product_group_name AS `DMC3`,
        s.group_sale,
        CASE 
            WHEN s.group_sale IN ("MÁY CŨ") THEN "MÁY CŨ"
            WHEN s.group_sale IN ("SỬA KHÁC","ĐIỆN THOẠI","LAPTOP") THEN "LINH KIỆN"
            WHEN s.group_sale IN ("PHỤ KIỆN") THEN "PHỤ KIỆN"
            ELSE 'KHÁC'
        END AS `Type`,
        s.AutoCode,
        s.BranchName as `Shop`,
        s.ProductCode,
        s.ProductName,
        s.ContactPhone,
        s.region AS `Miền`,
        s.IsSales AS `IsSales`,
        SUM(s.quantity) AS `SL`,
        SUM(s.amount) AS `Dso`
    FROM `pangocdpdienthoaivui.dtv_sales_datamart.dtv_union_sale` s 
    WHERE 
        DATE(s.CreateDate) >= DATE('2025-04-01')
        AND DATE(s.CreateDate) < DATE(CURRENT_DATE("Asia/Ho_Chi_Minh"))
        AND s.AutoCode NOT LIKE ('%#%')
        -- AND ContactPhone = '0988860008'
    GROUP BY 
        s.AutoCode, s.CreateDate, s.date_final, s.group_sale, s.IsSales, 
        s.Region, s.StoreCode, s.product_group_name, s.ProductCode,s.BranchName, 
        s.ProductName, s.ContactPhone, s.centerid, s.StoreName 
) 
SELECT 
    sale.*, 
    _sale.Date AS `Date2`,
    _sale.AutoCode AS `AutoCode2`, 
    _sale.Type AS `Type2`,
    _sale.DMC3 AS `DCM32`,
    _sale.SL AS `SL2`
FROM sale 
INNER JOIN sale _sale 
    ON _sale.ContactPhone = sale.ContactPhone
    AND _sale.DMC3 != sale.DMC3
    AND _sale.Type != sale.Type
    AND ABS(DATE_DIFF(_sale.Date, sale.Date, DAY)) <= 1
WHERE 
    sale.IsSales = 1
    AND sale.Type = "PHỤ KIỆN"
    AND  _sale.Type <> "KHÁC" -- Type 2