package com.asiainfo.cmc.authority.contoller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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

import com.asiainfo.cmc.authority.pojo.Resource;
import com.asiainfo.cmc.authority.pojo.Role;
import com.asiainfo.cmc.authority.pojo.RoleResource;
import com.asiainfo.cmc.authority.service.IResourceService;
import com.asiainfo.cmc.authority.service.IRoleService;
import com.asiainfo.cmc.config.DS;

import net.sf.json.JSONArray;
 

/**
 *@标题RoleController
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
@Controller
@RequestMapping("/admin/role")
public class RoleController {
    private static final Logger logger = LoggerFactory.getLogger(RoleController.class);
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IResourceService resourceService;
    private final String pattern = "authority/";
    /**
     * 跳转到查询所有角色的页面
     * @return
     */
    @RequiresPermissions("role:list")
   @DS("dataSource")@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(Model model){
        List<Role> roleList = roleService.list();
        model.addAttribute("roleList",roleList);
        return pattern+"role/list";
    }

    /**
     * 跳转到添加角色的页面
     * @return
     */
    @RequiresPermissions("role:add")
   @DS("dataSource")@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model){
        // 为了表单回显的须要，要在 Model 里添加一个新对象
        model.addAttribute("role",new Role());
        return pattern+"role/add";
    }

    /**
     * 添加用户角色的后台方法
     * @param role
     * @return
     */
    @RequiresPermissions("role:add")
   @DS("dataSource")@RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Role role){
        logger.debug(role.toString());
        roleService.add(role);
        return "redirect:list.do";
    }

    /**
     * 跳转到更新角色的页面
     * @param id
     * @param model
     * @return
     */
    @RequiresPermissions("role:update")
   @DS("dataSource")@RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer id, Model model){
        Role role = roleService.load(id);
        model.addAttribute("role",role);
        return pattern+"role/update";
    }

    /**
     * 修改角色对象的方法
     * @param role
     * @return
     */
    @RequiresPermissions("role:update")
   @DS("dataSource")@RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    public String update(Role role){
        logger.debug(role.toString());
        roleService.update(role);
        return "redirect:/admin/role/list.do";
    }

   @DS("dataSource")@RequestMapping(value = "/resources/{id}",method = RequestMethod.GET)
    public String listResources(@PathVariable("id") Integer id,Model model){
        /**
         * 查询这个角色拥有的资源集合
         */
/*        List<Resource> hasResourceList = roleService.listRoleResource(id);
        List<Integer> hasResourceIds = new ArrayList<>();
        for(Resource resource:hasResourceList){
            hasResourceIds.add(resource.getId());
        }

        // 查询所有资源列表
        List<Resource> resourceAllList = resourceService.listResource();
        // 查询角色对象
        Role role = roleService.load(id);

        model.addAttribute("hasResourceIds",hasResourceIds);
        model.addAttribute("resourceList",resourceAllList);
        model.addAttribute("role",role);*/
    	  // 查询角色对象
        Role role = roleService.load(id);
    	 model.addAttribute("role",role);
    	
    	
    	
    	
        return pattern+"role/resources";
    }
    
    @ResponseBody
   @DS("dataSource")@RequestMapping(value = "/queryResources/{id}",method = RequestMethod.GET)
    public Map<String,Object> queryResources(@PathVariable("id") Integer id,Model model){
    	Map<String,Object> result =new HashMap<String,Object>();
    	
  	  List<Map<String,Object>> items = new ArrayList<Map<String,Object>>(); 
		
		//存放树节点信息  
		List<Resource> list = resourceService.listResource();
	     // 查询角色对象
      Role role = roleService.load(id);
		//获取角色已有权限
		List<Resource> hasResourceList = roleService.listRoleResource(id);
		Map<String, String> roleMap = new HashMap<String, String>();
        if(hasResourceList!=null&&hasResourceList.size()>0){
        	for (int i = 0; i < hasResourceList.size(); i++) {
        		Resource tempBean = hasResourceList.get(i);
//        		logger.info(""+"roleMap  =   "+tempBean.getModuleId()+"   "+tempBean.getOperId());
        		roleMap.put(String.valueOf(tempBean.getId()), String.valueOf(role.getId()));
			}
        }
        StringBuilder sb = new StringBuilder();
		
   
		for(Resource node:list){			
			Map<String,Object> item = new HashMap<String,Object>();   //最外层，父节点 
			item.put("id", node.getId()==null?"":node.getId());
			item.put("pId", node.getParentCode()==null?"":node.getParentCode());
			item.put("name", node.getName());
			item.put("checked", roleMap.get(String.valueOf(node.getId()))==null?false:true);
			item.put("open", Boolean.TRUE);
			items.add(item);
		}
		JSONArray json = JSONArray.fromObject(items);
		result.put("json", json);
		return result;
    }
    /**
     * 设置用户权限
     * @return
     */
    @ResponseBody
   @DS("dataSource")@RequestMapping(value = "/resource",method = RequestMethod.POST)
    public Map<String,Object> resource(RoleResource roleResource,Integer check){
        logger.debug(roleResource.toString());
        Integer roleId = roleResource.getRoleId();
        Integer resourceId = roleResource.getResourceId();
        Map<String,Object> result = new HashMap<>();
        if(check != null){
            if(check == 0){
                roleService.deleteRoleResource(roleId,resourceId);
            }
            if(check == 1){
                roleService.addRoleResource(roleId,resourceId);
            }
            result.put("success",true);
        }else {
            result.put("success",false);
            result.put("errorInfo","数据修改失败");
        }
        return result;
    }

    /**
     *
     * @param roleIds
     */
    @RequiresPermissions("role:delete")
    @ResponseBody
   @DS("dataSource")@RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Map<String,Object> deleteRole(@RequestParam("roleIds[]") List<Integer> roleIds){
        logger.debug(roleIds.toString());
        for(Integer roleId:roleIds){
            logger.debug(roleId.toString());
        }

        // 先批量删除角色,再从角色资源表中删除角色资源数据
        roleService.deleteRoleAndResource(roleIds);
        // 用户绑定到这个角色上,也应该删除
        roleService.deleteRoleAndUser(roleIds);
        Map<String,Object> result = new HashMap<>();
        result.put("success",true);
        return result;
    }
}
