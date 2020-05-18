<%-- 
    Document   : page2
    Created on : 18 mai 2020, 15:10:14
    Author     : AdminEtu
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="tpnote.SessionBeanNoteLocal"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>

<%
    String text = "";
    String notation = "";
    String maj = "";

    try {
        text = request.getParameter("text");
        SessionBeanNoteLocal note = (SessionBeanNoteLocal)request.getSession().getAttribute("note");
        System.out.println(note.getText());
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
        <title>Page 2</title>
    </head>
    <body>
        <h1>Page 2</h1>
        <form action="page1.jsp" method="post">
            <label for="text">Note : </label>
            <textarea name="text" id="text"><%= notation %></textarea>
            <p><%= maj %></p>
            <div>
                <input type="submit" value="Envoyer">
            </div>
        </form>
        <a href="../index.html">Menu principal</a>
    </body>
</html>
