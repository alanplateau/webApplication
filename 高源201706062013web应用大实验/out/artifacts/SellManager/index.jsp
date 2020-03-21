<%--
  Created by IntelliJ IDEA.
  User: 13345
  Date: 2019/6/9
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javaBean.goods" %>
<%@ page import="javaBean.getGoods" %>
<%@ page import="java.util.ArrayList" %>
<html class="no-js" lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Home</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="icon" href="img/favicon.png" />
  <!-- Place favicon.ico in the root directory -->

  <!-- all css here -->
  <!-- bootstrap.min.css -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- font-awesome.min.css -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- owl.carousel.css -->
  <link rel="stylesheet" href="css/owl.carousel.css">
  <!-- owl.carousel.css -->
  <link rel="stylesheet" href="css/meanmenu.min.css">
  <!-- shortcode/shortcodes.css -->
  <link rel="stylesheet" href="css/shortcode/shortcodes.css">
  <!-- nivo-slider.css -->
  <link rel="stylesheet" href="css/nivo-slider.css">
  <!-- style.css -->
  <link rel="stylesheet" href="style.css">
  <!-- responsive.css -->
  <link rel="stylesheet" href="css/responsive.css">
  <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
<%--输出购买结果--%>
<%
  String mess=(String)session.getAttribute("resultMessage");
  if("".equals(mess)||mess==null){

  }
  else{%>
<script type="text/javascript">
  alert("<%=mess%>");
</script>
<% session.setAttribute("resultMessage", "");}%>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<!-- Add your site or application content here -->
<!-- header -->
<header>
  <!-- header-top-area-start -->
  <div class="header-top-area black-bg ptb-7 hidden-xs">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-4">
          <div class="header-top-left">
            <span><a href="#">Call us toll free:</a>(+1)866-550-3669</span>
          </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-8">
          <div class="header-top-right">
            <ul>
              <li class="slide-toggle"><a href="#"><i class="fa fa-user"></i>
<%--                如果没有信息则显示为未登录--%>
                <% if(session.getAttribute("username")!=null&&session.getAttribute("username")!=""){%>
                <%=session.getAttribute("username")%>
                <%}else{%>
                未登录
                <%}%>
                </a>
                <ul class="show-toggle">
                  <li><a href="frontPage/login.html">register</a></li>
                  <li><a href="frontPage/login.html">login</a></li>
                </ul>
              </li>
            </ul>
            <ul>
              <li class="slide-toggle-2 text-uppercase"><a href="#"><i class="fa fa-address-card"></i></i>
                <% if(session.getAttribute("username")!=null&&session.getAttribute("username")!=""){%>
                <%=session.getAttribute("Rank")%>级会员
                <%}else{%>
                暂无信息
                <%}%>
              </a>
<%--                <ul class="show-toggle-2">--%>
<%--                  <li><a href="#"><i class="fa fa-eur"></i> EUR</a></li>--%>
<%--                  <li><a href="#"><i class="fa fa-gbp"></i> GBP</a></li>--%>
<%--                  <li><a href="#"><i class="fa fa-usd"></i> USD</a></li>--%>
<%--                </ul>--%>
              </li>
            </ul>
            <% if(session.getAttribute("username")!=null&&session.getAttribute("username")!=""){%>
            <ul>
              <li><a href="exitLogin"><i class="fa fa-check"></i> 退出登录</a></li>
            </ul>
            <%}%>
