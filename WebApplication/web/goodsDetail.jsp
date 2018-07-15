<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<a href="index.jsp" target="_top" >首页</a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品详情</title>
    </head>
    <body>
        <% if(request.getParameter("id").equals("0")) {%>
        <h1></h1>
        <% }%>
        <%if(request.getParameter("id").equals("1")) {%>
        <h1></h1>
        <% }%>
         <%if(request.getParameter("id").equals("2")) {%>
        <h1></h1>
        <% }%>
        <%if(request.getParameter("id").equals("3")) {%>
        <h1></h1>
        <% }%>
        <%if(request.getParameter("id").equals("4")) {%>
       <h1></h1>
        <% }%>
        <td align="center" colspan="3"><a href="DoCart.jsp?action=buy&id=<%=request.getParameter("id")%>">加入购物车</a></td>
    </body>
</html>
