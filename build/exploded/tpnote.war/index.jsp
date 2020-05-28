<%-- 
    Document   : index
    Created on : 28 mai 2020, 14:47:41
    Author     : AdminEtu
--%>

<%@page import="tpnote.Etudiant"%>
<%@page import="tpnote.RecuperationEtudiantLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>

<%
    String prenom = request.getParameter("prenom");
    String nom = request.getParameter("nom");
    try {
        RecuperationEtudiantLocal etudiant = (RecuperationEtudiantLocal)request.getSession().getAttribute("etudiant");
        if (etudiant == null) {
            InitialContext ctx = new InitialContext();
            etudiant = (RecuperationEtudiantLocal)ctx.lookup(
                "java:global/tpnote/RecuperationEtudiant!tpnote.RecuperationEtudiantLocal"
            );
            request.getSession().setAttribute("etudiant", etudiant);
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Accueil</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Menu Principal</h1>
        <h2>Bienvenue <%= prenom + " " + nom %></h2>
        <div>
            <a href="tabetudiant/etudiant.jsp">Liste des étudiants</a>
        </div>
        <div>
            <a href="basique/page1.jsp">Page 1</a>
        </div>
        <div>
            <a href="basique/page2.jsp">Page 2</a>
        </div>
        <div>
            <a href="basique/page3.jsp">Page 3</a>
        </div>
    </body>
</html>
