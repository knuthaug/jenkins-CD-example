package no.itera.cd.bikeraces.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Race_Roo_Configurable {
    
    declare @type: Race: @Configurable;
    
}
