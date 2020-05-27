<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro"  uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="sharainy" tagdir="/WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
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
<script type="text/javascript">
$(document).ready(function() {
/* 	 $(".module-one li").onmouseout = function (){
		    alert("");
	         $(this).removeClass("active");
	    } */
			 $('li').hover(function() {
		              // 鼠标移入时添加hover类
		              $(this).addClass('active')
		         }, function() {
		              // 鼠标移出时移出hover类
		              $(this).removeClass('active')
		       });
	    
			 $(".password").on("click", ".fa-eye-slash", function () {
				    $(this).removeClass("fa-eye-slash").addClass("fa-eye");
				    $(this).prev().attr("type", "text");
				});
				 
				$(".password").on("click", ".fa-eye", function () {
				    $(this).removeClass("fa-eye").addClass("fa-eye-slash");
				    $(this).prev().attr("type", "password");
				});
});
</script>
<script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery.validate.js"></script>
    <style type="text/css">
			.password{
			    position: relative;
			}
			.password .n-txtCss{
			    width:90% !important;
			}
			.password .fa{
			    position: absolute;
			    right: 10px;
			    top:30px;
			    font-size: 20px;
			    cursor: pointer;
			}
    </style>
<!--     <div class="header">
 
    </div>
    <div style="float: right;">
        
    </div> -->
     <div class="header" style="margin-top: -50px;margin-left: -36px;">
 <%--        <ul>
            <!--<li class="logo">
                <a title="终端大数据营销平台"></a>
            </li>-->
            <li style="float: right;">
		       <div style="float: right">
				     	 欢迎您,【<shiro:principal property="nickname"/>】
				    <a class="btn btn-warning" role="button" href="<%=basePath%>main/logout.do">退出登录</a>
				</div>
            <!--     <a  href="home.do"><img style="vertical-align: middle;margin-right: 5px;" src="resources/images/ico_user.png" >登录</a> -->
            </li>
        </ul> --%>
        
          <div class="options">
               <ul class="nav navbar-nav navbar-right">
			    <!--      <li style="margin-top: 3px;margin-right: 41px;"><a href="#"><span class="glyphicon glyphicon-bell"></span></a></li> -->
			         <li >
			          	<a href="#"  style=" height: 38px;"class="user-head" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > 
			          	<span class="caret" style="margin-top: 2px;margin-left: 27px;"></span>
			        
			          	</a>
			          	<ul class="dropdown-menu">
			          	    <li style="color: #0999ff;"> 欢迎您,【<shiro:principal property="nickname"/>】 </li>
			          	     <shiro:hasPermission name="permission:manager">  <li><a href="<%=basePath%>admin/user/authority.do"><span class="glyphicon glyphicon-lock"></span> 权限管理</a></li></shiro:hasPermission>
						    <li><a href="#" data-toggle="modal" data-target="#passwordModal"><span class="glyphicon glyphicon-pencil"></span> 修改密码</a></li>
						    <li><a href="<%=basePath%>main/logout.do"><span class="glyphicon glyphicon-off"></span> 退出</a></li>
						</ul>
					</li>
			   </ul>
            </div> 
        
    </div>
    <div class="indexbg">
        <div class="clearfix">
            <ul class="index-wrap module-one" style="list-style: none;">
           
                <li>
                
                	 <a id="data_monitor"    href="<%=basePath%>entry/index.do?special=MONITOR"     style="color: #00FFFF;">
	                	<em class="icon-i-two"></em>
	                    <h1>经分监控</h1>
	                    <!-- <p>全方位大数据监控 </p> -->
                    </a>
                         <%--<a id="data_monitor"  href="home.do?special=MONITOR" style="color: #fff;">--%>
                             <%--<em class="icon-i-two"></em>--%>
                             <%--<h4>大数据监控 </h4>--%>
                             <%--<p>全方位大数据监控 </p>--%>
                         <%--</a>--%>
                </li>
            
                
                <li>
               	 <a id="data_model"   href="<%=basePath%>MODEL.do?special=MODEL"   style="color: #00FFFF;">
	                   <em class="icon-i-three"></em>
	                    <h1>产品操盘</h1>
<!-- 	                    <p>产品全生命周期管理 </p> -->
                    </a>
                </li>
                 
          
                      <li onclick="javascript:document.getElementById('channel_plough').click();" ><em class="icon-i-one"></em>
                     <a id="channel_plough"        href="<%=basePath%>CHANNEL.do?special=CHANNEL"  style="color: #00FFFF;">
	                     <h1>渠道深耕</h1>
<!-- 	                     <p>360度客户画像,锁定关注客户</p>
	                     <p>渠道门店地图,辅助营销策略</p> -->
	                 </a>
                </li>
    		  
               
                <li>
               	<%--  <a id="data_model"    href="<%=basePath%>CONSUMER.do?special=CONSUMER"    style="color: #00FFFF;">
	                   <em class="icon-i-four"></em>
	                    <h1>消费者大数据</h1>
