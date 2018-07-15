<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.HeadlessException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="genius.domain.GoodsSingle" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="myCart" class="genius.domain.ShoppingCart" scope="session"/>
<jsp:useBean id="myGoodsList" class="genius.domain.GoodsList" scope="session"/>
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<%  ArrayList buyList = myCart.getBuys();
    String action = request.getParameter("action");
        if(action.equals("buy")){
        int id = Integer.parseInt(request.getParameter("id"));
        if(user.getUsername()!=null)
        {
            GoodsSingle one = myGoodsList.findGoods(id);
            myCart.addItem(one);
            response.sendRedirect("home.jsp");
        }
        else
        {
            response.sendRedirect("index.jsp");
        }
    }else if(action.equals("remove_goods")){
        int id = Integer.parseInt(request.getParameter("id"));
        GoodsSingle one = myGoodsList.findGoods(id);
        myGoodsList.removeGoods(one);
        response.sendRedirect("home.jsp");

    }else if(action.equals("reduce_cargoods")){
        int id = Integer.parseInt(request.getParameter("id"));
        GoodsSingle one = myCart.findGoods(id);
        myCart.reduceItem(one);
        response.sendRedirect("ShowCart.jsp");
    }else if(action.equals("add_cargoods")){
        int id = Integer.parseInt(request.getParameter("id"));
        GoodsSingle one = myCart.findGoods(id);
        myCart.addItem(one);
        response.sendRedirect("ShowCart.jsp");
    }else if(action.equals("clear_item")){
        int id = Integer.parseInt(request.getParameter("id"));
        GoodsSingle one = myCart.findGoods(id);
        myCart.removeItem(one);
        response.sendRedirect("ShowCart.jsp");
    }else if(action.equals("clear")){
        myCart.clearCart();
        response.sendRedirect("ShowCart.jsp");
    }else{
        response.sendRedirect("home.jsp");
    }
    
    String sql1="delete from cart where userid='"+user.getUsername()+"'";
    try{ 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=123456ja&useUnicode=true&characterEncoding=UTF8&useSSL=false");
        PreparedStatement stmt1 = conn.prepareStatement(sql1);
        stmt1.executeUpdate();
        conn.close();
        stmt1.close();
       } catch(HeadlessException | ClassNotFoundException | SQLException e)
       {
            System.out.println(e.getMessage());
       }
    for(int i = 0; i < buyList.size(); i++){
        GoodsSingle single = (GoodsSingle)buyList.get(i);
        String sql2="insert into cart set userid='"+user.getUsername()+"',itemname='"+single.getName()+"',quantity='"+single.getNum()+"',singleprice='"+single.getPrice()+"'";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=123456ja&useUnicode=true&characterEncoding=UTF8&useSSL=false");
            PreparedStatement stmt2 = conn.prepareStatement(sql2);
            stmt2.executeUpdate();
            stmt2.close();
            conn.close();
            } catch(HeadlessException | ClassNotFoundException | SQLException e)
            {
                System.out.println(e.getMessage());
            }
    }
%>