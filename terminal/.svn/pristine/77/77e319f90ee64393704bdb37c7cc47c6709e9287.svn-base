package com.asiainfo.cmc.authority.contoller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asiainfo.cmc.authority.pojo.Resource;
import com.asiainfo.cmc.authority.service.IResourceService;
import com.asiainfo.cmc.config.DS;

 

/**
 *@标题ResourceController
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
@RequestMapping("/admin/resource")
@Controller
public class ResourceController {
    private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);
    @Autowired
    private IResourceService resourceService;
    private final String pattern = "authority/";
    /**
     * 返回到列表显示页面
     * @return
     */
    @RequiresPermissions("resource:list")
    @DS("dataSource")@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(Model model){
        // 查询到所有的权限列表
        List<Resource> resourceList = resourceService.listResource();
        model.addAttribute("resourceList",resourceList);
        return pattern+"resource/list";
    }

    /**
     * 跳转到添加权限的页面
     * @return
     */
    @RequiresPermissions(value = "resource:add")
    @DS("dataSource")@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model){
        Resource resource = new Resource();
        model.addAttribute("resource",resource);
        return pattern+"resource/add";
    }

    /**
     * 跳转到添加权限的页面
     * @return
     */
    @RequiresPermissions(value = "resource:add")
   @DS("dataSource")@RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Resource resource){
        logger.debug(resource.toString());
        resourceService.add(resource);
        return  "redirect:list.do";
    }

    /**
     * 跳转到更新权限的页面
     * @param id
     * @return
     */
    @RequiresPermissions(value = "resource:update")
   @DS("dataSource")@RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id")Integer id,Model model){
        Resource resource = resourceService.load(id);
        model.addAttribute("resource",resource);
        return pattern+"resource/update";
    }

    /**
     * 更新权限的方法
     * @param resource
     * @return
     */
    @RequiresPermissions(value = "resource:update")
   @DS("dataSource")@RequestMapping(value = "/{id}",method = RequestMethod.POST)
    public String update(Resource resource){
        logger.debug(resource.toString());
        resourceService.update(resource);
        return "redirect:/admin/resource/list.do";
    }
}
