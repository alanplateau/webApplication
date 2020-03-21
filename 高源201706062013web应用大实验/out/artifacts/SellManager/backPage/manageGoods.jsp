<%@ page import="java.util.ArrayList" %>
<%@ page import="javaBean.goods" %>
<%@ page import="javaBean.getGoods" %><%--
  Created by IntelliJ IDEA.
  User: 13345
  Date: 2019/6/13
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理页面</title>
    <link rel="stylesheet" href="../css/manage.css">
</head>
<body>

<%--显示修改操作成功或失败--%>
<%
    String mess=(String)session.getAttribute("changeMessage");
    if("".equals(mess)||mess==null){

    }
    else{%>
<script type="text/javascript">
    alert("<%=mess%>");
</script>
<% session.setAttribute("chnageMessage", "");}%>

<%!ArrayList<goods> allList;%>
<% getGoods getgoods=new getGoods();%>
<%--获得所有产品的ArrayList，并将其存入session中--%>
<% allList=getgoods.getAll();%>
<% session.setAttribute("allList",allList);%>
<div class="container" id="head">
    <p class="title">全部产品</p>
</div>
<div class="container">
    <div class="wrap">
        <%for(int i=0;i<allList.size();i++){%>
        <div class="single-item">
            <div class="photo-wrap">
                <img src="../img/<%=allList.get(i).getSort().trim()%>/<%=allList.get(i).getPicture().trim()%>" alt="">
            </div>
            <div class="description">
                <em><%=allList.get(i).getName()%></em><em>￥<%=allList.get(i).getValue()%></em><br>
                <em><%=allList.get(i).getSort()%></em><em>库存<%=allList.get(i).getStoreNumber()%>件</em>
                <% if(allList.get(i).isSelling()){%>
                <em>上架中</em>
                <%}else{%>
                <em>未上架</em>
                <%}%>
            </div>
            <div>
<%--                将allList中该产品的下标传递给修改信息页面--%>
                <a href="changeGoods.jsp?index=<%=i%>">
                  <button class="button">
                    修改
                  </button>
                </a>
            </div>
        </div>
        <%}%>
    </div>
</div>
<script>
    function jumpToSelect() {
        window.location.href="/Saimot_war_exploded/backPage/selectTarget.html"
    }
</script>
<style>
    .rightButton{
        position:fixed;
        right: 150px;
        top:200px;
    }
</style>
<div class="rightButton">
    <button class="button" onclick="jumpToSelect()">
        返回选择页面
    </button>
</div>
</body>
</html>
