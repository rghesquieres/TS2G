SELECT a.*,
ue.nb_eleves,
FROM {{ ref('Exploration') }} as a
LEFT JOIN {{ ref('union_effective') }} as ue
ON a.uai = ue.uai