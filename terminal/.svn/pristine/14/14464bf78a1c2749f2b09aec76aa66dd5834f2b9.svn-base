<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro"  uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="meiyuxiang" tagdir="/WEB-INF/tags" %>
<html>
    <head>
        <title>角色列表查询</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="inc.jsp"/>
         <shiro:hasPermission name="role:add"> 
	               角色操作：<a class="btn btn-success" role="button" href="${pageContext.request.contextPath}/admin/role/add.do">添加角色</a>
	            </shiro:hasPermission>
	            <shiro:hasPermission name="role:add"> 
	            <a id="deleteRoleBtn" class="btn btn-success" role="button">删除角色</a>
            </shiro:hasPermission>
            <table class="table table-striped">
                <thead>
                    <tr class="success">
                        <th></th>
                        <th>角色标识</th>
                        <th>角色名称</th>
                        <th>角色字符串</th>
                        <meiyuxiang:hasAnyPermissions name="role:update,role:resources:*">
                        <th>
                            操作
                        </th>
                        </meiyuxiang:hasAnyPermissions>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${roleList}" var="role">
                        <tr>
                            <td>
                                <input type="checkbox" value="${role.id}" class="roleId"/>
                            </td>
                            <td>${role.id}</td>
                            <td>${role.name}</td>
                            <td>${role.sn}</td>
                            <meiyuxiang:hasAnyPermissions name="role:update,role:resources:*">
                            <td>
                                <shiro:hasPermission name="role:update">
                                <a href="${pageContext.request.contextPath}/admin/role/update/${role.id}.do">更新</a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="role:resources:*">
                                <a href="${pageContext.request.contextPath}/admin/role/resources/${role.id}.do">设置资源</a>
                                </shiro:hasPermission>
                            </td>
                            </meiyuxiang:hasAnyPermissions>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>

<%--         <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.1.0.min.js"></script> --%>
        <script type="text/javascript">
            $(function(){
                $("#deleteRoleBtn").on("click",function(){
                    var checkedArray = [];
                    $("input[class='roleId']:checked").each(function () {
                        checkedArray.push($(this).val());
                    });
                    if(checkedArray.length == 0){
                        alert("请至少选择一个角色");
                    }
//                     $.post("${pageContext.request.contextPath}/admin/role/delete",{
//                         "roleIds":checkedArray
//                     },function (data) {
//                         if(data.success){
//                             alert("删除用户成功!");
//                             location.href="${pageContext.request.contextPath}/admin/role/list";
//                         }
//                     });
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/admin/role/delete.do",
                        dataType:"json",
                        data:{
                        	"roleIds":checkedArray
                        },
                        success:function (data) {
                        	 if(data.success){
                              alert("删除用户成功!");
                              location.href="${pageContext.request.contextPath}/admin/role/list.do";
                          }
                        },
                        error:function () {
                            alert("您没有相应的权限删除用户数据,请联系管理员");
                        }

                    });
                });
            });

        </script>
    </body>
</html>