<%--            <ul>--%>
<%--              <li class="slide-toggle-3 text-uppercase"><a href="#">fr-ca</a>--%>
<%--                <ul class="show-toggle-3">--%>
<%--                  <li><a href="#">en-gb</a></li>--%>
<%--                  <li><a href="#">fr-ca</a></li>--%>
<%--                </ul>--%>
<%--              </li>--%>
<%--            </ul>--%>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- header-top-area-end -->
  <!-- header-bottom-area-start -->
  <div class="header-bottom-area bg-color-1 ptb-25">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
          <div class="logo">
            <a href="index.jsp"><img src="img/logo.png" alt="" /></a>
          </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
          <div class="header-bottom-middle">
            <div class="top-search">
              <span class="tex_top_skype"><i class="fa fa-skype"></i>Skype: <span class="">Support.skype</span></span>
              <span class="tex_top_email"><i class="fa fa-envelope"></i>Email: <span class="">demo@towerthemes.com</span></span>
            </div>
            <div class="search-box">
              <form action="#">
                <select name="#" id="select">
                  <option value="">All categories</option>
                  <option value="40">Accessories</option>
                  <option value="41">Clothing</option>
                  <option value="42">-Hoodies</option>
                  <option value="47">-T-shirts</option>
                  <option value="43">Men's</option>
                  <option value="50"> -Hats</option>
                  <option value="44">Music</option>
                  <option value="46">-Singles</option>
                  <option value="49">-Albums</option>
                  <option value="45">Posters</option>
                  <option value="48">Women's</option>
                  <option value="51">-Hats</option>
                  <option value="52">----Shoes</option>
                  <option value="53">----Scarves</option>
                  <option value="54">Jewellery</option>
                  <option value="55">---Rings</option>
                  <option value="56">----Gold Ring</option>
                  <option value="57">----platinum ring</option>
                  <option value="58">----Silver Ring</option>
                  <option value="59">----Diamond rings</option>
                  <option value="60">---Necklaces</option>
                  <option value="61">----Diamond necklaces</option>
                  <option value="62">----Pearl necklaces</option>
                  <option value="63">----Silver necklaces</option>
                  <option value="64">----Statement necklaces</option>
                  <option value="65">Equipments</option>
                  <option value="73">---Accessories</option>
                  <option value="78">----headphone</option>
                  <option value="79">----health</option>
                  <option value="80">----camera</option>
                  <option value="74">---beauty</option>
                  <option value="75">----run</option>
                  <option value="76">----evening</option>
                  <option value="77">----coats</option>
                  <option value="66">Watches</option>
                  <option value="67">Books</option>
                  <option value="68">Sports</option>
                  <option value="69">Gifts</option>
                </select>
                <input type="text" placeholder="Search...">
                <button><i class="fa fa-search"></i></button>
              </form>
            </div>
          </div>
          <div class="header-bottom-right">
            <div class="left-cart">
              <div class="header-compire">
                <a href="#"><i class="fa fa-heart"></i> Wish List 0 </a>
                <a href="#"><i class="fa fa-refresh"></i> Compare  0 </a>
              </div>
            </div>
            <div class="shop-cart-area">
              <div class="top-cart-wrapper">
                <div class="block-cart">
                  <div class="top-cart-title">
                    <a href="#">
                      <span class="title-cart">my cart</span>
                      <span class="count-item">2 items</span>
                      <span class="price">$444.00</span>
                    </a>
                  </div>
                  <div class="top-cart-content">
                    <ol class="mini-products-list">
                      <!-- single item -->
                      <li>
                        <a class="product-image" href="product-details.html">
                          <img alt="" src="img/cart/1.jpg">
                        </a>
                        <div class="product-details">
                          <p class="cartproduct-name">
                            <a href="product-details.html">Pellentesque habitant </a>
                          </p>
                          <strong class="qty">qty:1</strong>
                          <span class="sig-price">$222.00</span>
                        </div>
                        <div class="pro-action">
                          <a class="btn-remove" href="#">remove</a>
                        </div>
                      </li>
                      <!-- single item -->
                      <!-- single item -->
                      <li>
                        <a class="product-image" href="product-details.html">
                          <img alt="" src="img/cart/2.jpg">
                        </a>
                        <div class="product-details">
                          <p class="cartproduct-name">
                            <a href="product-details.html">New catolog</a>
                          </p>
                          <strong class="qty">qty:1</strong>
                          <span class="sig-price">$222.00</span>
                        </div>
                        <div class="pro-action">
                          <a class="btn-remove" href="#">remove</a>
                        </div>
                      </li>
                      <!-- single item -->

                    </ol>
                    <div class="top-subtotal">
                      Subtotal: <span class="sig-price">$444.00</span>
                    </div>
                    <div class="cart-actions">
                      <button><span>Checkout</span></button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- header-bottom-area-end -->
</header>																											<!-- header -->
<!-- mainmenu-area-start -->
<div class="mainmenu-area bg-color-2 hidden-xs hidden-sm">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-3">
        <div class="mainmenu-left visible-lg  visible-md">
          <div class="product-menu-title">
            <h2>所有分类 <i class="fa fa-arrow-circle-down"></i></h2>
          </div>

        </div>
      </div>
      <div class="col-lg-9 col-md-9">
        <div class="mainmenu">
          <nav>
            <ul>
              <li><a href="index.jsp">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Shop</a></li>
              <li><a href="#">Cart</a></li>
              <li><a href="#">Login</a></li>
              <li><a href="/frontPage/login.html">My Account</a></li>
              <li><a href="#">Contact Us</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- mobile-menu-start -->
