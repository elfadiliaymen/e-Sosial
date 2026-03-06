package org.example.esocialsystem;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class CotisationDAO {

   private EntityManager em;

    public CotisationDAO(EntityManager em){
        this.em = em;
    }

    public void save(Cotisation c){
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(c);
            transaction.commit();
        }catch (Exception ex){
            if(transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }

    public Cotisation findById(Long id){
        return em.find(Cotisation.class , id );
    }

    public List<Cotisation> findAll(){
        return em.createQuery("SELECT c from Cotisation c" , Cotisation.class).getResultList();
    }

    public List<Cotisation> findByDeclarationId(Long declarationId) {
        return em.createQuery("SELECT c FROM Cotisation c WHERE c.declaration.id = :declarationId", Cotisation.class)
                .setParameter("declarationId", declarationId)
                .getResultList();
    }

    public double calculateTotalCotisationByDeclarationId(Long declarationId) {
        Double total = em.createQuery("SELECT SUM(c.total_cotisation) FROM Cotisation c WHERE c.declaration.id = :declarationId", Double.class)
                .setParameter("declarationId", declarationId)
                .getSingleResult();
        return total != null ? total : 0.0;
    }

    public long countMonthsByAssureId(Long assureId) {
        Long count = em.createQuery("SELECT COUNT(c) FROM Cotisation c WHERE c.assure.id = :assureId", Long.class)
                .setParameter("assureId", assureId)
                .getSingleResult();
        return count != null ? count : 0;
    }

    public double sumCotisationsByAssureId(Long assureId) {
        Double total = em.createQuery("SELECT SUM(c.total_cotisation) FROM Cotisation c WHERE c.assure.id = :assureId", Double.class)
                .setParameter("assureId", assureId)
                .getSingleResult();
        return total != null ? total : 0.0;
    }

    public void update(Cotisation c){
        EntityTransaction transaction = em.getTransaction();
        try{
            transaction.begin();
            em.merge(c);
            transaction.commit();
        }catch (Exception ex){
            if(transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }

    public void delete(Long id){
        EntityTransaction transaction = em.getTransaction();
        try{
            transaction.begin();
            Cotisation c = em.find(Cotisation.class , id);
            if(c != null){
                em.remove(c);
            }
            transaction.commit();
        }catch (Exception ex){
            if (transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }
}
