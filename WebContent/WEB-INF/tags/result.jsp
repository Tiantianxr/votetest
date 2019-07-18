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
		width: 457px;
		height: 200px;
		margin: auto 0;
		text-align: center;
	}
	.title{
		float: left;
		border:1px solid black;
		width: 150px;
	}
	.con_table{
	clear: both;
	width: 457px;
	}
	.con_table td{
		width:100px;
	}
</style>
<body>
<%	
		int score=0;
		score=Integer.parseInt(new String(request.getParameter("count").getBytes(
				"ISO-8859-1"), "UTF-8"));
		int id=0;
		id=Integer.parseInt(new String(request.getParameter("id").getBytes(
				"ISO-8859-1"), "UTF-8"));
		
		%>
		  <jsp:useBean id="program" class="com.server.entity.program" scope="page" >
		  <jsp:setProperty property="score" name="program" value="<%=score%>"/>
		  	<jsp:setProperty property="id" name="program" value="<%=id%>"/>
		  </jsp:useBean>
		  
		<% 
		
		boolean result=new programDao().updatePro(program);
		if(result)
		System.out.println(program.getId()+program.getScore());
		%>


<div class="content">
	<div>目前的打分结果</div>
	<div class="title">排名</div><div class="title" >节目</div><div class="title">评分</div>
	<table class="con_table">	
	<%//显示目前的打分情况
		List<program> list=new programDao().getAllProgram();	
		for(program pro:list){
	%>
		<tr class="table_tr">
			<td><%=pro.getId() %></td>
			<td><%=pro.getName() %></td>
			<td><%=pro.getScore()%></td>
		</tr>
	<%
	}
	//自己编写%>
	</table>
	<a href="index.jsp">返回</a>
</div>
</body>
</html>