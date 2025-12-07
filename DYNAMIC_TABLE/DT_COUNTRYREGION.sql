create or replace dynamic table SILV.DT_COUNTRYREGION(
	COUNTRYREGIONCODE,
	NAME,
	MODIFIEDDATE
) target_lag = '1 hour' refresh_mode = AUTO initialize = ON_CREATE warehouse = PRD_DATA
 as
        select COUNTRYREGIONCODE, NAME,MODIFIEDDATE
        from BROZ.COUNTRYREGION;
