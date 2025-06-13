with 

source as (

    select * from {{ source('clean', 'annuaire') }}

),

renamed as (

    select
        uai,
        nom_etablissement,
        type_etablissement,
        statut,
        code_postal,
        code_commune,
        nom_commune,
        code_dep,
        code_academie,
        code_region,
        ecole_maternelle,
        ecole_elementaire,
        voie_generale,
        voie_technologique,
        voie_professionnelle,
        restauration,
        hebergement,
        ulis,
        apprentissage,
        segpa,
        post_bac,
        section_arts,
        section_cinema,
        section_theatre,
        section_sport,
        section_internationale,
        section_europeenne,
        lycee_agricole,
        lycee_militaire,
        lycee_des_metiers,
        rep,
        position,
        latitude,
        longitude,
        has_pial

    from source

)

select * from renamed
