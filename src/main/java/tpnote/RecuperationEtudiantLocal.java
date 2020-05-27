/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tpnote;

import javax.ejb.Local;

/**
 *
 * @author AdminEtu
 */
@Local
public interface RecuperationEtudiantLocal {
    public Etudiant checkIdentity();
}
