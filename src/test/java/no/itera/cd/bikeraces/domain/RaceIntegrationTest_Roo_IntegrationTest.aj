package no.itera.cd.bikeraces.domain;

import no.itera.cd.bikeraces.domain.RaceDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RaceIntegrationTest_Roo_IntegrationTest {
    
    declare @type: RaceIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: RaceIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private RaceDataOnDemand RaceIntegrationTest.dod;
    
    @Test
    public void RaceIntegrationTest.testCountRaces() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        long count = no.itera.cd.bikeraces.domain.Race.countRaces();
        org.junit.Assert.assertTrue("Counter for 'Race' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void RaceIntegrationTest.testFindRace() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        java.lang.Long id = dod.getRandomRace().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to provide an identifier", id);
        no.itera.cd.bikeraces.domain.Race obj = no.itera.cd.bikeraces.domain.Race.findRace(id);
        org.junit.Assert.assertNotNull("Find method for 'Race' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Race' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void RaceIntegrationTest.testFindAllRaces() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        long count = no.itera.cd.bikeraces.domain.Race.countRaces();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Race', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<no.itera.cd.bikeraces.domain.Race> result = no.itera.cd.bikeraces.domain.Race.findAllRaces();
        org.junit.Assert.assertNotNull("Find all method for 'Race' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Race' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void RaceIntegrationTest.testFindRaceEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        long count = no.itera.cd.bikeraces.domain.Race.countRaces();
        if (count > 20) count = 20;
        java.util.List<no.itera.cd.bikeraces.domain.Race> result = no.itera.cd.bikeraces.domain.Race.findRaceEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Race' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Race' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void RaceIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        java.lang.Long id = dod.getRandomRace().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to provide an identifier", id);
        no.itera.cd.bikeraces.domain.Race obj = no.itera.cd.bikeraces.domain.Race.findRace(id);
        org.junit.Assert.assertNotNull("Find method for 'Race' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyRace(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Race' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void RaceIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        java.lang.Long id = dod.getRandomRace().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to provide an identifier", id);
        no.itera.cd.bikeraces.domain.Race obj = no.itera.cd.bikeraces.domain.Race.findRace(id);
        org.junit.Assert.assertNotNull("Find method for 'Race' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyRace(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Race' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void RaceIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        no.itera.cd.bikeraces.domain.Race obj = dod.getNewTransientRace(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Race' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Race' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void RaceIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to initialize correctly", dod.getRandomRace());
        java.lang.Long id = dod.getRandomRace().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Race' failed to provide an identifier", id);
        no.itera.cd.bikeraces.domain.Race obj = no.itera.cd.bikeraces.domain.Race.findRace(id);
        org.junit.Assert.assertNotNull("Find method for 'Race' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Race' with identifier '" + id + "'", no.itera.cd.bikeraces.domain.Race.findRace(id));
    }
    
}
