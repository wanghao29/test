package com.asiainfo.cmc.authority.contoller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.aopLog.SystemControllerLog;
import com.asiainfo.cmc.authority.pojo.Resource;
import com.asiainfo.cmc.authority.pojo.Role;
import com.asiainfo.cmc.authority.pojo.User;
import com.asiainfo.cmc.authority.service.IRoleService;
import com.asiainfo.cmc.authority.service.IUserService;
import com.asiainfo.cmc.authority.shiro.realm.UserRealm;
import com.asiainfo.cmc.config.DS;

 

/**
 *@标题UserController
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
@Controller
@RequestMapping(value = "/admin/user")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;
    @Autowired
    private UserRealm userRealm;
    
	private final String pattern = "authority/";
    
	@SystemControllerLog(description = "访问首页",module="首页",business="首页",type="INDEX")  
   @DS("dataSource")@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(Model model){
        model.addAttribute("list",userService.list());
    	model.addAttribute("special", "" );
        return "home";
    }
   @DS("dataSource")@RequestMapping(value = "/authority",method = RequestMethod.GET)
    public String authority(Model model){
        model.addAttribute("list",userService.list());
    	model.addAttribute("special", "" );
        return pattern +"user/list";
    }
    
 
    /**
     * 跳转到添加用户的页面
     * @param model
     * @return
     */
    @RequiresPermissions("user:add")
   @DS("dataSource")@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model){
        logger.debug("跳转到添加用户的页面");
        model.addAttribute("user",new User());
        model.addAttribute("roles",roleService.list());
        return pattern +"user/add";
    }

    /**
     * 添加用户保存的方法
     * @param user
     * @param request
     * @return
     */
    @RequiresPermissions("user:add")
   @DS("dataSource")@RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(User user, HttpServletRequest request){
        logger.debug("添加用户 post 方法");
        logger.debug(user.toString());
        List<Integer> roleIdList = new ArrayList<>();
        String[] roldIds = request.getParameterValues("roleId");
        for(String roleId:roldIds){
            roleIdList.add(Integer.parseInt(roleId));
        }
        userService.add(user,roleIdList);
        // 重定向到本 Controller 的 list 方法（Get 方式）
        return "redirect:authority.do";
    }

    @ResponseBody
    @RequiresPermissions("user:update")
  @DS("dataSource")@RequestMapping(value = "/updateStatus",method = RequestMethod.POST)
    public Map<String,Object> updateStatus(User user){
        User u = userService.update(user);
        Map<String,Object> result = new HashMap<>();
        if(u != null){
            result.put("success",true);
        }else {
            result.put("success",false);
            result.put("errorInfo","更新状态失败");
        }
        return result;
    }

    /**
     * 跳转到用户信息更新页面
     * @param id
     * @param model
     * @return
     */
   @DS("dataSource")@RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer id,Model model){
        // 要从数据库查询对象进行回显
        User user = userService.load(id);
        model.addAttribute("user",user);
        // 所有的角色列表
        model.addAttribute("roles",roleService.list());

        /**
         * 根据用户 id 查询用户的所有角色
         */
        List<Role> hasRoles = userService.listUserRole(id);
        /**
         * 将用户的所有角色 id 添加到一个字符串中
         */
        List<Integer> rids = new ArrayList<>();
        for(Role r:hasRoles) {
            rids.add(r.getId());
        }
        // 指定用户拥有的角色信息
        model.addAttribute("hasRole", rids);
        return pattern +"user/update";
    }

    /**
     * 更新用户的信息（包括更新用户绑定的角色）
     * @param user
     * @return
     */
    @RequiresPermissions("user:update")
   @DS("dataSource")@RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    public String update(User user,HttpServletRequest request){
        // // TODO: 2016/9/18 这个过程还是可以优化的，如果属性没有发生变化的地方，是不须要更新的
        logger.debug("user => " + user);
        String[] roleIds = request.getParameterValues("roleId");
        List<Integer> roleIdList = new ArrayList<>();
        for(String roleId:roleIds){
            roleIdList.add(Integer.valueOf(roleId));
        }
        userService.update(user,roleIdList);
        
        
        Cache<Object,AuthenticationInfo> authenticationCache = userRealm.getAuthenticationCache();
        if(authenticationCache !=null ) {
        	authenticationCache.remove(user.getUsername());
        } 
        
        return "redirect:/admin/user/authority.do";
    }

    /**
     *  根据用户 id 跳转到用户权限的列表页面
     * @return
     */
   @DS("dataSource")@RequestMapping(value = "/resources/{id}",method = RequestMethod.GET)
    public String listResources(@PathVariable("id") Integer userId,Model model){
        List<Resource> resourceList = userService.listAllResource(userId);
        User user = userService.load(userId);
        model.addAttribute("resources",resourceList);
        model.addAttribute("user",user);
        return pattern +"user/resources";
    }

    /**
     * 批量删除用户
     * 1、删除用户数据
     * 2、删除用户绑定的角色数据
     * @param userIds
     * @return
     */
    @RequiresPermissions("user:delete")
    @ResponseBody
   @DS("dataSource")@RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Map<String,Object> delete(
            @RequestParam("userIds[]") List<Integer> userIds){
        Map<String,Object> result = new HashMap<>();
        try{
            userService.deleteUserAndRole(userIds);
            result.put("success",true);
        }catch (RuntimeException e){
            e.printStackTrace();
            result.put("success",false);
            result.put("errorInfo",e.getMessage());
        }
        return result;
    }
}
