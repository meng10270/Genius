<%@page import="java.awt.HeadlessException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="genius.domain.GoodsSingle" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="myCart" class="genius.domain.ShoppingCart" scope="session"/>
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<jsp:useBean id="orderService" class="genius.service.OrderService" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>提交订单</title>
    </head>
    <body>
        <% ArrayList buylist=(ArrayList)session.getAttribute("buylist");
        double total=0;
        String orderid=new Date().getTime()+""+(int)Math.random()*10000;//生成订单号，格式为时间戳加随机数
        for(int i = 0; i < buylist.size(); i++){
                GoodsSingle single = (GoodsSingle)buylist.get(i);
                double money = single.getPrice() * single.getNum();
                total += money;
        }
        
        orderService.submitOrder(orderid, Double.toString(total), user.getUsername(), user.getFullname(), user.getPhone(), user.getAddress());
        out.println("订单提交成功！");
        response.setHeader("Refresh", "1;URL=home.jsp");
            
    
        for(int i = 0; i < buylist.size(); i++){
                GoodsSingle single = (GoodsSingle)buylist.get(i);
                orderService.updateOrderItem(orderid, single.getName(), Integer.toString(single.getNum()), Double.toString(single.getPrice()));
        }
        %>
    </body>
</html>
