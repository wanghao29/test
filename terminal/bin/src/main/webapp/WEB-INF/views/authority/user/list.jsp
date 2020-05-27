<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro"  uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="sharainy" tagdir="/WEB-INF/tags" %>
 
<html>
    <head>
        <title>用户列表</title>
      
    </head>
    <body>
      <style type="text/css">
        .info th{
           background-color: #00194e;
        }
     
        </style>
        <div class="container">
            <jsp:include page="inc.jsp"></jsp:include>
            
            
            <shiro:hasPermission name="user:add"> 
           		 用户操作：
            <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/admin/user/add.do">添加用户</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="user:delete"> 
            <a class="btn btn-primary" role="button" href="#" id="deleteUserBtn" >删除用户</a>
            </shiro:hasPermission>
            
            
            <table class="table table-striped">
                <thead>
                    <tr class="info" style="">
                        <th></th>
                        <th>用户标识</th>
                        <th>用户名</th>
                       <th>角色</th> 
                        <th>用户名称</th>
              <!--           <th>用户状态</th> -->
                        <sharainy:hasAllPermissions name="user:update,user:resources:*">
                        <th>用户操作</th>
                        </sharainy:hasAllPermissions>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="user">
                        <tr>
                            <td><input type="checkbox" class="userId" value="${user.id}"></td>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                        <td>
                        <!--         (密码已经加密,查询无意义) -->
                                ${user.name}
                            </td> 
                            <td>${user.nickname}</td>
        <%--                     <td >
                                【<a class="status" data-id="${user.id}" data-status="${user.status}">启用</a>】
                            </td> --%>
                            <sharainy:hasAllPermissions name="user:update,user:resources:*">
                            <td>
                                <shiro:hasPermission name="user:update">
                                <a href="${pageContext.request.contextPath}/admin/user/update/${user.id}.do">更新用户信息</a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="user:resources:*">
                                <a href="${pageContext.request.contextPath}/admin/user/resources/${user.id}.do">查询用户权限</a>
                                </shiro:hasPermission>
                            </td>
                            </sharainy:hasAllPermissions>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
      
        </div>

        <%-- 不要使用自结束 --%>
  <%--       <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.1.0.min.js"></script> --%>
        <script type="text/javascript">
            $(function(){
                $(".status").each(function(){
                    var status = $(this).attr("data-status");
                    var oper = $(this);
                    if(status == 1){
                        oper.text("禁用");
                    }else {
                        oper.text("启用");
                    }
                });

                $(".status").on("click",function(){
                    var oper = $(this);
                    var user_id = oper.attr("data-id");
                    var user_status = oper.attr("data-status");
                    var update_status = (user_status == 1 ? 0: 1);
                    $.post("${pageContext.request.contextPath}/admin/user/updateStatus.do",
                            {
                                id:user_id,
                                status:update_status
                            },function(data){
                                if(data.success){
                                    alert("修改状态成功！");
                                    var oper_name = (update_status == 1 ? "禁用":"启用");
                                    oper.attr("data-status",update_status);
                                    oper.text(oper_name);
                                }else{
                                    alert("失败");
                                }
                            }
                    );

                });


                // 批量删除
                $("#deleteUserBtn").on("click",function(){
                    var checkedArray =[];
                    $('input[class="userId"]:checked').each(function(){
                        checkedArray.push($(this).val());
                    });

                    if(checkedArray.length==0){
                        alert("您还没有选择要删除的内容!");
                        return;
                    }
                    // 这里也可以使用表单提交的方式删除
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/admin/user/delete.do",
                        dataType:"json",
                        data:{
                            userIds:checkedArray,
                            testData:"testStr"
                        },
                        success:function (data) {
                            if(data.success){
                                alert("数据删除成功!");
                                location.href = "${pageContext.request.contextPath}/admin/user/authority.do";
                            }else {
                                alert(data.errorInfo);
                            }
                        },
                        error:function () {
                            alert("您没有相应的权限删除用户数据,请联系管理员");
                        }

                    });
                });
            })
        </script>
    </body>
</html>
