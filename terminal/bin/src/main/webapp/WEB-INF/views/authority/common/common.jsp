<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<br>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.1.0.min.js"></script> --%>
<div style="float: left">
<shiro:hasPermission name="resource:list">
<a class="btn btn-danger" role="button" href="${pageContext.request.contextPath}/admin/resource/list.do">资源管理</a>
</shiro:hasPermission>
<shiro:hasPermission name="role:list">
<a class="btn btn-success" role="button" href="${pageContext.request.contextPath}/admin/role/list.do">角色管理</a>
</shiro:hasPermission>
<shiro:hasPermission name="user:list">
<a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/admin/user/authority.do">用户管理</a>
</shiro:hasPermission>
</div>
<div style="float: right">
    欢迎您,【<shiro:principal property="nickname"/>】
    <a class="btn btn-warning" role="button" href="${pageContext.request.contextPath}/admin/user/list.do">返回首页</a>
</div>
<hr style="clear: both;margin-top: 50px">
<%-- <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/> --%>
