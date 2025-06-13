SELECT a.*,
ue.nb_eleves,
ue.pk
FROM {{ ref('Exploration') }} as a
LEFT JOIN {{ ref('union_effective') }} as ue
ON a.uai = ue.uai