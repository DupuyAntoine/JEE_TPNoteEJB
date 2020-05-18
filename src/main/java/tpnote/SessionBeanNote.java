/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tpnote;

import java.util.Date;
import javax.ejb.Stateful;

/**
 *
 * @author AdminEtu
 */
@Stateful
public class SessionBeanNote implements SessionBeanNoteLocal {

    private String text;
    private Date lastUpdate;

    public SessionBeanNote() {
        this.text = "";
    }

    @Override
    public String getText() {
        return this.text;
    }

    @Override
    public Date getLastUpdate() {
        return this.lastUpdate;
    }

    @Override
    public Date updateDate(Date date) {
        this.lastUpdate = date;
        return this.lastUpdate;
    }

    @Override
    public String updateText(String text) {
        this.text = text;
        return this.text;
    }
}
