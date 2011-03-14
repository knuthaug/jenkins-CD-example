package no.itera.cd.bikeraces.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import no.itera.cd.bikeraces.domain.Race;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RaceDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RaceDataOnDemand: @Component;
    
    private Random RaceDataOnDemand.rnd = new SecureRandom();
    
    private List<Race> RaceDataOnDemand.data;
    
    public Race RaceDataOnDemand.getNewTransientRace(int index) {
        no.itera.cd.bikeraces.domain.Race obj = new no.itera.cd.bikeraces.domain.Race();
        obj.setName("name_" + index);
        obj.setOrganizer("organizer_" + index);
        obj.setRaceDate(new java.util.Date());
        return obj;
    }
    
    public Race RaceDataOnDemand.getSpecificRace(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Race obj = data.get(index);
        return Race.findRace(obj.getId());
    }
    
    public Race RaceDataOnDemand.getRandomRace() {
        init();
        Race obj = data.get(rnd.nextInt(data.size()));
        return Race.findRace(obj.getId());
    }
    
    public boolean RaceDataOnDemand.modifyRace(Race obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void RaceDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = no.itera.cd.bikeraces.domain.Race.findRaceEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Race' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<no.itera.cd.bikeraces.domain.Race>();
        for (int i = 0; i < 10; i++) {
            no.itera.cd.bikeraces.domain.Race obj = getNewTransientRace(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
