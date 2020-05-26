/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tpnote;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author AdminEtu
 */
@Stateless
public class EtudiantFacade extends AbstractFacade<Etudiant> implements EtudiantFacadeLocal {

    @PersistenceContext(unitName = "tpnotePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EtudiantFacade() {
        super(Etudiant.class);
    }
    
}
