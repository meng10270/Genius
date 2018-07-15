<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="genius.domain.GoodsSingle" %>
<jsp:useBean id="myGoodsList" class="genius.domain.GoodsList" scope="session" />
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <title>购物商城</title>
    </head>
    <body>
        <% if(user.getUsername()!=null) { %>
        <p align='right'>欢迎您，<%=user.getUsername() %>！ <a href="/WebApplication/userinfo.jsp" >个人中心</a> <a href="/WebApplication/ShowCart.jsp">我的购物车</a> <a href="/WebApplication/logout.jsp" target="_top" >退出</a></p> 
        <% }
else  { %>
         <p align='right'>欢迎您，请先登录或注册！<a href="/WebApplication/index.jsp" target="_top" >注册/登录</a></p>
         <% } %>
         <%
        myGoodsList.clearGoods();
        GoodsSingle g1 = new GoodsSingle("鲁滨逊漂流记",39,1);
        GoodsSingle g2 = new GoodsSingle("茶花女",49,1);
        GoodsSingle g3 = new GoodsSingle("java实用手册",109,1);
        GoodsSingle g4 = new GoodsSingle("java script",89,1);
        GoodsSingle g5 = new GoodsSingle("c#",59,1);
        myGoodsList.addGoods(g1);
        myGoodsList.addGoods(g2);
        myGoodsList.addGoods(g3);
        myGoodsList.addGoods(g4);
        myGoodsList.addGoods(g5); 
        ArrayList goodsList = myGoodsList.getGoodList();
%>
    <center>
    <table>
        <tr height="50">
            <td colspan="3" align="center" ><h1>购物商城</h1></td>
        </tr>
         <tr align="center" height="50">
        <%
            for(int i = 0; i < goodsList.size(); i++){

        %>
      
            <td><a href="goodsDetail.jsp?id=<%=i%>"><img src="images/<%=i%>.jpg"  alt=""/></td>
 
       <%}%>
       </tr>
       <tr align="center" height="50">
           <%
            for(int j = 0; j < goodsList.size(); j++){
                GoodsSingle single = (GoodsSingle)goodsList.get(j);
        %>
      
           <td><a href="goodsDetail.jsp?id=<%=j%>"><%= single.getName() %></td>

        <%
            }
        %>
          </tr>
             <tr align="center" height="50">
        <%
            for(int i = 0; i < goodsList.size(); i++){
                GoodsSingle single = (GoodsSingle)goodsList.get(i);
        %>
      
                    <td>￥<%= single.getPrice() %></td>
          <%
            }
        %>
          </tr>
    </table>
        </center>
    </body>
</html>
