<%@ page import="javaBean.getCustomer" %>
<%@ page import="javaBean.paied" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 13345
  Date: 2019/6/15
  Time: 1:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户订单基本信息</title>
    <style>
        .set tr td{
            width: 100px;
            text-align: center;
        }
        .title{
            text-align: center;
        }

    </style>
</head>
<body>
<%--获取该客户的全部订单--%>
<% getCustomer getCustomer;%>
<% ArrayList<paied> paiedArrayList;%>
<% getCustomer=new getCustomer();%>
<%String username;%>
<%  request.setCharacterEncoding("UTF-8");
    username=request.getParameter("username");
    System.out.println(username);
   paiedArrayList=getCustomer.getSelectPaied(username);
%>
<table class="set">
    <tr><th class="title"><%=username%>的全部订单</th></tr>
    <tr>
        <th>货物名</th>
        <th>购买数量</th>
        <th>总金额</th>
    </tr>
    <% for(int i=0;i<paiedArrayList.size();i++){%>
    <tr>
        <td><%=paiedArrayList.get(i).getGoodsName()%></td>
        <td><%=paiedArrayList.get(i).getNumber()%></td>
        <td><%=paiedArrayList.get(i).getSumMoney()%></td>
    </tr>
    <%}%>
</table>
</body>
</html>
