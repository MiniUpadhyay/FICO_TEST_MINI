with testfile as (
    select * from  DATA_LAKE_FICO.RAW_SCH.ORDERS)
select customerid,customername,No_of_Orders from testfile