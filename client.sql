-- REQUETE CLIENT FACTOFRANCE POUR LA SOCIETE CHAMPAGNE
SELECT
  '000000' AS Code_vendeur,
  'DEB' AS Code_client,
  '42121668000049' AS Identfiant_tiers,
  'PRO ARMATURE CHAMPAGNE' AS Sigle_tiers,
  'PRO ARMATURE CHAMPAGNE' AS Raison_sociale_du_tiers,
  '41 AVENUE DES MARTYRS DU 24 AOUT' AS Adresse_tiers,
  '-' AS Complement_adresse_tiers,
  '10800' AS Code_postal,
  'BUCHERES' AS Ville,
  'FR' AS Code_pays

UNION ALL

SELECT DISTINCT
  '005592' AS Code_vendeur,
  CLI.tiers AS Code_client,
  CLI.SIRET AS Identfiant_tiers,
  CLI.NOM AS Sigle_tiers,
  CLI.NOM AS Raison_sociale_du_tiers,
  CLI.RUE AS Adresse_tiers,
  CLI.ADRCPL1 AS Complement_adresse_tiers,
  CLI.CPOSTAL AS Code_postal,
  CLI.VIL AS Ville,
  CLI.PAY AS Code_pays

FROM ODS.DIVALTO_CLI CLI
JOIN ODS.DIVALTO_C8 C8
		  ON CLI.TIERS = C8.CPT AND CLI.DOS = C8.DOS
		
		WHERE
		  C8.CPTCOL LIKE '%411200%'
		  AND CLI.DOS = 'CHA'
		  AND CLI.ZONA != ''
		  and ( C8.LETT = '' or  C8.LETT like '*%') 
		  and C8.TIERS LIKE '%C0%'


UNION ALL

SELECT
  '999999' AS Code_vendeur,
  'FIN' AS Code_client,
 '42121668000049' AS Identfiant_tiers,
  'PRO ARMATURE CHAMPAGNE' AS Sigle_tiers,
  'PRO ARMATURE CHAMPAGNE' AS Raison_sociale_du_tiers,
  '41 AVENUE DES MARTYRS DU 24 AOUT' AS Adresse_tiers,
  '-' AS Complement_adresse_tiers,
  '10800' AS Code_postal,
  'BUCHERES' AS Ville,
  'FR' AS Code_pays

;