<div class="mobile-menu-area hidden-md hidden-lg">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="mobile-menu">
          <nav id="mobile-menu">
            <ul>
              <li><a href="index.html">Home</a></li>
              <li><a href="about.html">About</a></li>
              <li><a href="shop.html">Shop</a></li>
              <li><a href="cart.html">Cart</a></li>
              <li><a href="frontPage/login.html">Login</a></li>
              <li><a href="account.html">My Account</a></li>
              <li><a href="contact-us.html">Contact Us</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>

<!---->
<!-- electronic-tab-area-end -->
<!-- all-product-area-start -->
<div class="all-product-area pb-60">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
        <!-- bestseller-area -->
        <%!int count=0;%>
        <% ArrayList<goods> decorationList;%>
        <%! getGoods getList=new getGoods();%>
        <% decorationList=getList.getDecoration();
        count++;
        System.out.println(count);%>
        <div class="bestseller-area dotted-style-2">
          <div class="section-title">
            <h3>装饰品</h3>
          </div>
          <div class="single-product-items-active border-1">
            <div class="single-product-items">
              <% for(int i=0;i<decorationList.size();i++){%>
<%--              用a标签来传递参数--%>
              <%System.out.println(decorationList.get(i).getName()+decorationList.get(i).getStoreNumber());%>
              <a href="frontPage/buyGoods.jsp?name=<%=decorationList.get(i).getName().trim()%>&value=<%=decorationList.get(i).getValue()%>&picture=<%=decorationList.get(i).getPicture().trim()%>&storeNumber=<%=decorationList.get(i).getStoreNumber()%>&sort=<%=decorationList.get(i).getSort()%>">
                <div class="single-product single-product-sidebar white-bg">
                <div class="product-img product-img-left">
                  <img src="img/decoration/<%=decorationList.get(i).getPicture()%>" alt="" />
                </div>
                <div class="product-content product-content-right">
                  <div class="pro-title">
                    <h4><%=decorationList.get(i).getName()%></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star-o"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">￥<%=decorationList.get(i).getValue()%></span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                  </div>
                </div>
              </div>
              </a>
              <%}%>
            </div>
            <div class="single-product-items">
              <div class="single-product single-product-sidebar white-bg">
                <div class="product-img product-img-left">
                  <a href="#"><img src="img/decoration/sakura.jpg" alt="" /></a>
                </div>
                <div class="product-content product-content-right">
                  <div class="pro-title">
                    <h4><a href="product-details.html">木之本樱手办</a></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star-o"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">$300.00</span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="single-product single-product-sidebar white-bg">
                <div class="product-img product-img-left">
                  <a href="#"><img src="img/product/14.jpg" alt="" /></a>
                </div>
                <div class="product-content product-content-right">
                  <div class="pro-title">
                    <h4><a href="product-details.html">Samsung G941BW</a></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">$230.00</span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="single-product single-product-sidebar white-bg">
                <div class="product-img product-img-left">
                  <a href="#"><img src="img/product/13.jpg" alt="" /></a>
                </div>
                <div class="product-content product-content-right">
                  <div class="pro-title">
                    <h4><a href="product-details.html">power banks</a></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">$100.00</span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="single-product single-product-sidebar white-bg">
                <div class="product-img product-img-left">
                  <a href="#"><img src="img/product/3.jpg" alt="" /></a>
                </div>
                <div class="product-content product-content-right">
                  <div class="pro-title">
                    <h4><a href="product-details.html">iPhone</a></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">$201.00</span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="single-product single-product-sidebar white-bg">
                <div class="product-img product-img-left">
                  <a href="#"><img src="img/product/7.jpg" alt="" /></a>
                </div>
                <div class="product-content product-content-right">
                  <div class="pro-title">
                    <h4><a href="product-details.html">MacBook Pro</a></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">$700.00</span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- special-products-area -->
