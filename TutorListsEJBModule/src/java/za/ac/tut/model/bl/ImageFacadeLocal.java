/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.model.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.model.entity.Image;

/**
 *
 * @author Student
 */
@Local
public interface ImageFacadeLocal {

    void create(Image image);

    void edit(Image image);

    void remove(Image image);

    Image find(Object id);

    List<Image> findAll();

    List<Image> findRange(int[] range);

    int count();
    
}
