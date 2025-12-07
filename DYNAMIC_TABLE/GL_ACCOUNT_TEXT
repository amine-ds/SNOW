create or replace dynamic table SILV.GL_ACCOUNT_TEXT(
	LANGU,
	KEY1,
	KEY2,
	DATETO,
	DATEFROM,
	TXTSH,
	TXTMD,
	TXTLG
) target_lag = '1 hour' refresh_mode = AUTO initialize = ON_CREATE warehouse = DEV_DATA
 as
        select LANGU AS LANGU ,
	KEY1 as KEY1,
	KEY2 as KEY2,
	DATETO ,
	DATEFROM ,
	TXTSH ,
	TXTMD ,
	TXTLG 
        from BROZ."0GL_ACCOUNT_TEXT";
