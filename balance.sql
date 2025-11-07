---------------------------------------------Carte de début de fichier-------------------------------------
SELECT
  '000000' AS Code_vendeur,
  FORMAT(GETDATE(), 'dd/MM/yyyy') AS date_du_jour,
  '' as  code_client,
  '' AS num_facture,
FORMAT(GETDATE(), 'dd/MM/yyyy') as date_piece,
  'EUR' as DEV,
  '0' as montant,
  '0' as date_echéance,
  'DEB' as type,
  '' as réglement
  
-------------------------------------------Détail de la Balance---------------------------------------
UNION ALL
 
SELECT DISTINCT
'007934' AS Code_vendeur,
FORMAT(GETDATE(), 'dd/MM/yyyy') AS date_du_jour,
C8.TIERS as  code_client,
CONCAT(C8.PREFPIECE, C8.PIECE) AS num_facture,
FORMAT(TRY_CONVERT(datetime, C8.PIECEDT), 'dd/MM/yyyy') AS date_piece,
  C8.DEV as DEV,
  CASE WHEN JNL.CODE_JNL_FACTOFRANCE IN('AVO', 'RGT', 'PTF', 'PTN', 'PTV', 'ODC' ) THEN (-1) * C8.MT else C8.MT end as montant,--Montant avec décimales, signé « - » quand il s’agit de ces types de pieces
  FORMAT(TRY_CONVERT(datetime, C8.ECHDT), 'dd/MM/yyyy') as date_echéance, --Date échéance 
JNL.CODE_JNL_FACTOFRANCE as type,
CASE WHEN JNL.CODE_JNL_FACTOFRANCE = 'FAC' THEN 'VIR' ELSE '' END as réglement--Moyen de paiement attendu, uniquement pour les factures, sinon laisser la zone à vide

 
FROM [ODS].[DIVALTO_C8] C8
left join [TECH].[TRANSCO_CODE_JNL] JNL 
ON C8.JNL = JNL.CODE_JNL_DIVALTO
WHERE C8.TIERS LIKE '%C0%'
AND C8.DOS = 'MAR' 
and  C8.CPTCOL LIKE '%411200%'
--AND C8.PINOTIERS != ''
--and C8.ECHDT IS NOT NULL
--and C8.LETTDT is null

/* new filtre */ 
and JNL.CODE_JNL_FACTOFRANCE not in ('AN') 
and ( C8.LETT = '' or  C8.LETT like '*%') 
and ( JNL.CODE_JNL_FACTOFRANCE not in ( 'PTF') and FORMAT(TRY_CONVERT(datetime, C8.ECHDT), 'dd/MM/yyyy') <= GETDATE() )



--------------------------------------------Carte de fin de fichier-------------------------------------
UNION ALL
 
SELECT
  '999999' AS Code_vendeur,
FORMAT(GETDATE(), 'dd/MM/yyyy') AS date_du_jour,---A mettre
  '' as  code_client,
  '' AS num_facture,
  FORMAT(GETDATE(), 'dd/MM/yyyy') as date_balance,
  'EUR' as DEV,
  '0' as montant,
  '0' as date_echéance,
  'FIN' as type,
  '' as réglement
