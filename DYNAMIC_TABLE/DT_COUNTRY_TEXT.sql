create or replace dynamic table SILV.DT_COUNTRY_TEXT(
	SPRAS,
	LAND1,
	TXTSH
) target_lag = '1 hour' refresh_mode = AUTO initialize = ON_CREATE warehouse = DEV_DATA
 as
        select SPRAS AS SPRAS,
	LAND1 as LAND1,
	TXTSH 
        from BROZ."0COUNTRY_TEXT";
