<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="program" required="true" %>
<%@ attribute name="count" required="true" %>
<%@ attribute name="scount" required="true" %>
<%@ variable name-given="content"  scope="AT_END" %>

<%!
	String[] program1={"《北城之歌》","《小苹果》","《时间都去哪了》","《自由飞翔》","《白新年》"};
	int[] count1={0,0,0,0,0};
	
	public int getnum(String pro){
		for(int i=0;i<5;i++)
		{
			if(program1[i].equals(pro))
				return i;
		}
		return -1;
	}
%>

<%
	try{
		String[] sscount=scount.split(",");
		for(int i=0;i<5;i++)
			count1[i]=Integer.parseInt(sscount[i]);
		
		application.setAttribute("countnum", count1);
		
		int num=getnum(program);
		count1[num]+=Integer.parseInt(count);
		StringBuffer ss=new StringBuffer();
		
		for(int i=0;i<5;i++)
		{
			ss.append("<tr>");
			ss.append("<td>"+(i+1)+"</td>");
			ss.append("<td>"+program1[i]+"</td>");
			ss.append("<td>"+count1[i]+"</td>");
			ss.append("</tr>");
		}
		
		
		 jspContext.setAttribute("content",new String(ss));
		 
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>