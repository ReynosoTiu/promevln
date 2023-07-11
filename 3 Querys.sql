SELECT 
	PY.NOMBRE NOMBRE_PROYECTO, 
	PD.PRODUCTO COD_PRODUCTO, 
	PD.DESCRIPCION DESCRIPCION_PRODUCTO
FROM PROYECTO PY
	INNER JOIN PRODUCTO_PROYECTO PP 
		ON 	PY.PROYECTO = PP.PROYECTO
	INNER JOIN PRODUCTO PD 
		ON 	PP.PRODUCTO = PD.PRODUCTO
WHERE 
	PY.PROYECTO = 1;
	
	
	
SELECT 
	MEN.COD_MENSAJE MENSAJE, 
	MEN.COD_FORMATO FORMATO,
	PY.NOMBRE NOMBRE_PROYECTO, 
	PD.PRODUCTO COD_PRODUCTO, 
	PD.DESCRIPCION DESCRIPCION_PRODUCTO
FROM PROYECTO PY
	INNER JOIN PRODUCTO_PROYECTO PP 
		ON 	P.PROYECTO = PP.PROYECTO
	INNER JOIN PRODUCTO PD 
		ON 	PP.PRODUCTO = PD.PRODUCTO
	INNER JOIN MENSAJE MEN 
		ON 	PP.PROYECTO = MEN.PROYECTO AND 
			PP.PRODUCTO = MEN.PRODUCTO
			



SELECT 
	MEN.COD_MENSAJE MENSAJE, 
	MEN.COD_FORMATO FORMATO,
	P.NOMBRE NOMBRE_PROYECTO, 
	CASE 
		WHEN 	( SELECT COUNT(PRODUCTO) FROM MENSAJE MEN_I where MEN.COD_MENSAJE=MEN_I.COD_MENSAJE and PROYECTO=MEN_I.PROYECTO ) =
				( SELECT COUNT(PROYECTO) FROM MENSAJE MEN_I where MEN.COD_MENSAJE=MEN_I.COD_MENSAJE and PROYECTO=MEN_I.PROYECTO )
		THEN 'TODOS' ELSE PD.DESCRIPCION END
	DESCRIPCION_PRODUCTO
FROM PROYECTO P
	INNER JOIN PRODUCTO_PROYECTO PP 
		ON 	P.PROYECTO = PP.PROYECTO
	INNER JOIN PRODUCTO PD 
		ON 	PP.PRODUCTO = PD.PRODUCTO
	INNER JOIN MENSAJE MEN 
		ON 	PP.PROYECTO = MEN.PROYECTO AND 
			PP.PRODUCTO = MEN.PRODUCTO
GROUP BY 
	MEN.COD_MENSAJE, 
	MEN.COD_FORMATO,
	P.NOMBRE, 
	CASE 
		WHEN 	( SELECT COUNT(PRODUCTO) FROM MENSAJE MEN_I where MEN.COD_MENSAJE=MEN_I.COD_MENSAJE and PROYECTO=MEN_I.PROYECTO ) =
				( SELECT COUNT(PROYECTO) FROM MENSAJE MEN_I where MEN.COD_MENSAJE=MEN_I.COD_MENSAJE and PROYECTO=MEN_I.PROYECTO )
		THEN 'TODOS' ELSE PD.DESCRIPCION END