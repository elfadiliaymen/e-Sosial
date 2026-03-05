package org.example.esocialsystem;

import jakarta.persistence.*;
import java.util.List;


public class EmployeurDAO {


    private EntityManager em;

    public EmployeurDAO(EntityManager em) {
        this.em = em;
    }

    public void save(Employeur e) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(e);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }


    public Employeur findById(Long id) {
        return em.find(Employeur.class, id);
    }


    public List<Employeur> findAll() {
        return em.createQuery("SELECT e FROM Employeur e", Employeur.class).getResultList();
    }


    public void update(Employeur e) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.merge(e);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }

    public void delete(Long id) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Employeur e = em.find(Employeur.class, id);
            if (e != null) {
                em.remove(e);
            }
            transaction.commit();
        } catch (Exception ex) {
            if (transaction.isActive()) transaction.rollback();
            ex.printStackTrace();
        }
    }
}
