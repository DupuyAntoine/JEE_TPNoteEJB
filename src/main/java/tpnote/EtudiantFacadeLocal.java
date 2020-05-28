/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tpnote;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author AdminEtu
 */
@Local
public interface EtudiantFacadeLocal {

    void create(Etudiant etudiant);

    void edit(Etudiant etudiant);

    void remove(Etudiant etudiant);

    Etudiant find(Object id);

    List<Etudiant> findAll();

    List<Etudiant> findRange(int[] range);

    int count();
    
    Etudiant findByLogin(String login);
    
}
