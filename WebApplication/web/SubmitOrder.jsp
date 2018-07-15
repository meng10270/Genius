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
        String sql="insert into `order` set orderid='"+orderid+"',total='"+total+"',userid='"+session.getAttribute("userid")+"',fullname='"+getUserInfo.getFullname()+"',phone='"+getUserInfo.getPhone()+"',address='"+getUserInfo.getAddress()+"'";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=123456ja&useUnicode=true&characterEncoding=UTF8&useSSL=false");
            PreparedStatement stmt = conn.prepareStatement(sql);
            if(stmt.executeUpdate()==1){
                out.println("订单提交成功！");
                response.setHeader("Refresh", "1;URL=index.jsp");
            }
            else{
                out.println("订单提交失败！");
                response.setHeader("Refresh", "1;URL=index.jsp");
            }
            stmt.close();
            conn.close();
        } catch(HeadlessException | ClassNotFoundException | SQLException e)
        {
            out.println(e.getMessage());
            response.setHeader("Refresh", "1;URL=index.jsp");
        }
        for(int i = 0; i < buylist.size(); i++){
                GoodsSingle single = (GoodsSingle)buylist.get(i);
               String sql1="insert into orderitem set orderid='"+orderid+"',itemname='"+single.getName()+"',quantity='"+single.getNum()+"',singleprice='"+single.getPrice()+"'";
                try{ 
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=123456ja&useUnicode=true&characterEncoding=UTF8&useSSL=false");
                    PreparedStatement stmt = conn.prepareStatement(sql1);
                    stmt.executeUpdate();
                    conn.close();
                    stmt.close();
                   } catch(HeadlessException | ClassNotFoundException | SQLException e)
                  {
                      out.println(e.getMessage());
                  }
        }
        %>
    </body>
</html>
