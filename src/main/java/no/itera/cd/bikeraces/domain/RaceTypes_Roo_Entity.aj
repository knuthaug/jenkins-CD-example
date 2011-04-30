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
import no.itera.cd.bikeraces.domain.RaceTypes;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RaceTypes_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager RaceTypes.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long RaceTypes.id;
    
    @Version
    @Column(name = "version")
    private Integer RaceTypes.version;
    
    public Long RaceTypes.getId() {
        return this.id;
    }
    
    public void RaceTypes.setId(Long id) {
        this.id = id;
    }
    
    public Integer RaceTypes.getVersion() {
        return this.version;
    }
    
    public void RaceTypes.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void RaceTypes.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void RaceTypes.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            RaceTypes attached = this.entityManager.find(RaceTypes.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void RaceTypes.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void RaceTypes.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        RaceTypes merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager RaceTypes.entityManager() {
        EntityManager em = new RaceTypes().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long RaceTypes.countRaceTypeses() {
        return (Long) entityManager().createQuery("select count(o) from RaceTypes o").getSingleResult();
    }
    
    public static List<RaceTypes> RaceTypes.findAllRaceTypeses() {
        return entityManager().createQuery("select o from RaceTypes o").getResultList();
    }
    
    public static RaceTypes RaceTypes.findRaceTypes(Long id) {
        if (id == null) return null;
        return entityManager().find(RaceTypes.class, id);
    }
    
    public static List<RaceTypes> RaceTypes.findRaceTypesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from RaceTypes o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
