<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    Map<String, String> b = new HashMap<String,String>();
    b.put("no","3");
    b.put("title","테스트");
    pageContext.setAttribute("board", b);
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
no : <%=b.get("no") %><br>
title : <%=b.get("title") %><br>
<hr>
no : <%=((Map<String,String>)pageContext.getAttribute("board")).get("no") %><BR>
<hr>
no : ${ board.no }<BR>
title: ${board.title } <BR>
aaa : ${board.aaa }<BR>

</body>
</html>