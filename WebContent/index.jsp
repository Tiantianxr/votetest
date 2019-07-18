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
	.con_p{
		margin-top: 15px;
		margin-bottom: 15px;
		font-weight: 700;
		font-size: 20px;
		width: 470px;
		text-align: center;
	}
	.table_tr td {
		width:480px;
		font-size: 20px;
		text-align: center;
		padding: 5px;
	}

	th{
		text-align: center;
		font-size: 20px;
	}
	
</style>
<body>
<div  class="content" >
	<div class="con_p ">请为您喜欢的节目投票</div>
	<table class="table-striped table-hover">
		<tr >
			<th >序号</th>
			<th >节目名称</th>
			<th >操作</th>
		</tr>
	  <!-- 显示全部节目信息，点击节目可以进入投票页面detail.jsp -->
	  <%
	  List<program>list=new programDao().getAllProgram();
	  for(program pro:list)
	  {
	  %>
		<tr class="table_tr">
			<td><%=pro.getId() %></td>
			<td><%=pro.getName() %></td>
			<td><a href="detail.jsp?id=<%=pro.getId() %>"> <button class="btn btn-primary"> 投票 (<%=pro.getScore()%>) </button></a></td>
		</tr>
	  <%
	 }
	%>

	</table>
</div>

</body>

<script language="javascript" type="text/javascript">
    function go() {
        window.location.href="login.jsp?backurl="+window.location.href;
    }
</script>
</html>