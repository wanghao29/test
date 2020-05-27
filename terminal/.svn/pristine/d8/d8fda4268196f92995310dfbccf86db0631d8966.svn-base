<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
    
    String version = (new Date()).getTime();
%>


<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>终端大数据营销平台</title>
    <link href="resources/css/main.css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/plugin/jquery-3.3.1.min.js"></script>
</head>
<script type="text/javascript">
    function getRootPath_web() {
        //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
        var curWwwPath = window.document.location.href;
        //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8083
        var localhostPaht = curWwwPath.substring(0, pos);
        //获取带"/"的项目名，如：/uimcardprj
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
    }

    function skipToIndex() {
        window.location.href = getRootPath_web()+"/page/travel2/index.html";
    }

</script>
<body>
    <div class="header">
        <ul>
            <!--<li class="logo">
                <a title="终端大数据营销平台"></a>
            </li>-->
            <li style="float: right;">
       <div style="float: right">
		    欢迎您,【<shiro:principal property="nickname"/>】
		    <a class="btn btn-warning" role="button" href="<%=basePath%>main/logout">退出登录</a>
		</div>
            <!--     <a  href="home.do"><img style="vertical-align: middle;margin-right: 5px;" src="resources/images/ico_user.png" >登录</a> -->
            </li>
        </ul>
    </div>
    <div style="float: right;">
        
    </div>

    <div class="indexbg">
        <div class="clearfix">
            <ul class="index-wrap module-one" style="list-style: none;">
          
                <li>
                	 <a id="data_monitor"  href="<%=basePath%>entry/index.do?special=MONITOR" style="color: #00FFFF;">
	                	<em class="icon-i-two"></em>
	                    <h1>经分监控 </h1>
	                    <!-- <p>全方位大数据监控 </p> -->
                    </a>
                         <%--<a id="data_monitor"  href="home.do?special=MONITOR" style="color: #fff;">--%>
                             <%--<em class="icon-i-two"></em>--%>
                             <%--<h4>大数据监控 </h4>--%>
                             <%--<p>全方位大数据监控 </p>--%>
                         <%--</a>--%>
                </li>
                <li>
               	 <a id="data_model"  href="<%=basePath%>home.do?special=MODEL" style="color: #00FFFF;">
	                   <em class="icon-i-three"></em>
	                    <h1>操盘模型</h1>
<!-- 	                    <p>产品全生命周期管理 </p> -->
                    </a>
                </li>
                      <li class="active" onclick="javascript:document.getElementById('channel_plough').click();" ><em class="icon-i-one"></em>
                     <a id="channel_plough"  href="<%=basePath%>home.do?special=CHANNEL" style="color: #00FFFF;">
	                     <h1>渠道客户画像</h1>
<!-- 	                     <p>360度客户画像,锁定关注客户</p>
	                     <p>渠道门店地图,辅助营销策略</p> -->
	                 </a>
                </li>
                <li>
               	 <a id="data_model"  href="<%=basePath%>home.do?special=CONSUMER" style="color: #00FFFF;">
	                   <em class="icon-i-four"></em>
	                    <h1>消费者大数据</h1>
<!-- 	                    <p>产品全生命周期管理 </p> -->
                    </a>
                </li>
            </ul>
   
        </div>
    </div>
<!--     <div class="footer">
        <p>Copyright©1999-2017  中国移动  版权所有</p>
        <p>中华人民共和国增值电信业务经营许可证      经营许可证编号：A2.B1.B2-20100001</p>
    </div> -->

    <script type="text/javascript">

    function autoSlider(config){
        var timer = null,slider = config.obj,ul = slider.find('ul'),liw = ul.find('li:first').width(),linum = ul.find('li').length,active=0;
        var moveul = function(){
            slider.find('.spanbox span').eq(active).addClass('active').siblings().removeClass('active');
            ul.css('left',-active*liw + 'px');
        }
        //初始化设置ul容器的宽度,初始位置
        ul.css({width:liw*linum+'px',left:0});

        slider.find('.spanbox').on('click','span',function(){
            active = $(this).index();
            moveul()
        })
        slider.find('.prev2').click(function(){
            active--
            if(active < 0)active=linum-1
            moveul()
        })
        slider.find('.next2').click(function(){
            active++
            if(active > linum-1)active=0
            moveul()
        })
        slider.find('.next2,.prev2,.spanbox').hover(function(){
            clearInterval(timer)
        },function(){
           slider.find('.next2').trigger('click');         
        })
        //定时触发
        timer = setInterval(function(){
            slider.find('.next2').trigger('click')
        },config.time)
    }

    $(function() {
        $('.module-one').on('mouseover', 'li', function() {
            $(this).addClass('active').siblings().removeClass('active')
        })

        autoSlider({obj:$('.slider'),time:3000});


    })
    </script>
</body>

</html>
