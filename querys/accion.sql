SELECT accioncapacitacion.id_accion as id_accion,
accioncapacitacion.creditos as creditos,
accioncapacitacion.observaciones as observaciones,
accioncapacitacion.planificada as planificada,
accioncapacitacion.nombre as nombre,
accioncapacitacion.fechainicio as fechainicio,
accioncapacitacion.fechafinal as fechafinal,
evalfinal.descripcion as id_evalfinal,
clasificacionaccion.descripcion as id_clafcaccion,
formaorganizativa.descripcion as id_formorg,
areaaccion.descripcion as id_areaaccion,
entidadejecutora.descripcion as id_entejecutora,
modalidadaccion.descripcion as id_modaccion
FROM accioncapacitacion, evalfinal, formaorganizativa, clasificacionaccion, areaaccion, accionsituacion, modalidadaccion, entidadejecutora
WHERE
evalfinal.id_evalfinal=accioncapacitacion.id_evalfinal AND
formaorganizativa.id_formorg=accioncapacitacion.id_formorg AND
clasificacionaccion.id_clafcaccion=accioncapacitacion.id_clafcaccion AND
areaaccion.id_areaaccion=accioncapacitacion.id_areaaccion AND
accionsituacion.id_cursosituacion=accioncapacitacion.id_cursosituacion AND
modalidadaccion.id_modaccion=accioncapacitacion.id_modaccion AND
entidadejecutora.id_entejecutora=accioncapacitacion.id_entejecutora
ORDER BY
accioncapacitacion.id_accion