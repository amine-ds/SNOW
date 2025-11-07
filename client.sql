-- REQUETE CLIENT FACTOFRANCE POUR LA SOCIETE MARTIGUES
SELECT
  '000000' AS Code_vendeur,
  'DEB' AS Code_client,
  '80826244800018' as Identfiant_tiers,
'PRO ARMATURE MARTIGUES' as Sigle_tiers,
'PRO ARMATURE MARTIGUES' as Raison_sociale_du_tiers,
'CS 64040' as Adresse_tiers,
'4 RUE DU DAUPHINÉ' as Complement_adresse_tiers,
'69960' as Code_postal,
'CORBAS - CEDEX' as Ville,
'FR' as Code_pays

UNION ALL

SELECT DISTINCT
  '007934' AS Code_vendeur,
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
		  AND CLI.DOS = 'MAR'
		  AND CLI.ZONA != ''
		  and ( C8.LETT = '' or  C8.LETT like '*%') 
		  and C8.TIERS LIKE '%C0%'

UNION ALL

SELECT
  '999999' AS Code_vendeur,
  'FIN' AS Code_client,
  '80826244800018' as Identfiant_tiers,
'PRO ARMATURE MARTIGUES' as Sigle_tiers,
'PRO ARMATURE MARTIGUES' as Raison_sociale_du_tiers,
'CS 64040' as Adresse_tiers,
'4 RUE DU DAUPHINÉ' as Complement_adresse_tiers,
'69960' as Code_postal,
'CORBAS - CEDEX' as Ville,
'FR' as Code_pays

;
