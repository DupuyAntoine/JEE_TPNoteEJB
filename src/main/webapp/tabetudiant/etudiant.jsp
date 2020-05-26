<%-- 
    Document   : etudiant
    Created on : 26 mai 2020, 17:26:56
    Author     : AdminEtu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="tpnote.EtudiantFacadeLocal"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="tpnote.Etudiant"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%
    List<Etudiant> etus = new ArrayList<Etudiant>();
    try {
        EtudiantFacadeLocal facade = (EtudiantFacadeLocal)request.getSession().getAttribute("etudiant");
        if (facade == null) {
            InitialContext ctx = new InitialContext();
            facade = (EtudiantFacadeLocal)ctx.lookup(
                "java:global/tpnote/EtudiantFacade!tpnote.EtudiantFacadeLocal"
            );
            request.getSession().setAttribute("facade", facade);
        }
        etus = facade.findAll();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tableau des étudiants enregistrés</h1>
        <% for (Etudiant e: etus) { %>
                <p><%= e.getNom() + " " + e.getPrenom() %></p>
        <% } %>
    </body>
</html>
