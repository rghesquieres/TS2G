with 

source as (

    select * from {{ source('raw', 'annuaire') }}

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
        longitude

    from source

)

select * from renamed
