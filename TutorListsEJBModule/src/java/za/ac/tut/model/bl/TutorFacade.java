/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.model.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import za.ac.tut.model.entity.Tutor;

/**
 *
 * @author Student
 */
@Stateless
public class TutorFacade extends AbstractFacade<Tutor> implements TutorFacadeLocal {

    @PersistenceContext(unitName = "TutorListsEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TutorFacade() {
        super(Tutor.class);
    }
    
     @Override
    public Long getTotalNumber(String gender) {
    Query q=em.createQuery("Select COUNT(t) FROM Tutor t WHERE t.gender =:gender");
    q.setParameter("gender", gender);
    Long totalNumber=(Long)q.getResultList().get(0);
    return totalNumber;
    }

    @Override
    public Double getAvarage(String gender) {
    Query q=em.createQuery("SELECT AVG(t.age) FROM Tutor t WHERE t.gender=:gender");
    q.setParameter("gender", gender);
     Double avarage=(Double)q.getSingleResult();
     return avarage;
    }

    @Override
    public Tutor getYoungestTutor() {
    Query q=em.createQuery("Select t FROM Tutor t WHERE t.age=(SELECT MIN(t.age) FROM Tutor t)");
    Tutor totor=(Tutor)q.getResultList().get(0);
    return totor;
    }
    
}