<%--        --%>
        <!-- client-area-start  -->
        <div class="client-area dotted-style-2">
          <div class="section-title">
            <h3>客户评论</h3>
          </div>
          <div class="clinet-active border-1">
            <div class="single-client fix white-bg">
              <div class="client-content">
                <a href="#"><p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. ...</p></a>
              </div>
              <div class="clint-img">
                <div class="client-img-left">
                  <img src="img/client/1.jpg" alt="" />
                </div>
                <div class="client-name">
                  <span>Mr Test</span>
                </div>
              </div>
            </div>
            <div class="single-client fix white-bg">
              <div class="client-content">
                <a href="#"><p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. ...</p></a>
              </div>
              <div class="clint-img">
                <div class="client-img-left">
                  <img src="img/client/2.jpg" alt="" />
                </div>
                <div class="client-name">
                  <span>Mrs Brown</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <!-- feature-product-area -->
        <div class="feature-product-area dotted-style-2">
          <div class="section-title">
            <h3>鲜花</h3>
          </div>
          <%! ArrayList<goods> flowerList;%>
          <%flowerList=getList.getFlower();%>
          <div class="feature-product-active border-1">
            <%for (int i=0;i<flowerList.size();i++){%>
            <div class="single-product  white-bg">
              <a href="frontPage/buyGoods.jsp?name=<%=flowerList.get(i).getName().trim()%>&value=<%=flowerList.get(i).getValue()%>&picture=<%=flowerList.get(i).getPicture().trim()%>&storeNumber=<%=flowerList.get(i).getStoreNumber()%>&sort=<%=flowerList.get(i).getSort()%>">
              <div class="product-img pt-20">
                <img src="img/flower/<%=flowerList.get(i).getPicture()%>" alt="" />
              </div>
              </a>
              <div class="product-content product-i">
                <a href="frontPage/buyGoods.jsp?name=<%=flowerList.get(i).getName().trim()%>&value=<%=flowerList.get(i).getValue()%>&picture=<%=flowerList.get(i).getPicture().trim()%>&storeNumber=<%=flowerList.get(i).getStoreNumber()%>&sort=<%=flowerList.get(i).getSort()%>">
                <div class="pro-title">
                  <h4><%=flowerList.get(i).getName()%></h4>
                </div>
                </a>
                <div class="pro-rating ">
                  <a href="#"><i class="fa fa-star"></i></a>
                  <a href="#"><i class="fa fa-star"></i></a>
                  <a href="#"><i class="fa fa-star"></i></a>
                  <a href="#"><i class="fa fa-star"></i></a>
                  <a href="#"><i class="fa fa-star-o"></i></a>
                </div>
                <div class="price-box">
                  <span class="price product-price">￥<%=flowerList.get(i).getValue()%></span>
                </div>
                <div class="product-icon">
                  <div class="product-icon-left f-left">
                    <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                  </div>
                  <div class="product-icon-right floatright">
                    <a href="#" data-toggle="tooltip" title="Compare"><i class="fa fa-exchange"></i></a>
                    <a href="#" data-toggle="tooltip" title="Wishlist"><i class="fa fa-heart"></i></a>
                  </div>
                </div>
              </div>
              <span class="new">new</span>
            </div>
            <%}%>
