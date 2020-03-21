<%--
  Created by IntelliJ IDEA.
  User: 13345
  Date: 2019/6/15
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="javaBean.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>用户基本信息</title>
    <style>
        .container{
            width: 800px;
            margin: 0 auto;
        }
        .single-item{
            float: left;
            width: 400px;
            height: 200px;
        }
        .single-item div{
            float: left;
        }
        .half{
            width: 200px;
            height: 200px;
            line-height: 100px;
            text-align: center;
        }
        .half img{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<% getCustomer getCustomer;%>
<% ArrayList<customer> customerArrayList;%>
<% getCustomer=new getCustomer();%>
<% customerArrayList=getCustomer.getCustomerList();%>
<div class="container">
    <%for(int i=0;i<customerArrayList.size();i++){%>
    <div class="single-item">
        <div class="half"><a href="tradeDetails.jsp?username=<%=customerArrayList.get(i).getUsername().trim()%>"><img src="../img/headimg.jpg" alt=""></a></div>
        <div class="half">
            <a href="tradeDetails.jsp?username=<%=customerArrayList.get(i).getUsername().trim()%>"><em><%=customerArrayList.get(i).getUsername()%></em></a><br>
            <a href="tradeDetails.jsp?username=<%=customerArrayList.get(i).getUsername().trim()%>"><em><%=customerArrayList.get(i).getCreditRank()%>级会员</em></a>
        </div>
    </div>
    <%}%>
</div>

</body>
</html>
