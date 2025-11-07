----REQUUETE TRAITE DIVALTO VERS FACTOFRANCE
	SELECT
	'005592' as code_vendeur,
	FORMAT(GETDATE(), 'dd/MM/yyyy')  as date_du_fichier,-- date de géneration 
	C8.TIERS as code_client,
	--C8.PINOTIERS as num_facture, 
	concat (PREFPIECE  , PIECE ) as num_facture,
	CASE 
		WHEN C8.SENS = 1 then C8.MTDEV  
		else  (-1) * C8.MTDEV 
	end as Débit ,---Faire un si pour le sens 
	FORMAT(TRY_CONVERT(datetime, C8.ECRDT), 'dd/MM/yyyy')  as date_ecriture,
	C8.DEV as devise,
	CASE 
		WHEN C8.SENS = 2 then C8.MTDEV  
		else  (-1) * C8.MTDEV 
		end as Montant,
	FORMAT(TRY_CONVERT(datetime, C8.ECHDT), 'dd/MM/yyyy')  as date_echéance,
	'LCR' as code_reglement,
	C8.ECRNO as num_ecriture_divalto,
	FF.pointage as pointage
	FROM  ODS.DIVALTO_C8 C8
	LEFT JOIN (   SELECT
				C8.TIERS as code_client,
				C8.PINOTIERS as num_facture,
				C8.DEV as devise,
				FORMAT(TRY_CONVERT(datetime, C8.ECHDT), 'dd/MM/yyyy')  as date_echéance,
				CASE 
					WHEN C8.SENS = 1 then C8.MTDEV  
					else  (-1) * C8.MTDEV 
				end as pointage
				FROM  ODS.DIVALTO_C8 C8
				WHERE 
				C8.TIERS IS NOT NULL
				  AND C8.TIERS LIKE '%C0%'
				  AND C8.CPTCOL LIKE '%413200%'
				  AND C8.DOS = 'CHA'
				  AND FORMAT(TRY_CONVERT(datetime, C8.ECHDT), 'yyyyMMdd') > format(GETDATE(), 'yyyyMMdd') 
				  AND C8.JNL in (/*'TC','TCF',*/ 'FF')
			) AS FF on C8.TIERS = code_client AND C8.PINOTIERS = num_facture AND C8.DEV = devise 
				AND	FORMAT(TRY_CONVERT(datetime, C8.ECHDT), 'dd/MM/yyyy')  = date_echéance
	WHERE 
	C8.TIERS IS NOT NULL
	  AND C8.TIERS LIKE '%C0%'
	  AND C8.CPTCOL LIKE '%413200%'
	  AND C8.DOS = 'CHA'
	  AND FORMAT(TRY_CONVERT(datetime, C8.ECHDT), 'yyyyMMdd') > format(GETDATE(), 'yyyyMMdd') 
	  AND C8.JNL in ('TC','TCF'/*, 'FF'*/)
