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
	.title{
		text-align: center;
		font-size: 20px;
	}
	.con_table{
		margin-left: 30px;
	clear: both;
	width: 457px;
	}
	.con_table td {
		width:100px;
		text-align: center;
		font-size: 18px;
	}

	#myTitle{
			text-align: center;
			font-size: 25px;
			margin: 10px;
	}
	#buttonArea{
		margin: 30px;
		text-align: center;
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
		//更新节目信息
		boolean result=new programDao().updatePro(program);
		if(result)
		    System.out.println(program.getId()+program.getScore());
		%>


<div class="content">
	<div id="myTitle">目前的打分结果</div>

	<table class="con_table table-striped table-hover">
		<tr>
			<th class="title">排名</th>
			<th class="title">节目</th>
			<th class="title">评分</th>
		</tr>
		<!-- 显示目前打分结果-->
		<%
		List<program>list=new programDao().getAllProgram();
		for(program pro:list)
		{
	    %>
		<tr class="table_tr">
			<td><%=pro.getId() %></td>
			<td><%=pro.getName() %></td>
			<td><%=pro.getScore() %></td>
		</tr>
	   <%
	    }
	   %>		
	</table>
	<div id="buttonArea">
		<a href="index.jsp"><button class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> 返回</button> </a>
	</div>
</div>
</body>
</html>