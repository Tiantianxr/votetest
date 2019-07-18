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
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>

<style type="text/css">
	.content{
		width: 550px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 100px;
		padding: 10px;
		border:2px #4c55fc solid;
		border-radius: 10px;
		height: 300px;
	}
	.programname{
		text-align: center;
		font-weight: 700;
		font-size: 25px;
	}

	/*
	.btn{
		width: 80px;
		height: 30px;
		margin-top: 20px;
	}*/

	#buttonArea{
		margin-top: 20px;
		text-align: center;
	}

	div{
		padding: 3px;
		font-size: 20px;
	}
	
</style>

<body>
	<%
	int id=0;
	id=Integer.parseInt(new String(request.getParameter("id").getBytes(
			"ISO-8859-1"), "UTF-8"));
	//返回给定id的节目信息
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

		<div id="buttonArea">
			<button class="btn btn-primary"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 打分</button>
		</div>
	</form>
	</div>
	
</body>
</html>