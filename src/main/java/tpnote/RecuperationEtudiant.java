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
    String login;
    String mdp;

    public RecuperationEtudiant() {
    }
    
    public RecuperationEtudiant(String login, String mdp) {
        this.login = login;
        this.mdp = mdp;
    }
    
    @Override
    public Etudiant checkIdentity() {
        List<Etudiant> liste = facade.findAll();
        for (Etudiant e: liste) {
            if (e.getLogin().equals(this.login) && e.getMdp().equals(this.mdp)) {
                this.etudiant = e;
            }
        }
        return this.etudiant;
    }

}
