package org.example.esocialsystem;

import jakarta.persistence.*;

import java.util.List;


public class DeclarationDAO {

  private EntityManager em;

  public DeclarationDAO(EntityManager em){
      this.em = em;
  }


  public void save(Declaration d){
      EntityTransaction transaction = em.getTransaction();
      try{
          transaction.begin();
          em.persist(d);
          transaction.commit();
      }catch (Exception ex) {
          if (transaction.isActive()) transaction.rollback();
          ex.printStackTrace();
      }

  }


  public Declaration findById(Long id){
      return em.find(Declaration.class , id);
  }


  public List<Declaration> findAll(){
      return em.createQuery("SELECT d FROM Declaration d" , Declaration.class).getResultList();

  }


  public void update(Declaration d){
      EntityTransaction transaction = em.getTransaction();

      try{
          transaction.begin();
          em.merge(d);
          transaction.commit();
      }catch (Exception ex) {
          if (transaction.isActive()) transaction.rollback();
          ex.printStackTrace();
      }
  }

  public void delete(Long id){
      EntityTransaction transaction = em.getTransaction();
    try{
    transaction.begin();
    Declaration d = em.find(Declaration.class , id);
    if(d != null){
        em.remove(d);
    }
    transaction.commit();
    }catch (Exception ex){
        if (transaction.isActive()) transaction.rollback();
        ex.printStackTrace();
   }

  }
}
