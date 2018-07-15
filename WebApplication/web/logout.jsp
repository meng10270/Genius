<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% user.userLogout();
         response.sendRedirect("/WebApplication/home.jsp");%>
    </body>
</html>
