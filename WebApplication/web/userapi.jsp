<%@ page language="java" contentType="text/json; charset=UTF-8"
	pageEncoding="UTF-8" import="org.json.*,genius.util.*,genius.domain.*"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="user" class="genius.domain.User" scope="session" />
<%
response.addHeader("Access-Control-Allow-Origin", "*");
JSONObject jo1 = OrgJsonHelper.toJSON(user);
out.println(jo1.toString());
%>
