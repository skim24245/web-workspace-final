<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=23 이렇게 날라옴.데이터베이스 키보드에 가서 해당하는 게시글을 가져와서 화면에 뿌려주면 됌.
%>
<%
Connection conn = new ConnectionFactory().getConnection();
StringBuilder sql = new StringBuilder();
String no = request.getParameter("no");
sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd')as reg_date ");
sql.append("from t_board ");
sql.append("where no = ? ");
PreparedStatement pstmt = conn.prepareStatement(sql.toString());
pstmt.setString(1,no);
pstmt.execute();
ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('#listBtn').click(function(){
		location.href = 'list.jsp'
	})
})
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h1>게시글 상세</h1>
		<hr>
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<td width="7%">번호</td>
				<th>제목</th>
				<th width="16%">내용</th>
				<th width="20%">작성자</th>
				<th width="20%">등록일</th>
				<th width="20%">조회수</th>
			</tr>
			<%
			while(rs.next()){
				int num = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String view_cnt = rs.getString("view_cnt");
				String writer =rs.getString("writer");
				String regDate = rs.getString("reg_date");				
			%>
			<tr>
				<td><%=num %></td>
				<td><%=title %></td>
				<td><%=content%></td>
				<td><%=writer %></td>
				<td><%=regDate %></td>
				<td><%=view_cnt%></td>
			</tr>
			
			<%
			}
			%>
		</table>



<button id="updateBtn">수정</button>	
<button id="deleteBtn">삭제</button>	
<button id="listBtn">목록</button>	


</div>
</body>
</html>