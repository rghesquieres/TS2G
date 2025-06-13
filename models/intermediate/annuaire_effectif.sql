SELECT a.*,
ue.nb_eleves,
FROM {{ ref('intermediate_exploration') }} as a
LEFT JOIN {{ ref('intermediate_union_effective') }} as ue
ON a.uai = ue.uai