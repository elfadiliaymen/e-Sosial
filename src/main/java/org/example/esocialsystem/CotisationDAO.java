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
