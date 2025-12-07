create or replace dynamic table SILV.DT_COUNTRY_TEXT(
	SPRAS,
	LAND1,
	TXTSH
) target_lag = '1 hour' refresh_mode = AUTO initialize = ON_CREATE warehouse = DEV_DATA
 as
        select SPRAS ,
	LAND1 ,
	TXTSH 
        from DEV_EMEA.BROZ."0COUNTRY_TEXT";
