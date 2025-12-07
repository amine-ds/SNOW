create or replace dynamic table SILV.DT_COMMANDE(
	SALESORDERID,
	REVISIONNUMBER,
	ORDERDATE,
	DUEDATE,
	STATUS
) target_lag = '1 hour' refresh_mode = AUTO initialize = ON_CREATE warehouse = DEV_DATA
 as
        select SALESORDERID,REVISIONNUMBER,ORDERDATE,DUEDATE,STATUS
        from BROZ.COMMANDE;
