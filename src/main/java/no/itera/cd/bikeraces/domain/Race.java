package no.itera.cd.bikeraces.domain;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.lang.StringBuffer;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Race {

    @NotNull
    private String name;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date raceDate;

    @NotNull
    private String organizer;

    public void mangleOrganizer() {
        organizer = new StringBuffer(organizer).reverse().toString();
    }

}

