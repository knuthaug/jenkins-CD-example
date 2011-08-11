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

    @Test
    public void checkShortNameAreUppercased() {
        Race race = new Race();
        race.setName("foo");
        race.doSomethingWithName();
        assertEquals(race.getName(), "OOF");
    }


    @Test
    public void checkLongNameAreLowercased() {
        Race race = new Race();
        race.setName("fooBar");
        race.doSomethingWithName();
        assertEquals(race.getName(), "raboof");
    }

}
