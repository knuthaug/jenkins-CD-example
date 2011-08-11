package no.itera.cd.bikeraces.domain;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

public class RaceTest {

    @Test
    public void aUnitTest() {
        assertEquals(true, true);
    }

    @Test
    public void anotherUnitTest() {
        assertEquals(true, true);
    }

    @Test
    public void mangleOrganizerMangles() {
        Race race = new Race();
        race.setOrganizer("foo");
        race.mangleOrganizer();
        assertEquals(race.getOrganizer(), "oof");
    }

}
