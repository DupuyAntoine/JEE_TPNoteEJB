/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tpnote;

import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author AdminEtu
 */
@Stateless
public class RecuperationEtudiant implements RecuperationEtudiantLocal {

    @EJB
    EtudiantFacade facade;
    Etudiant etudiant;

    public RecuperationEtudiant() {
    }
    
    @Override
    public Etudiant checkIdentity(String login, String mdp) {
        List<Etudiant> liste = facade.findAll();
        for (Etudiant e: liste) {
            if (e.getLogin().equals(login) && e.getMdp().equals(mdp)) {
                this.etudiant = e;
            }
        }
        return this.etudiant;
    }
}
