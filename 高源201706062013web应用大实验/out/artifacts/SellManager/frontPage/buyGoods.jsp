<%--
  Created by IntelliJ IDEA.
  User: 13345
  Date: 2019/6/14
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <meta name="keywords" content="首页" />
    <meta name="description" content="首页" />
    <link rel="stylesheet" type="text/css" href="../css/normalize.css"/>
    <script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
    <script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var showproduct = {
                "boxid":"showbox",
                "sumid":"showsum",
                "boxw":400,//宽度,该版本中请把宽高填写成一样
                "boxh":400,//高度,该版本中请把宽高填写成一样
                "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
                "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
                "sumi":7,//列表间隔
                "sums":5,//列表显示个数
                "sumsel":"sel",
                "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
                "lastid":"showlast",
                "nextid":"shownext"
            };//参数定义
            $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
        });
    </script>
</head>
<body>
<%
    String name=request.getParameter("name");
    float value=Float.parseFloat(request.getParameter("value"));
    String picture=request.getParameter("picture");
    int storeNumber=Integer.parseInt(request.getParameter("storeNumber"));
    String sort=request.getParameter("sort");
    //将参数存在session中
    session.setAttribute("goodsName",name);
    session.setAttribute("value", value);
    session.setAttribute("picture",picture);
    session.setAttribute("storeNumber",storeNumber);
    session.setAttribute("sort",sort);
%>
<div class="showall">
    <!--left -->
    <div class="showbot">
        <div id="showbox">
            <img src="../img/${sort}/${picture}" width="400" height="400" />
        </div>
    </div>
    <!--conet -->
    <div class="tb-property">
        <div class="tr-nobdr">
            <h3>${goodsName}</h3>
        </div>
        <div class="txt">
            <span class="nowprice">￥<a href="">${value}</a></span>
            <div class="cumulative">
                <span class="number ty1">累计售出<br /><em>370</em></span>
                <span class="number tyu">累计评价<br /><em >25</em></span>
            </div>
        </div>
        <div class="txt-h">
            <span class="tex-o">分类</span>
            <ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
                <li><a title="红色36g" href="">${sort}</a></li>
                <!--<li><a title="红色36g" href="">红色36g</a></li>
                    <li><a title="蓝色16g" href="">红色36g</a></li>-->
            </ul>
        </div>
        <script>
            $(document).ready(function(){
                var t = $("#text_box");
                $('#min').attr('disabled',true);
                $("#add").click(function(){
                    t.val(parseInt(t.val())+1)
                    if (parseInt(t.val())!=1){
                        $('#min').attr('disabled',false);
                    }

                })
                $("#min").click(function(){
                    t.val(parseInt(t.val())-1);
                    if (parseInt(t.val())==1){
                        $('#min').attr('disabled',true);
                    }

                })
            });
        </script>

        <div class="gcIpt">
            <span class="guT">数量</span>
            <input id="min" name="" type="button" value="-" />
            <input id="text_box" name="boughtNumber" type="text" value="1"style="width:30px; text-align: center; color: #0F0F0F;"/>
            <input id="add" name="" type="button" value="+" />
            <span class="Hgt">库存（${storeNumber}）</span>
        </div>
<%--        实现购买button的跳转并传递参数--%>
        <script>
            function checkOut() {
                var boughtNumber=document.getElementById("text_box").value;
                window.location.href="/Saimot_war_exploded/checkOut?boughtnumber="+boughtNumber.toString();
            }
        </script>
        <div class="nobdr-btns">
            <button class="addcart hu" ><img src="../img/shop.png" width="25" height="25"/>加入购物车</button>
            <button class="addcart yh" onclick="checkOut()"><img src="../img/ht.png" width="25" height="25"/>立即购买</button>
        </div>
        <div class="guarantee">
            <span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img src="../img/me.png"/></a></span>
        </div>
    </div>
    <!--right -->
<%--    <div class="extInfo">--%>
<%--        <div class="brand-logo">--%>
<%--            <a href="" title="奥影汽车影音">--%>
<%--                <img src="img/ho_03.png"/>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="seller-pop-box">--%>
<%--            <span class="tr">商家名称：奥影汽车影音奥影汽车影音奥影汽车影音</span>--%>
<%--            <span class="tr">商家等级：初级店铺</span>--%>
<%--            <span class="tr">客家电话：15012365897</span>--%>
<%--            <span class="tr hoh">--%>
<%--            	            		<a title="河南郑州市航海路57号河南郑州市航海路57号" href="">所在地区：河南郑州市航海路57号河南郑州市航海路57号</a>--%>
<%--            	            	</span>--%>
<%--        </div>--%>
<%--        <div class="seller-phone">--%>
<%--            	            	<span class="pop im">--%>
<%--            	            		<a href="" data-name="联系卖家"><img src="img/phon.png"/>联系卖家</a>--%>
<%--            	            	</span>--%>
<%--            <span class="pop in">--%>
<%--            	            		<a href="" data-name="咨询卖家"><img src="img/qq.png"/>咨询卖家</a>--%>
<%--            	            	</span>--%>
<%--            <span class="pop in">--%>
<%--            	            		<a href="" data-name="进店逛逛"><img src="img/shop-line.png"/>进店逛逛</a>--%>
<%--            	            	</span>--%>
<%--            <span class="pop in">--%>
<%--            	            		<a href="" data-name="关注店铺"><img src="img/staar.png"/>关注店铺</a>--%>
<%--            	            	</span>--%>
<%--        </div>--%>
<%--        <div class="jd-service">--%>
<%--            <a href="">--%>
<%--                <img src="img/ho_07.png"/>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="suport-icons">--%>
<%--            <h4>扫一扫<br />手机下单更优惠</h4>--%>
<%--            <img src="img/ho_11.jpg"/>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>

</body>
</html>