with testfile1 as (
    select * from  DATA_LAKE_FICO.RAW_SCH.customers c
    join select * from  DATA_LAKE_FICO.RAW_SCH.ORDERS o on c.customeid=o.customerid
select * from testfile1