<%--            --%>
          </div>
        </div>
        <!-- banner-area -->
        <div class="banner-area ptb-40">
          <div class="slider-single-img res">
            <a href="#">
              <img class="img_a" src="img/banner/1.jpg" alt="" />
              <img class="img_b" src="img/banner/1.jpg" alt="" />
            </a>
          </div>
        </div>
        <!-- new-product-area -->
        <%! ArrayList<goods> usefulList;%>
        <% usefulList=getList.getUseful();%>
        <div class="new-product-area dotted-style-2">
          <div class="section-title">
            <h3>实用类</h3>
          </div>
          <div class="new-product-active border-1">
            <% for(int i=0;i<usefulList.size();i=i+2){%>
            <div class="new-product-items">
              <a href="frontPage/buyGoods.jsp?name=<%=usefulList.get(i).getName().trim()%>&value=<%=usefulList.get(i).getValue()%>&picture=<%=usefulList.get(i).getPicture().trim()%>&storeNumber=<%=usefulList.get(i).getStoreNumber()%>&sort=<%=usefulList.get(i).getSort()%>">
              <div class="single-product  white-bg">
                <div class="product-img pt-20">
                  <img src="img/useful/<%=usefulList.get(i).getPicture()%>" alt="" />
                </div>
                <div class="product-content product-i">
                  <div class="pro-title">
                    <h4><%=usefulList.get(i).getName()%></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star-o"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">￥<%=usefulList.get(i).getValue()%></span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                    <div class="product-icon-right floatright">
                      <a href="#" data-toggle="tooltip" title="Compare"><i class="fa fa-exchange"></i></a>
                      <a href="#" data-toggle="tooltip" title="Wishlist"><i class="fa fa-heart"></i></a>
                    </div>
                  </div>
                </div>
                <span class="new">new</span>
              </div>
              </a>
              <%if(i+1<usefulList.size()){%>
              <a href="frontPage/buyGoods.jsp?name=<%=usefulList.get(i+1).getName().trim()%>&value=<%=usefulList.get(i+1).getValue()%>&picture=<%=usefulList.get(i+1).getPicture().trim()%>&storeNumber=<%=usefulList.get(i+1).getStoreNumber()%>&sort=<%=usefulList.get(i+1).getSort()%>">
              <div class="single-product  white-bg">
                <div class="product-img pt-20">
                  <img src="img/useful/<%=usefulList.get(i+1).getPicture()%>" alt="" />
                </div>
                <div class="product-content product-i">
                  <div class="pro-title">
                    <h4><%=usefulList.get(i+1).getName()%></h4>
                  </div>
                  <div class="pro-rating ">
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star"></i></a>
                    <a href="#"><i class="fa fa-star-o"></i></a>
                  </div>
                  <div class="price-box">
                    <span class="price product-price">￥<%=usefulList.get(i+1).getValue()%></span>
                  </div>
                  <div class="product-icon">
                    <div class="product-icon-left f-left">
                      <a href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                    <div class="product-icon-right floatright">
                      <a href="#" data-toggle="tooltip" title="Compare"><i class="fa fa-exchange"></i></a>
                      <a href="#" data-toggle="tooltip" title="Wishlist"><i class="fa fa-heart"></i></a>
                    </div>
                  </div>
                </div>
              </div>
              </a>
              <%}%>
            </div>
            <%}%>
          </div>
        </div>
        <!-- banner-area-start -->
        <div class="banner-area pt-40">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <div class="slider-single-img res">
                <a href="#">
                  <img class="img_a" src="img/banner/2.jpg" alt="" />
                  <img class="img_b" src="img/banner/2.jpg" alt="" />
                </a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <div class="slider-single-img">
                <a href="#">
                  <img class="img_a" src="img/banner/3.jpg" alt="" />
                  <img class="img_b" src="img/banner/3.jpg" alt="" />
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- all-product-area-end -->
<!-- newletter-area-start -->
<div class="newletter-area ptb-30">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
        <div class="newletter-logo">
          <a href="#"><img src="img/logo.png" alt="" /></a>
        </div>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="subscribe-form">
          <form action="#">
            <input placeholder="Email address..." type="text">
            <button class="subscribe">Subscribe</button>
          </form>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="subscribe-social text-right">
          <a href="#"><i class="fa fa-youtube"></i></a>
          <a href="#"><i class="fa fa-facebook"></i></a>
          <a href="#"><i class="fa fa-google-plus"></i></a>
          <a href="#"><i class="fa fa-twitter"></i></a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- newletter-area-end -->
<%----%>
<div id="social_block">
  <ul>
    <li class="facebook"><a href="#">Facebook</a></li>
    <li class="twitter"><a href="#">twitter</a></li>
    <li class="rss"><a href="#">rss</a></li>
    <li class="youtube"><a href="#">youtube</a></li>
    <li class="google-plus"><a href="#">google plus</a></li>
    <li class="pinterest"><a href="#">pinterest</a></li>
  </ul>
</div>
<!-- social_block-end -->


<!-- all js here -->
<!-- jquery-1.12.0 -->
<script src="js/vendor/jquery-1.12.0.min.js"></script>
<!-- bootstrap.min.js -->
<script src="js/bootstrap.min.js"></script>
<!-- nivo.slider.js -->
<script src="js/jquery.nivo.slider.pack.js"></script>
<!-- jquery-ui.min.js -->
<script src="js/jquery-ui.min.js"></script>
<!-- jquery.magnific-popup.min.js -->
<script src="js/jquery.magnific-popup.min.js"></script>
<!-- jquery.meanmenu.min.js -->
<script src="js/jquery.meanmenu.js"></script>
<!-- jquery.scrollup.min.js-->
<script src="js/jquery.scrollup.min.js"></script>
<!-- owl.carousel.min.js -->
<script src="js/owl.carousel.min.js"></script>
<!-- plugins.js -->
<script src="js/plugins.js"></script>
<!-- main.js -->
<script src="js/main.js"></script>
</body>
</html>
