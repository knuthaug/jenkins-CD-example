package no.itera.cd.bikeraces.domain;

import java.lang.String;

privileged aspect RaceTypes_Roo_ToString {
    
    public String RaceTypes.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
