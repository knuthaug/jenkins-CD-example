package no.itera.cd.bikeraces.domain;

import java.lang.String;
import java.util.Date;

privileged aspect Race_Roo_JavaBean {
    
    public String Race.getName() {
        return this.name;
    }
    
    public void Race.setName(String name) {
        this.name = name;
    }
    
    public Date Race.getRaceDate() {
        return this.raceDate;
    }
    
    public void Race.setRaceDate(Date raceDate) {
        this.raceDate = raceDate;
    }
    
    public String Race.getOrganizer() {
        return this.organizer;
    }
    
    public void Race.setOrganizer(String organizer) {
        this.organizer = organizer;
    }
    
}
