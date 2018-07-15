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
<jsp:useBean id="shoppingCartService" class="genius.service.ShoppingCartService" scope="session" />
<%  ArrayList buyList = myCart.getBuys();
    String action = request.getParameter("action");
        if(action.equals("buy")){
        int id = Integer.parseInt(request.getParameter("id"));
        if(user.getUsername()!=null)
        {
            GoodsSingle one = myGoodsList.findGoods(id);
            myCart.addItem(one);
            response.sendRedirect("goodsDetail.jsp?id="+request.getParameter("id"));
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
    
    shoppingCartService.emptyCart(user.getUsername());
    
    for(int i = 0; i < buyList.size(); i++){
        GoodsSingle single = (GoodsSingle)buyList.get(i);
        shoppingCartService.updateCart(user.getUsername(), single.getName(), Integer.toString(single.getNum()), String.valueOf(single.getPrice()));
    }
%>