// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.RoomType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RoomType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager RoomType.entityManager;
    
    public static final EntityManager RoomType.entityManager() {
        EntityManager em = new RoomType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long RoomType.countRoomTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM RoomType o", Long.class).getSingleResult();
    }
    
    public static List<RoomType> RoomType.findAllRoomTypes() {
        return entityManager().createQuery("SELECT o FROM RoomType o", RoomType.class).getResultList();
    }
    
    public static RoomType RoomType.findRoomType(Long id) {
        if (id == null) return null;
        return entityManager().find(RoomType.class, id);
    }
    
    public static List<RoomType> RoomType.findRoomTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM RoomType o", RoomType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void RoomType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void RoomType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            RoomType attached = RoomType.findRoomType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void RoomType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void RoomType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public RoomType RoomType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        RoomType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
