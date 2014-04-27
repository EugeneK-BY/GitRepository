// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.models;

import com.eugene.hotelproj.models.UserProfile;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserProfile_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager UserProfile.entityManager;
    
    public static final EntityManager UserProfile.entityManager() {
        EntityManager em = new UserProfile().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserProfile.countUserProfiles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM UserProfile o", Long.class).getSingleResult();
    }
    
    public static List<UserProfile> UserProfile.findAllUserProfiles() {
        return entityManager().createQuery("SELECT o FROM UserProfile o", UserProfile.class).getResultList();
    }
    
    public static UserProfile UserProfile.findUserProfile(Long userProfileId) {
        if (userProfileId == null) return null;
        return entityManager().find(UserProfile.class, userProfileId);
    }
    
    public static List<UserProfile> UserProfile.findUserProfileEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM UserProfile o", UserProfile.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void UserProfile.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserProfile.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserProfile attached = UserProfile.findUserProfile(this.userProfileId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserProfile.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserProfile.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public UserProfile UserProfile.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserProfile merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
