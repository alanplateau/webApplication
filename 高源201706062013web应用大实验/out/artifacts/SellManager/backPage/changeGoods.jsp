<%@ page import="java.util.ArrayList" %>
<%@ page import="javaBean.goods" %><%--
  Created by IntelliJ IDEA.
  User: 13345
  Date: 2019/6/14
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改产品信息</title>
</head>
<body>
<%!int index;%>
<% ArrayList<goods> allList = (ArrayList<goods>) session.getAttribute("allList");%>
<% index = Integer.parseInt(request.getParameter("index"));%>
<%--通过下标获得该产品的goods类并赋值给temprary--%>
<%! goods temprary;%>
<%temprary = allList.get(index);%>
<div class="tablewrap">
    <form action="/Saimot_war_exploded/SetGoods" method="post">
        <table>
            <th>产品详细信息</th>
            <tr>
                <%--            产品名不可修改--%>
                <td>产品名</td>
                <td><input type="text" readonly="readonly" value="<%=temprary.getName()%>" name="name" size="30"></td>
            </tr>
            <tr>
                <td>产品价格</td>
                <td><input type="text" value="<%=temprary.getValue()%>" name="value" size="30">￥</td>
            </tr>
            <tr>
                <td>产品分类</td>
                <td>
                    <select name="sort" id="sort">
                        <option value="flower">flower</option>
                        <option value="useful">useful</option>
                        <option value="decoration">decoration</option>
                    </select>
                </td>
            </tr>
            <tr>
<%--                对应分类的图片应该放在相应的位置--%>
                <td>图片名称</td>
                <td><input type="text" value="<%=temprary.getPicture()%>" name="picture" size="30"></td>
            </tr>
            <tr>
                <td>库存数量</td>
                <td><input type="text" value="<%=temprary.getStoreNumber()%>" readonly="readonly" name="number"></td>
            </tr>
            <tr>
                <td>上架状态</td>
                <td>
                    <input type="radio" name="selling" value="1">上架
                    <input type="radio" name="selling" value="0">下架
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="确认"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
