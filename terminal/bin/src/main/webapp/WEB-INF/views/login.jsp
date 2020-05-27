<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>终端大数据营销平台</title>
    <link href="resources/css/main.css" rel="stylesheet">
    <link href="resources/css/plugin/bootstrap_3.3.7/bootstrap.css" rel="stylesheet">
    <link href="resources/css/plugin/bootstrap_3.3.7/bootstrap-theme.css" rel="stylesheet">
  
   <script type="text/javascript" src="resources/js/plugin/jquery-3.3.1.min.js"></script>
  
   <script type="text/javascript" src="resources/js/plugin/bootstrap_3.3.7/bootstrap.min.js"></script>
<!--   <script type="text/javascript" src="resources/js/plugin/bootstrap_3.3.7/npm.js"></script> -->
</head>

<body>
<div class="header"  >
	<div class="row ">
	  <div class="col-md-4" style="border-color: green;">   
			  <ul class=" " style="width: 100%;">
			        <li class="active" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')"><a>首页</a></li>
			        <li ms-click="activeClass(this)"  ms-click-1="skip('scenicMonitor.html')"><a>门店作战地图</a></li>
			    </ul>
	   </div>
	  <div class="col-md-2" style="border-color: red;">
			<ul class=" "   >
		        <li class="logo">
		            <a title="终端大数据营销平台"></a>
		        </li>
		    </ul>
	  </div>
			<div class="col-md-5" style="border-color: green;">
					  <ul class=" ">
					        <li ms-click="activeClass(this)"  ms-click-1="skip('paint.html')"><a>渠道客户画像</a></li>
					         <li ms-click="activeClass(this)"  ms-click-1="skip('paint.html')"><a>关注客户搜索</a></li>
					    </ul>
			</div>
	</div>
</div>



 
<script type="text/javascript">
    function changeFrameHeight() {
        var ifm= document.getElementById("funUrl");
        ifm.height=document.documentElement.clientHeight;
    }
    window.onresize=function(){
        changeFrameHeight();
    }

</script>
  <div>
    <iframe id="funUrl" src="" frameborder="0" border="0" width="100%" onload="changeFrameHeight()"></iframe>
</div>  
</body>

</html>
