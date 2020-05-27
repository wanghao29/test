package com.asiainfo.cmc.authority.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.aopLog.SystemControllerLog;
import com.asiainfo.cmc.authority.pojo.User;
import com.asiainfo.cmc.authority.service.IUserService;
import com.asiainfo.cmc.authority.shiro.realm.UserRealm;
import com.asiainfo.cmc.authority.util.ShiroKit;
import com.asiainfo.cmc.common.ResultMap;
import com.asiainfo.cmc.config.DS;

 

/**
 *@标题LoginController
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
@RequestMapping(value = "/main")
@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

/*   @DS("dataSource")@RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }*/
    @Autowired
    private IUserService userService;

	
    @SystemControllerLog(description = "登录系统",module="登录",business="登录",type="LOGIN")  
   @DS("dataSource")@RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(User user, Model model){
        String username = user.getUsername();
        String password = user.getPassword();
        logger.debug("username => " + username);
        logger.debug("password => " + password);
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        Subject subject = SecurityUtils.getSubject();
       
        String msg = null;
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            msg = e.getMessage();
        } catch (IncorrectCredentialsException e){
            e.printStackTrace();
            msg = "密码不匹配(用户名和密码的组合不正确)";
        } catch (LockedAccountException e){
            e.printStackTrace();
            msg = e.getMessage();
        }
        if(msg == null){
        
            return "redirect:/admin/user/list.do";
        }

        model.addAttribute("msg",msg);
        return "forward:/";
    }
    
	
	@ResponseBody
   @DS("dataSource")@RequestMapping(value = "/checkPassword",method =  { RequestMethod.GET,RequestMethod.POST })
    public boolean checkPassword( HttpServletRequest request,
			HttpServletResponse response,Model model){
    	  String username = request.getParameter("username");
          String password = request.getParameter("password");
          logger.debug("username => " + username);
          logger.debug("password => " + password);
         // UsernamePasswordToken token = new UsernamePasswordToken(username,password);
         // Subject subject = SecurityUtils.getSubject();
          String msg = null;
          try {
              ///subject.login(token);
        	  User user =  userService.loadByUsername(username);
        	  if(user != null ) {
        		  String dataBaseOldPassword = user.getPassword();
        		  String pageReturnOldPassword =ShiroKit.md5(password.trim(),username.trim());
        		  if(!dataBaseOldPassword.equals(pageReturnOldPassword)){
        	            return false;
        	        }
        	  }else {
        		  return false;
        	  }
        	  
          } catch (UnknownAccountException e) {
              e.printStackTrace();
              msg = e.getMessage();
          } catch (IncorrectCredentialsException e){
              e.printStackTrace();
              msg = "密码不匹配(用户名和密码的组合不正确)";
          } catch (LockedAccountException e){
              e.printStackTrace();
              msg = e.getMessage();
          }
          if(msg == null){
          
              return true;
          }

          model.addAttribute("msg",msg);
        return false;
    } 
	@ResponseBody
	@SystemControllerLog(description = "修改密码",module="权限管理",business="修改密码",type="UPDATE") 
	@DS("dataSource")@RequestMapping(value = "/modifyPassword", method = { RequestMethod.GET,RequestMethod.POST })
	public ResultMap modifyPassword(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		ResultMap m = ResultMap.defaultResultMap();
/*		Map  param = RequestUtils.getParamsMap(request);*/
 
		String username = request.getParameter("username");
		String new_password = request.getParameter("new_password");
		m.put("new_password", new_password);
        User user =  userService.loadByUsername(username);
        user.setPassword(new_password);
        User result = userService.update(user);// 
 	   if (result != null) {
 		  m.put("msg", "密码修改成功!");
	      m.put("success", "success");
 	   } else {
 		  m.put("msg", "密码修改失败!");
 		  m.put("success", "fail");
 	   }
		
		return m;
	}	
    
    
	@SystemControllerLog(description = "登出系统",module="权限管理",business="登出系统",type="LOGOUT") 
   @DS("dataSource")@RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(Model model){
        Subject subject = SecurityUtils.getSubject();
    	User user = (User) SecurityUtils.getSubject().getPrincipal();
		String userId=user.getUsername();//账号
	 
 
        subject.logout();
      //  userRealm.clearCached();
  /*      Cache<Object,AuthenticationInfo> authenticationCache = AuthenticatingRealm.getAuthenticationCache();
        if(authenticationCache !=null ) {
        	authenticationCache.remove(userId);
        } */
        model.addAttribute("msg","您已经退出登录");
        return "redirect:/";
    }

   @DS("dataSource")@RequestMapping(value = "/unAuthorization")
    public String unAuthorization(){
        return "unAuthorization";
    }
}
