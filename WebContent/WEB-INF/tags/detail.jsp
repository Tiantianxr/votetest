<%@page import="com.server.dao.programDao"%>
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
		height: 220px;
		text-align: center;
	}
	.programname{
		font-weight: 700;
		font-size: 20px;
	}
	.btn{
		width: 80px;
		height: 30px;
		margin-top: 20px;
	}
	
</style>

<body>
	<%
	int id=0;
	id=Integer.parseInt(new String(request.getParameter("id").getBytes(
			"ISO-8859-1"), "UTF-8"));
	program pro=new programDao().getOneProgram(id);
	
	%>
	 <jsp:useBean id="program" class="com.server.entity.program" scope="request" >
	 	<jsp:setProperty property="id" name="program" value="<%=pro.getId()%>"/>
	 </jsp:useBean>
	<div class="content">
	<form action="result.jsp" method="get">	
	<div class="programname"><%=pro.getName()%></div>
	<div>表演：<%=pro.getPreformer()%></div>
	<div>类别：<%=pro.getType()%></div>
	<div>选送单位：<%=pro.getDep()%></div>
	<div >
	<div>节目评分：</div>
	<%
	for(int i=1;i<=10;i++){
	%>
	<input type="radio" name="count" value="<%=i %>" /><%=i %>分
	<%} %>
	</div>
	<input type="hidden" value="<%=pro.getId()%>" name="id">
	
	<input class="btn" type="submit" value="打分">
	</form>
	</div>
	
</body>
</html>