create or replace dynamic table DEV_EMEA.SILV.DT_ADDRESS(
	ADDRESSID,
	ADDRESSLINE1,
	CITY,
	STATEPROVINCEID,
	POSTALCODE
) target_lag = '1 hour' refresh_mode = AUTO initialize = ON_CREATE warehouse = DEV_DATA
 as
        select AddressID as AddressID,
        AddressLine1,
        City,
        StateProvinceID,
        PostalCode
        from BROZ.Address;
