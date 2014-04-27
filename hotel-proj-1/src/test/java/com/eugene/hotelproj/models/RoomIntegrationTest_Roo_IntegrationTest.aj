// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.Room;
import com.eugene.hotelproj.models.RoomDataOnDemand;
import com.eugene.hotelproj.models.RoomIntegrationTest;
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

privileged aspect RoomIntegrationTest_Roo_IntegrationTest {
    
    declare @type: RoomIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: RoomIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: RoomIntegrationTest: @Transactional;
    
    @Autowired
    RoomDataOnDemand RoomIntegrationTest.dod;
    
    @Test
    public void RoomIntegrationTest.testCountRooms() {
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", dod.getRandomRoom());
        long count = Room.countRooms();
        Assert.assertTrue("Counter for 'Room' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void RoomIntegrationTest.testFindRoom() {
        Room obj = dod.getRandomRoom();
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Room' failed to provide an identifier", id);
        obj = Room.findRoom(id);
        Assert.assertNotNull("Find method for 'Room' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Room' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void RoomIntegrationTest.testFindAllRooms() {
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", dod.getRandomRoom());
        long count = Room.countRooms();
        Assert.assertTrue("Too expensive to perform a find all test for 'Room', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Room> result = Room.findAllRooms();
        Assert.assertNotNull("Find all method for 'Room' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Room' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void RoomIntegrationTest.testFindRoomEntries() {
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", dod.getRandomRoom());
        long count = Room.countRooms();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Room> result = Room.findRoomEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Room' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Room' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void RoomIntegrationTest.testFlush() {
        Room obj = dod.getRandomRoom();
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Room' failed to provide an identifier", id);
        obj = Room.findRoom(id);
        Assert.assertNotNull("Find method for 'Room' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyRoom(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Room' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void RoomIntegrationTest.testMergeUpdate() {
        Room obj = dod.getRandomRoom();
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Room' failed to provide an identifier", id);
        obj = Room.findRoom(id);
        boolean modified =  dod.modifyRoom(obj);
        Integer currentVersion = obj.getVersion();
        Room merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Room' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void RoomIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", dod.getRandomRoom());
        Room obj = dod.getNewTransientRoom(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Room' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Room' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Room' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void RoomIntegrationTest.testRemove() {
        Room obj = dod.getRandomRoom();
        Assert.assertNotNull("Data on demand for 'Room' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Room' failed to provide an identifier", id);
        obj = Room.findRoom(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Room' with identifier '" + id + "'", Room.findRoom(id));
    }
    
}