<!-- 	                    <p>产品全生命周期管理 </p> -->
                    </a> --%>
                    <a id="data_model"    href="<%=basePath%>xfzzlBigData/index.do?special=CONSUMER"    style="color: #00FFFF;">
	                   <em class="icon-i-four"></em>
	                    <h1>消费者大数据</h1>
<!-- 	                    <p>产品全生命周期管理 </p> -->
                    </a> 
                    
                </li>
               
            </ul>
   
        </div>
    </div>
    
    <!-- 修改密码界面 -->
    		<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true">
    			<form id="modifyPasswordForm" >
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="passwordModalLabel">修改密码</h4>
			            </div>
			            <div class="modal-body">
				            <div class="container-fluid">
								<div class="row-fluid">
									<div class="span12">
										
											  <div class="form-group">
											    <label for="username" >用户名称:</label>
											     <input type="hidden" class="form-control" id="username" name ="username" value="<shiro:principal property="username"/> "    >
											    <input type="text" class="form-control" id="usernameDesc" name ="usernameDesc" value="<shiro:principal property="nickname"/> "  readonly="readonly"  >
											  </div>
											  <div class="form-group">
											    <label for="password">旧密码:</label>
											    <input  class="form-control" id="password" name="password"  type="password" placeholder="请输入旧的密码"">
											  </div>
											  <div class="form-group password">
											      <label for="new_password">新密码:</label>
											      <input id="new_password" name ="new_password"  type="password" class="form-control" placeholder="请输入您的密码" >
    												<i class="fa fa-eye-slash"></i>
											   <!--    <input type="text" class="form-control" id="new_password" name ="new_password" placeholder="Password"> -->
											  </div>
											   <div class="form-group">
											      <label for="confirm_password">确认密码:</label>
											      <input class="form-control" id="confirm_password" name="confirm_password"  type="password" placeholder="请再次输入您的密码">
											   </div>
											  
									
										</div>
								</div>
							</div>
						
						</div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-warning" data-dismiss="modal">关闭</button>
			                <button type="button" class="btn btn-primary"   id="submitBtn">提交更改</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal -->
			    		</form>
											
			</div>
    
    
    
    <div class="footer">
<!--         <p>Copyright©1999-2017  中国移动  版权所有</p>
        <p>中华人民共和国增值电信业务经营许可证      经营许可证编号：A2.B1.B2-20100001</p> -->
    </div>

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
        
        
    
        
        
        

    	jQuery.validator.addMethod("ciphers", function(value, element,params) {
    	    //var length = value.length;
    		var result = true;
    	    var param_value = $(params).val();
    	    if(value == param_value ){
    	    	result = false;
    	    }
    	    return  this.optional(element) || result;
    	}, "新旧密码相同,请重新输入!");  
    	
    	
    	
    	$('#modifyPasswordForm').validate({
    		rules : {
    			username : {
    				required : true
    			},
    			password : {
    				required : true,
    				remote:{
    				    url: basePath +"/main/checkPassword.do",     //后台处理程序
    				    type: "post",               //数据发送方式
    				    async:false, 
    				    dataType: "json",           //接受数据格式   
    				    data: {                     //要传递的数据
    				    	username:$('#username').val(),
    				    	password: function() {
    				            return $("#password").val();
    				        }
    				    }
    				}
    			},
    			new_password : {
    				required : true,
    				ciphers  : "#password"
    			},
    			confirm_password : {
    				required : true,
    				equalTo:"#new_password"
    			}		
    		},
    		messages : {
    			username :{
    				required : "请输入用户名!！"
    			},
    			password : {
    				required : "请输入原密码!！",
    				remote : "原密码错误!"
    			},
    			new_password : {
    				required : "新密码不能为空!",
    				ciphers  : "新旧密码相同,请重新输入!"
    			},
    			confirm_password : {
    				required : "请再次输入新密码！",
    				  equalTo: "两次新密码输入不一致!",
    			}
    		},
            invalidHandler : function(){
                return false;
            },
            submitHandler : function(){
                return false;//阻止表单提交
            },
    	    /**设置验证触发事件 */
    	    focusInvalid: false,
    	    onkeyup  : false,
    	    onclick  : false,
    	    onfocusout : false
    	});
    	
    	
        
    	$("#submitBtn").click(function(){  
    		var validOK = $('#modifyPasswordForm').valid();
    		if(!validOK){
    			return;
    		}else{
    			var data=$('#modifyPasswordForm').formToArray();
    		      $.ajax({
                      type: "post",
                      url: basePath + "/main/modifyPassword.do",
                      data: data,
                      dataType: 'JSON',
                      success: function (data, status) {
                          if (data.success == "success") {
                        	  
                        	  $('#modifyPasswordForm').modal('hide');
                        	  bootbox.alert(data.msg+"新密码为:"+data.new_password +"  请重新登录！" , function(){ 
                        		  
                        		  window.location.href=basePath+"/main/logout.do";
                        		  
                        		  
                        	  });
                         
                        	  
                          }else{
                        	  alert(data.msg);
                          }
                      },
                      error: function () {
                      },
                      complete: function () {

                      }
                  });
    			
    		}
    	});
        
        

    });
    
    
    
    </script>
    
      		
    
    
</body>

</html>
