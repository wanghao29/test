<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro"  uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="meiyuxiang" tagdir="/WEB-INF/tags" %>
<html>
    <head>
        <title>资源查看列表</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="inc.jsp"/>
  <shiro:hasPermission name="resource:add"> 
            权限操作：<a class="btn btn-danger" role="button" href="${pageContext.request.contextPath}/admin/resource/add.do">添加权限</a>
            </shiro:hasPermission>
            <table class="table table-striped">
                <thead>
                    <tr class="danger">
                        <th>资源标识</th>
                        <th>资源名称</th>
                        <th>资源 permission</th>
                        <th>资源 url</th>
                        <meiyuxiang:hasAnyPermissions name="resource:update">
                        <th>资源操作</th>
                        </meiyuxiang:hasAnyPermissions>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${resourceList}" var="resource">
                        <tr>
                            <td>${resource.id}</td>
                            <td>${resource.name}</td>
                            <td>${resource.permission}</td>
                            <td>${resource.url}</td>
                            <meiyuxiang:hasAnyPermissions name="resource:update">
                            <td>
                            <shiro:hasPermission name="resource:update">
                                <a href="${pageContext.request.contextPath}/admin/resource/${resource.id}.do">修改权限</a>
                                </shiro:hasPermission>
                            </td>
                            </meiyuxiang:hasAnyPermissions>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </body>
</html>
