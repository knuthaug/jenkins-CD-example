package no.itera.cd.bikeraces.domain;

import java.lang.String;

privileged aspect Race_Roo_ToString {
    
    public String Race.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("RaceDate: ").append(getRaceDate()).append(", ");
        sb.append("Organizer: ").append(getOrganizer());
        return sb.toString();
    }
    
}
