
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--
작업 순서
1. t_board 테이블에서 전체게시글 조회
2. 조회된 게시물을 하나씩 웹브라우저 출력 
--%>

<%
Connection conn = new ConnectionFactory().getConnection();
StringBuilder sql = new StringBuilder();
sql.append("SELECT ID, NAME , PASSWORD, EMAIL_ID, TEL1,TEL2,TEL3,POST,BASIC_ADDR,DETAIL_ADDR, TYPE, TO_CHAR(reg_date, 'yyyy-mm-dd')as reg_date ");
sql.append(" from T_MEMBER ");
sql.append(" order by ID desc");
PreparedStatement pstmt = conn.prepareStatement(sql.toString());
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
</script>
</head>
<!-- http://localhost9999/Mission-Web/jsp/board/list.jsp -->
<body>

	<div align="center">
		<hr>
		<h1>회원 조회</h1>
		<hr>
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<td width="7%">아이디</td>
				<th width="7%">이름</th>
				<th width="7%">비밀번호</th>
				<th width="7%">이메일 아이디</th>
				<th width="7%">전화번호</th>
				<th width="7%">우편번호</th>
				<th width="20%">기본주소</th>
				<th width="20%">상세주소</th>
				<th width="7%">타입</th>
				<th width="7%">날짜</th>
			</tr>
			<%
			while(rs.next()){
				String ID = rs.getString("ID");
				String NAME = rs.getString("NAME");
				String PASSWORD =rs.getString("PASSWORD");
				String EMAIL_ID =rs.getString("EMAIL_ID");
				String TEL1 = rs.getString("TEL1");
				String TEL2 =rs.getString("TEL2");
				String TEL3 =rs.getString("TEL3");
				String POST =rs.getString("POST");
				String BASIC_ADDR =rs.getString("BASIC_ADDR");
				String DETAIL_ADDR=rs.getString("DETAIL_ADDR");
				String TYPE=rs.getString("TYPE");	
				String reg_date = rs.getString("reg_date");				
			%>
			<tr>
				<td><%=ID %></td>
				<td><%=NAME %></td>
				<td><%=PASSWORD %></td>				
				<td><%=EMAIL_ID %></td>
				<td><%=TEL1 %>-<%=TEL2 %>-<%=TEL3 %></td>
				<td><%=POST %></td>
				<td><%=BASIC_ADDR %></td>
				<td><%=DETAIL_ADDR %></td>
				<td><%=TYPE %></td>
				<td><%=reg_date %></td>
			</tr>
			
			<%
			}
			%>
		</table>
		<br>
		<button id="addBtn">회원 조회</button>	
	
	</div>


</body>
</html>
<%
JDBCClose.close(pstmt, conn);
%>