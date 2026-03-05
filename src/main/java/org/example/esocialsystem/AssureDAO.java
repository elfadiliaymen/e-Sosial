package org.example.esocialsystem;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class AssureDAO {


    private EntityManager em;

    public AssureDAO(EntityManager em){
        this.em = em;
    }

    public void save(Assure a){
        EntityTransaction transaction = em.getTransaction();
        try{
    transaction.begin();
    em.persist(a);
    transaction.commit();
} catch (Exception ex) {
            if (transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }

    public Assure findById(Long id){
        return em.find(Assure.class , id );
    }

    public List<Assure> findAll(){
        return em.createQuery("SELECT a FROM Assure a", Assure.class).getResultList();
    }


    public void update(Assure a) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.merge(a);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }


    public void delete(Long id ){
        EntityTransaction transaction = em.getTransaction();

        try{
            transaction.begin();
            Assure a = em.find(Assure.class , id);
            if(a != null){
                em.remove(a);
            }
            transaction.commit();
        } catch (Exception ex){
            if (transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }

}
