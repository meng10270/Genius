<%@page import="java.awt.HeadlessException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<!DOCTYPE html>
<html>
<a href="home.jsp" target="_top" >主页</a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人中心</title>
    </head>
    <body>
        <form action="UserAction?type=3" method="post">
        <% if(user.getUsername()!=null) {%>
        <h1>我的信息</h1>
        <td>用户名：</td>
        <td><input type="text" name="username" size="30" value="<%=user.getUsername()%>" readonly="true"</td><br>
        <td>密码：</td>
        <td><input type="password" name="password" size="30" value="<%=user.getPassword()%>"</td><br>
        <td>姓名：</td>
        <td><input type="text" name="fullname" size="30" value="<%=user.getFullname()%>"</td><br>
        <td>性别：</td>
        <td><input type="text" name="gender" size="30" value="<%=user.getGender()%>"</td><br>
        <td>电话：</td>
        <td><input type="text" name="phone" size="30" value="<%=user.getPhone()%>"</td><br>
        <td>收货地址：</td>
        <td><input type="text" name="address" size="60" value="<%=user.getAddress()%>"</td><br>
        <input type="submit" value="更新"/>
        </form>
        <table>
        <tr height="50">
            <td colspan="3" align="center" ><h1> 我的订单 </h1></td>
        </tr>
        <tr align="center" height="30" bgcolor="lightblue">
         <td>订单号</td>
         <td>订单内容</td>
         <td>总金额</td>
         <td>收货人信息</td>
         </tr>
       <% String sql1="select * from `order` where userid='"+user.getUsername()+"'";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=123456ja&useUnicode=true&characterEncoding=UTF8&useSSL=false");
            PreparedStatement stmt = conn.prepareStatement(sql1);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
        %>
        <tr align="center" height="50">
            <td><%= rs.getString(1) %></td>
            <td>
        <% 
        String sql2="select * from orderitem where orderid='"+rs.getString(1)+"'";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=123456ja&useUnicode=true&characterEncoding=UTF8&useSSL=false");
            PreparedStatement stmt2 = conn2.prepareStatement(sql2);
            ResultSet rs2 = stmt2.executeQuery();
            while(rs2.next())
            {
                out.println(rs2.getString(1)+"*"+rs2.getString(2));
            }
            rs2.close();
            stmt2.close();
            conn2.close();
        }
        catch(HeadlessException | ClassNotFoundException | SQLException e)
        {
            System.out.println(e.getMessage());
        }
       %>   
        </td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(6)+","+rs.getString(4)+","+rs.getString(5)%></td>
        </tr>
       <% }
            rs.close();
            stmt.close();
            conn.close();
        } catch(HeadlessException | ClassNotFoundException | SQLException e)
        {
            System.out.println(e.getMessage());
        }
        } else { response.sendRedirect("login.jsp"); }%>
        </table>
    </body>
</html>
