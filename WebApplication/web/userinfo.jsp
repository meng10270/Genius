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
        <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
        <title>个人中心</title>
    </head>
<script>
		 
		 // -- 本地请求地址（将servlet 请求的 top250 数据另存在本地, 不跨站, 便于本地调试）
		 var url = "userapi.jsp"; //文件请求
		 $.getJSON(url, parse_data);
		 console.log(" get data done ");

		 function parse_data(data){ 
			 		$("#indata1").val(data.username)
					$("#indata2").val(data.password)
			 		$("#indata3").val(data.fullname)
					$("#indata4").val(data.gender)
			 		$("#indata5").val(data.phone)
					$("#indata6").val(data.address)
			 		// 将 JSON 对象转换为字符串进行输出
		 			$("#news tbody").html(JSON.stringify(data));
					
					$("#pdata").html(JSON.stringify(data));
					console.log(data);
					
					// 使用JSON链接改变 a 与 img 
					$("#adata").html(data.name)
					$("#adata").attr("href", data.url)
					
					$("#imgdata").attr("src", data.url)
					
					console.log(" load data done ");
		 			
		 		}
		 		// ); //-使用匿名函数, 需要去掉这里的注释
	</script>
   
    <body>
          <h1><font size="40" color = "orange"> 我的信息</font></h1>
  
        <form action="UserAction?type=3" method="post">
        <% if(user.getUsername()!=null) {%>
      
        
        <td> 用户名：&nbsp; &nbsp;</td>
        <td><input type="text" id="indata1" name="username" size="30" value="<%=user.getUsername()%>" readonly="true"</td><br>
        <td>密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;</td>
        <td><input type="password" id="indata2" name="password" size="30" value="<%=user.getPassword()%>"</td><br>
        <td>姓&nbsp;&nbsp;&nbsp;名：&nbsp;&nbsp;&nbsp;</td>
        <td><input type="text" id="indata3" name="fullname" size="30" value="<%=user.getFullname()%>"</td><br>
        <td>性&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;</td>
        <td><input type="text" id="indata4" name="gender" size="30" value="<%=user.getGender()%>"</td><br>
        <td>电&nbsp;&nbsp;&nbsp;话：&nbsp;&nbsp;&nbsp; </td>
        <td><input type="text" id="indata5" name="phone" size="30" value="<%=user.getPhone()%>"</td><br>
        <td>收货地址：</td>
        <td><input type="text" id="indata5" name="address" size="29" value="<%=user.getAddress()%>"</td><br>
        <input type="submit" value="更新"/>
        </form>
         <tr height="50">
            <td colspan="4" align="left" ><h1> <font size="40" color = "orange"> 我的订单 </font> </h1></td>
        </tr>
        <style>
        table th , table td { border: solid 1px black }
         
    </style>
        <table>
       
        <tr align="center" height="30" bgcolor="yellow">
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
        } else { response.sendRedirect("index.jsp"); }%>
        </table>
    </body>
</html>
