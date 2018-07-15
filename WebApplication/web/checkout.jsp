<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="genius.domain.GoodsSingle" %>
<jsp:useBean id="myCart" class="genius.domain.ShoppingCart" scope="session"/>
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<!DOCTYPE html>
<html>
<a href="index.jsp" target="_top" >首页</a>
<%
    ArrayList buyList = myCart.getBuys();
    double total = 0;
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>结算</title>
    </head>
    <body>
    <%if(user.getUsername()!=null)  { %>
    <table>
        <tr height="50">
            <td colspan="3" align="center" ><h3>您的订单信息如下:</h3></td>
        </tr>
        <tr align="center" height="30" bgcolor="lightblue">
            <td>名称</td>
            <td>价格</td>
            <td>数量</td>
        </tr>
        <%
            for(int i = 0; i < buyList.size(); i++){
                GoodsSingle single = (GoodsSingle)buyList.get(i);
                double money = single.getPrice() * single.getNum();
                total += money;
        %>
        <tr align="center" height="50">
            <td><%= single.getName() %></td>
            <td><%= single.getPrice() %></td>
            <td>
                <strong><%= single.getNum()%></strong>
            </td>
        </tr>
        <%
        }
        session.setAttribute("buylist",buyList);
        %>
        <tr height="50">
            <td colspan="3" align="left" ><h4>应付金额：<%= total %></h4></td>
        </tr>
        </table>
        <%getUserInfo.getUserInfo(user.getUsername());%>
        <td><h3>收货人信息:</h3></td>  
        <td>姓名：</td>
        <td><%if(getUserInfo.getFullname()!=null)%><%=getUserInfo.getFullname()%></td><br>
        <td>电话：</td>
        <td><%if(getUserInfo.getPhone()!=null)%><%=getUserInfo.getPhone()%></td><br>
        <td>收货地址：</td>
        <td><%if(getUserInfo.getAddress()!=null)%><%=getUserInfo.getAddress()%></td><br>
        <h3>是否确认提交订单？</h3>
        <a href="/SubmitOrder.jsp">确认</a>
        <a href="/ShowCart.jsp">取消</a>
    <% }else {
            response.sendRedirect("login.jsp");
        }
    %>
    </body>
</html>
