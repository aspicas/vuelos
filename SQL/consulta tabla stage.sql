/*CON METRICA*/

SELECT COUNT(data.VueloID) as ViajesEnElMes, data.NombreAeropuertoDestino , data.NombreAeropuertoOrigen , data.Mes , data.Ano 
FROM (SELECT
	 v.VUE_ID as VueloID 
	, ad.aer_nombre as NombreAeropuertoDestino
	, (SELECT ao.aer_nombre 
	   FROM aer_vue avo, aeropuerto ao
	   WHERE 
	   avo.AV_FK_VUE = v.VUE_ID AND
	   avo.AV_SALIDA = 0 AND
	   avo.AV_FK_AER = ao.aer_id )  as NombreAeropuertoOrigen
	, to_number(to_char(v.VUE_FECHA_LLE,'MM'), '99') as Mes
	, to_number(to_char(v.VUE_FECHA_LLE,'YYYY'), '9999') as Ano
	FROM aeropuerto ad, aer_vue avd, vuelo v
	where
	avd.AV_FK_VUE = v.VUE_ID AND
	avd.AV_FK_AER = ad.aer_id AND
	avd.AV_SALIDA = 1 ) as data
group by data.NombreAeropuertoDestino , data.NombreAeropuertoOrigen , data.Mes , data.Ano  
;



/*CON ORIGEN*/
SELECT
 v.VUE_ID as VueloID
, ad.aer_nombre as NombreAeropuertoDestino
, (SELECT ao.aer_nombre 
   FROM aer_vue avo, aeropuerto ao
   WHERE 
   avo.AV_FK_VUE = v.VUE_ID AND
   avo.AV_SALIDA = 0 AND
   avo.AV_FK_AER = ao.aer_id )  as NombreAeropuertoOrigen
, to_number(to_char(v.VUE_FECHA_LLE,'MM'), '99') as Mes
, to_number(to_char(v.VUE_FECHA_LLE,'YYYY'), '9999') as Ano
FROM aeropuerto ad, aer_vue avd, vuelo v
where
avd.AV_FK_VUE = v.VUE_ID AND
avd.AV_FK_AER = ad.aer_id AND
avd.AV_SALIDA = 1 ;




/* SIN ORIGEN */
SELECT
 v.VUE_ID as VueloID
, a.aer_nombre as NombreAeropuertoDestino
, to_number(to_char(v.VUE_FECHA_LLE,'MM'), '99') as Mes
, to_number(to_char(v.VUE_FECHA_LLE,'YYYY'), '9999') as Ano
FROM aeropuerto a, aer_vue av, vuelo v
where 
av.AV_FK_VUE = v.VUE_ID AND
av.AV_FK_AER = a.aer_id AND
av.AV_SALIDA = 1 ;
