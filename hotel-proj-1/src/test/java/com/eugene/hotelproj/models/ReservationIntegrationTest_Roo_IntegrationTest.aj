// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.Reservation;
import com.eugene.hotelproj.models.ReservationDataOnDemand;
import com.eugene.hotelproj.models.ReservationIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ReservationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ReservationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ReservationIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ReservationIntegrationTest: @Transactional;
    
    @Autowired
    ReservationDataOnDemand ReservationIntegrationTest.dod;
    
    @Test
    public void ReservationIntegrationTest.testCountReservations() {
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", dod.getRandomReservation());
        long count = Reservation.countReservations();
        Assert.assertTrue("Counter for 'Reservation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ReservationIntegrationTest.testFindReservation() {
        Reservation obj = dod.getRandomReservation();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to provide an identifier", id);
        obj = Reservation.findReservation(id);
        Assert.assertNotNull("Find method for 'Reservation' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Reservation' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ReservationIntegrationTest.testFindAllReservations() {
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", dod.getRandomReservation());
        long count = Reservation.countReservations();
        Assert.assertTrue("Too expensive to perform a find all test for 'Reservation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Reservation> result = Reservation.findAllReservations();
        Assert.assertNotNull("Find all method for 'Reservation' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Reservation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ReservationIntegrationTest.testFindReservationEntries() {
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", dod.getRandomReservation());
        long count = Reservation.countReservations();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Reservation> result = Reservation.findReservationEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Reservation' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Reservation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ReservationIntegrationTest.testFlush() {
        Reservation obj = dod.getRandomReservation();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to provide an identifier", id);
        obj = Reservation.findReservation(id);
        Assert.assertNotNull("Find method for 'Reservation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyReservation(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Reservation' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ReservationIntegrationTest.testMergeUpdate() {
        Reservation obj = dod.getRandomReservation();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to provide an identifier", id);
        obj = Reservation.findReservation(id);
        boolean modified =  dod.modifyReservation(obj);
        Integer currentVersion = obj.getVersion();
        Reservation merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Reservation' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ReservationIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", dod.getRandomReservation());
        Reservation obj = dod.getNewTransientReservation(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Reservation' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Reservation' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Reservation' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ReservationIntegrationTest.testRemove() {
        Reservation obj = dod.getRandomReservation();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Reservation' failed to provide an identifier", id);
        obj = Reservation.findReservation(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Reservation' with identifier '" + id + "'", Reservation.findReservation(id));
    }
    
}
