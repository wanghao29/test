<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>终端大数据营销平台</title>
         <%

   


   

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
 
%>
 <%--        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link href="<%=basePath%>resources/css/main.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap-theme.css" rel="stylesheet">
	<link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap-dialog.css" rel="stylesheet">
        
        <style type="text/css">
.loginTitle{
    text-align: center;
    font-family: 微软雅黑;
}

.col-center-block {
    float: none;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

            
        </style>
    </head>

    <body>
        <div class="container loginbg" style="padding-left: 0px;padding-right: 50px; ">
        <div class="row">
            <div class="col-xs-6 col-md-4 col-center-block">
	              <form class="form-horizontal" role="form" method="post" action="<%=basePath%>main/login.do">
	                <div class="form-group">
	                    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
	                    <div class="col-sm-10">
	                        <input type="text" class="form-control" id="inputEmail3" placeholder="请输入用户名" name="username">
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
	                    <div class="col-sm-10">
	                        <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
	                    </div>
	                </div>
	               <div class="form-group">
	                    <div class="col-sm-offset-2 col-sm-5">
	                        <div class="checkbox">
	                            <label>
	                                <input type="checkbox"> 记住账号
	                            </label>
	                        </div>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <div class="col-sm-offset-2 col-sm-10">
	                        <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
	                    </div>
	                </div>
	            </form>
            </div>
  
        </div>
     
           <div class="row" style="text-align: center;" > <h4 style="color: red;">本平台需使用GOOGLE浏览器登录使用</h4></div>
 <div class="row">
            <span class="label label-danger col-center-block ">${msg}</span>
            <span class="label label-danger col-center-block ">${param.ip}</span>
            <span class="label label-danger col-center-block "><c:if test="${not empty param.kickout}">您的账号在ip:${param.ip}设备上登录,您被踢出登录。</c:if></span>
            
</div>
            <br><br>

     <!--        <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">测试账号</h3>
                </div>
                <div class="panel-body">

                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>权限说明</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>admin</td>
                                <td>123456</td>
                                <td>超级管理员,可以执行任何操作</td>
                            </tr>

                            <tr>
                                <td>dev</td>
                                <td>123456</td>
                                <td>开发人员,可以操作角色和资源,有用户查看权限,无删除权限</td>
                            </tr>

                            <tr>
                                <td>test</td>
                                <td>123456</td>
                                <td>测试人员,比开发人员多了删除权限</td>
                            </tr>

                            <tr>
                                <td>guest</td>
                                <td>123456</td>
                                <td>游客,只有查看权限</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div> -->
        </div>
    </body>
    <script type="text/javascript">
        function kickout(){
            var href=location.href;
            if(href.indexOf("kickout")>0){
                alert("您的账号在另一台设备上登录，您被挤下线，若不是您本人操作，请立即修改密码！");
            }
        }
        window.onload=kickout();
    </script>
</html>
