package no.itera.cd.bikeraces.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect RaceTypes_Roo_Configurable {
    
    declare @type: RaceTypes: @Configurable;
    
}
