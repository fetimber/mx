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
		<title>加入圈子</title>
		<meta charset="utf-8">
		<meta content="" name="description">
		<meta content="" name="keywords">
		<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
		<meta content="telephone=no, address=no" name="format-detection">
		<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
		<link href="resources/weixin/css/style.css?v=044" rel="stylesheet" />
		<script type="text/javascript">
			function toAccount(){
				window.location.href = "weixin/wechat!myAccount";
			}
		</script>
	</head>
	<body class="bg">
		<img src="resources/images/one.jpg" style="width: 100%;" />
		<img src="resources/images/two.jpg" style="width: 100%;" />
		<img src="resources/images/three.jpg" style="width: 100%;" />
		<img src="resources/images/four.jpg" style="width: 100%;" />
		<div style="margin-bottom: 15px;">
		   &nbsp;
		</div>
	</body>
</html>