package no.itera.cd.bikeraces.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import no.itera.cd.bikeraces.domain.Race;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Race_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Race.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Race.id;
    
    @Version
    @Column(name = "version")
    private Integer Race.version;
    
    public Long Race.getId() {
        return this.id;
    }
    
    public void Race.setId(Long id) {
        this.id = id;
    }
    
    public Integer Race.getVersion() {
        return this.version;
    }
    
    public void Race.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Race.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Race.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Race attached = this.entityManager.find(Race.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Race.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Race.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Race merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Race.entityManager() {
        EntityManager em = new Race().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Race.countRaces() {
        return (Long) entityManager().createQuery("select count(o) from Race o").getSingleResult();
    }
    
    public static List<Race> Race.findAllRaces() {
        return entityManager().createQuery("select o from Race o").getResultList();
    }
    
    public static Race Race.findRace(Long id) {
        if (id == null) return null;
        return entityManager().find(Race.class, id);
    }
    
    public static List<Race> Race.findRaceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Race o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
