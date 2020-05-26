<%-- 
    Document   : page
    Created on : 26 mai 2020, 14:26:12
    Author     : AdminEtu
--%>

<%@page import="java.util.Date"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="tpnote.SessionBeanNoteLocal"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%
    String text = "";
    String notation = "";
    String maj = "";
    String file = request.getParameter("nom");

    try {
        text = request.getParameter("text");
        SessionBeanNoteLocal note = (SessionBeanNoteLocal)request.getSession().getAttribute("note");
        if (note == null) {
            InitialContext ctx = new InitialContext();
            note = (SessionBeanNoteLocal)ctx.lookup(
                "java:global/tpnote/SessionBeanNote!tpnote.SessionBeanNoteLocal"
            );
            request.getSession().setAttribute("note", note);
        }
        if (text != null && !text.equals(note.getText())) {
            note.updateText(text);
            note.updateDate(new Date()).toString();
        }
        notation = note.getText();
        maj = note.getLastUpdate().toString();
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
        <jsp:include page="<%= "../contenu/" + file %>" />
        <form action="../rapide2/page.jsp?nom=<%= file %>" method="post">
            <label for="text">Note : </label>
            <textarea name="text" id="text"><%= notation %></textarea>
            <p><%= maj %></p>
            <div>
                <input type="submit" value="Envoyer">
            </div>
        </form>
    </body>
</html>
