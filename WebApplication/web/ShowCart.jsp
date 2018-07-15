<%@page import="java.awt.HeadlessException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="genius.domain.GoodsSingle" %>
<jsp:useBean id="myCart" class="genius.domain.ShoppingCart" scope="session"/>
<jsp:useBean id="myGoodsList" class="genius.domain.GoodsList" scope="session" />
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<a href="home.jsp" target="_top" >主页</a>
<%  myCart.clearCart();
    ArrayList buyList = myCart.getBuys();
    double total = 0;
    int id=0;
    String sql="select * from cart where userid='"+user.getUsername()+"'";
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=123456ja&useUnicode=true&characterEncoding=UTF8&useSSL=false");
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getString(1).equals("鲁滨逊漂流记"))
                    id=0;
                if(rs.getString(1).equals("茶花女"))
                    id=1;
                if(rs.getString(1).equals("java实用手册"))
                    id=2;
                if(rs.getString(1).equals("java script"))
                    id=3;
                if(rs.getString(1).equals("c#"))
                    id=4;
                GoodsSingle one = myGoodsList.findGoods(id);
                one.setName(rs.getString(1));
                one.setNum(Integer.parseInt(rs.getString(3)));
                myCart.addItem(one);
            } 
            rs.close();
            stmt.close();
            conn.close();
        } catch(HeadlessException | ClassNotFoundException | SQLException e)
        {
            System.out.println(e.getMessage());
        }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/styles.css" type="text/css" rel="stylesheet" />
<title>购物车</title>
</head>
<body>
    <% if(user.getUsername()!=null) { %>
   <tr height="50">
            <td colspan="4" align="left" ><h1><font size="40" color = "orange"> 购物车 </font></h1></td>
        </tr>
    <table>
          <style>
        table  { border: solid 1px orange  }
    </style>
       
        <tr align="center" height="30" bgcolor="yellow">
            <td>名称</td>
            <td>价格</td>
            <td>数量</td>
            <td>清除</td>
        </tr>
        <% if(buyList == null || buyList.size()== 0){ %>
        <tr height="100">
            <td colspan="4" align="center">没有商品可以显示！</td>
        </tr>
        <%
        }else{
            for(int i = 0; i < buyList.size(); i++){
                GoodsSingle single = (GoodsSingle)buyList.get(i);
                float money = single.getPrice() * single.getNum();
                total += money;
        %>
        <tr align="center" height="50">
            <td><%= single.getName() %></td>
            <td><%= single.getPrice() %></td>
            <td>
                <a href="DoCart.jsp?action=reduce_cargoods&id=<%=i%>" >
                    <img src="images/reduce.PNG" width="20" height="20"/></a>
                <strong><%= single.getNum()%></strong>
                <a href="DoCart.jsp?action=add_cargoods&id=<%=i%>">
                    <img src="images/add.PNG" width="20" height="20" onlick=""/>
                </a> 
            </td>
            <td><a href="DoCart.jsp?action=clear_item&id=<%=i%>">移除</a></td>
        </tr>
        <%
            }
        }
        %>
        <tr height="50">
            <td colspan="3" align="left" ><h4>应付金额：<%= total %></h4></td>
            <br>

        </tr>
        <tr align="center" height="50">
            <td align="left" colspan="3"><a href="home.jsp">继续购物</a>
                <a href="DoCart.jsp?action=clear">清空购物车</a>
                <% if(buyList != null && buyList.size()!= 0){%>
                <a href="checkout.jsp">结算</a></td>
        </tr>
    </table>
    <% } }else {
            response.sendRedirect("login.jsp");
        }   
    %>
</body>
</html>