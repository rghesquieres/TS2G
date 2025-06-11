with 

source as (

    select * from {{ source('clean', 'annuaire') }}

),

renamed as (

    select
        code_nature,
        nature,
        code_postal,
        code_insee,
        commune,
        code_dep,
        departement,
        code_academie,
        academie,
        code_region,
        region,
        code_circo,
        etablissement_mere,
        nb_eleves,
        maternelle,
        elementaire,
        generale,
        technologique,
        professionnelle,
        restauration,
        hebergement,
        ulis,
        apprentissage,
        segpa,
        post_bac,
        rep,
        multi_uai,
        rpi_concentre,
        pial,
        position,
        latitude,
        longitude,
        has_pial,
        uai,
        type_etablissement,
        nom_etablissement,
        has_etablissement_mere,
        section_arts,
        section_theatre,
        section_sport,
        section_internationale ,
        section_europeenne,
        lycee_agricole,
        lycee_militaire,
        lycee_des_metiers,
        statut

    from source

)

select * from renamed
