<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>宿舍列表</title>
	<meta charset="utf-8">
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
    <meta content="telephone=no, address=no" name="format-detection">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <link href="resources/weixin/css/reset.css?v=044" rel="stylesheet" />
    <link href="resources/weixin/css/common.css?v=044" rel="stylesheet" />
    <link href="resources/weixin/css/detail3.css?v=044" rel="stylesheet" />
	<link href="resources/weixin/css/style.css?v=044" rel="stylesheet" />
	
	<script>
        var APP = {
            message: false,
            goTop: true,
            urls: {
                glist: "weixin/wechat!houses",
                DetailUrl: "weixin/wechat!recommendPage",
                checkRecordList:"weixin/wechat!offlinePage"
            }
        }
       
    </script>
    <script src="<%=basePath%>/resources/weixin/lib_cmd/sea.js?v=044"></script>
    <script>

        (function(l){
            seajs.config({
                base:"<%=basePath%>/resources/weixin",
                map:[
                    [".js", (l&&l[1]||"")+".js?v=044"]
                ]
            });
            //
            seajs.use("<%=basePath%>resources/weixin/js_cmd/glist2.js?v=044");
        })(location.href.match(/de(\-\d+)bug/));


        function query(){
            var queryRoomCode = $('#roomCode').val();

            if(null != $('#queryRoomCode').val()){
              queryRoomCode =  $('#queryRoomCode').val();
            }
            
            window.location.href = "weixin/wechat!housesPage?buildingno=" +  $('#buildingNo').val() + "&roomCode=" + queryRoomCode;
        }
     
    </script>
  </head>
	<body class="bg">
		<header data-role="header">
		<div data-role="widget" data-widget="slider_3" class="slider_3">
			<section data-role="widget" data-widget="img_prev_view"
				class="widget_wrap">
			<div id="slider_3_wrap" class="slider_3_wrap">
				<ul>
				
				    <s:iterator value="#request.files" var="img" status="st1">
				        <li class="swiper-slide">
						    <a href="weixin/wechat!houseDetail?id=<s:property value="#img.referId" />"> <img width="200px" height="200px" src="<s:property value="#img.filePath" />" data-src="<s:property value="#img.filePath" />" /> </a>
					     </li>
				    </s:iterator>

				</ul>
				<div id="slider_3_indicate" class="slider_3_indicate">
					<!---->
					
				</div>
			</div>
			</section>
		</div>
		</header>
 		<ul class="tab_s">
 		 
			<li id="dyli">
			   <input type="text" name="room.roomCode" id="queryRoomCode" style="width:200px;"/>
<!-- 				<span style="position:relative;">区域&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 				<img src="resources/images/icon_arrow.png" /></span> -->
<!-- 				<ul id="dyul" class="tab_range" style="display: none;"> -->
<!-- 					<li class="sel_a" data-val=""> -->
<!-- 						不限区域 -->
<!-- 					</li> -->
<!-- 					<s:iterator value="#request.areas" var="area" status="st"> -->
<!-- 					    <li data-val="<s:property value='#area.id'/>"> -->
<!-- 						    <s:property value='#area.areaName' /> -->
<!-- 					    </li> -->
<!-- 					</s:iterator> -->
<!-- 				</ul> -->
			</li>
			<li id="xqli" style="float:right;">
			 <input value="查询"  type="button" class="btn_select" onclick="query();"/>
<!-- 				<span style="position:relative; border-right:0!important;">综合排序&nbsp;&nbsp;&nbsp;&nbsp;<img -->
<!-- 						src="resources/images/icon_arrow.png" /> </span> -->
<!-- 				<ul id="xqul" class="tab_range" style="display: none;"> -->
<!-- 					<li class="sel_a" data-val=""> -->
<!-- 						排序不限 -->
<!-- 					</li> -->
<!-- 					<li data-val="maxBro"> -->
<!-- 						成交佣金 -->
<!-- 					</li> -->
<!-- 					<li data-val="soleCount"> -->
<!-- 						成交指数 -->
<!-- 					</li> -->
<!-- 				</ul> -->
			</li>
			<div class="clear"></div>
		</ul>
		<ul id="glist2_ul" class="fl_1_p">
			
		</ul>
		<input type="hidden" id="buildingNo" value="<s:property value="#request.build" />"/>
		<input type="hidden" id="roomCode" value="<s:property value="#request.room" />"/>
	</body>
</html>
