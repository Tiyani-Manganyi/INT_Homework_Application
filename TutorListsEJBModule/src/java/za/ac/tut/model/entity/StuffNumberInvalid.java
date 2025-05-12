package za.ac.tut.model.entity;

import javax.ejb.EJBException;

/**
 *
 * @author Foward
 */
public class StuffNumberInvalid extends EJBException{

    public StuffNumberInvalid(String message) {
        super(message);
    }
    
}
