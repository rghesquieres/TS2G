select uai, 
count (*) as nb
from {{ ref('union_effective') }}
group by uai, type_etablissement
having nb >1

