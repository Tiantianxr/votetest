<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.server.dao.*"
    import="java.util.List"
    import="com.server.entity.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<style type="text/css">
	.content{
		border:1px solid black;
		width: 470px;
		height: 200px;
		margin: auto 0;
	}
	.con_p{
		font-weight: 700;
		font-size: 20px;
		width: 470px;
		text-align: center;
	}
	.table_tr td{
		width:140px;
		text-align: center;
	}
	
</style>
<body>
<div  class="content" >
	<div class="con_p">请为您喜欢的节目投票</div>
	<table >
	
	<%  //显示节目投票信息
		List<program> list=new programDao().getAllProgram();	
		for(program pro:list){
	%>
		<tr class="table_tr">
			<td><%=pro.getId() %></td>
			<td><%=pro.getName() %></td>
			<td><a href="detail.jsp?id=<%=pro.getId()%>"><%=pro.getScore() %></a></td>
		</tr>
	<%
	}
	//自己编写%>

	</table>
</div>

</body>
</html>