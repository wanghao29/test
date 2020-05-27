package com.asiainfo.cmc.qudao.controller.storeBattleMap;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.service.ICustomerChannelService;
import com.asiainfo.cmc.qudao.vo.StoreBattleVo;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.util.StringUtil;

@Controller
@RequestMapping({"/storeBattleMap"})
public class storeBattleMapController
{
  private static final Logger logger = LoggerFactory.getLogger(storeBattleMapController.class);
  @Resource
  private ICustomerChannelService customerChannelService;
  @Value("${bdMapUrl}")
  private String bdMapUrl;
  
  @DS("dataSource")
  @RequestMapping(value={"/index"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String home(Locale locale, Model model)
  {
    logger.info("customerChannel  {}.", locale);
    model.addAttribute("bdMapUrl", this.bdMapUrl);
    return "storeBattleMap/store_battle_map";
  }
  
  @DS("dataSource")
  @RequestMapping(value={"/listHallOfCustomer"}, method={org.springframework.web.bind.annotation.RequestMethod.GET, org.springframework.web.bind.annotation.RequestMethod.POST})
  @ResponseBody
  public Map<String, Object> listHallAndGetOneHall(@RequestBody StoreBattleVo vo)
  {
    ServletRequestAttributes attrs = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
    HttpSession session = attrs.getRequest().getSession();
    if (vo.getTag1().equals("全省")) {
      vo.setTag1("");
    }
    if ((vo.getIds() != null) && (vo.getIds().size() > 0))
    {
      session.setAttribute("channelSelectdIds", vo.getIds());
    }
    else
    {
      List<Integer> channelSelectdIds = (List)session.getAttribute("channelSelectdIds");
      vo.setIds(channelSelectdIds);
    }
    Map<String, Object> map = new HashMap();
    if (StringUtil.isNotEmpty(vo.getOrgacode())) {
      map.put("vo", vo);
    }
//  if (StringUtil.isEmpty(vo.getCusOrgacode()))
//   {
      List<StoreBattleVo> customers = this.customerChannelService.listAllCustomer(vo);
      
     // vo.setCusOrgacode((customers == null) || (customers.size() == 0) ? "" : ((StoreBattleVo)customers.get(0)).getCusOrgacode());
      map.put("customers", customers);
   //}
    List<StoreBattleVo> halls = this.customerChannelService.listHallByCustomer(vo);
    map.put("halls", halls);
    
    List<CusChanPortray> portrays = null;
    if (StringUtil.isNotEmpty(vo.getOrgacode())) {
      portrays = this.customerChannelService.listHallStoreBattleByIds(vo);
    } else {
      portrays = this.customerChannelService.listCusStoreBattleByIds(vo);
    }
    if ((halls != null) && (halls.size() > 0))
    {
      vo.setOrgacode(((StoreBattleVo)halls.get(0)).getOrgacode());
      List<StoreBattleVo> otherHalls = this.customerChannelService.listOtherHalls(vo);
      map.put("otherlist", otherHalls);
    }
    else
    {
      List<StoreBattleVo> otherHalls = new ArrayList();
      map.put("otherlist", otherHalls);
    }
    map.put("portrays", portrays);
    return map;
  }
  
  @DS("dataSource")
  @RequestMapping(value={"/listHallAndGetOneHallOther"}, method={org.springframework.web.bind.annotation.RequestMethod.GET, org.springframework.web.bind.annotation.RequestMethod.POST})
  @ResponseBody
  public Map<String, Object> listHallAndGetOneHallOther(@RequestBody StoreBattleVo vo)
  {
    Map<String, Object> map = new HashMap();
    
    List<CusChanPortray> portrays = null;
    if (StringUtil.isNotEmpty(vo.getOrgacode())) {
      portrays = this.customerChannelService.listHallStoreBattleByIds(vo);
    } else {
      portrays = this.customerChannelService.listCusStoreBattleByIds(vo);
    }
    map.put("portrays", portrays);
    return map;
  }
  
  @DS("dataSource")
  @RequestMapping(value={"/modalInit"}, method={org.springframework.web.bind.annotation.RequestMethod.GET, org.springframework.web.bind.annotation.RequestMethod.POST})
  @ResponseBody
  public Map<String, Object> modalInit(@RequestBody StoreBattleVo vo)
  {
    ServletRequestAttributes attrs = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
    HttpSession session = attrs.getRequest().getSession();
    List<Integer> typeOrder = (List)session.getAttribute("typeOrder");
    if ((typeOrder == null) || (typeOrder.size() == 0)) {
      typeOrder = Arrays.asList(new Integer[] { Integer.valueOf(5), Integer.valueOf(6), Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(3), Integer.valueOf(4) });
    }
    List<Integer> channelSelectdIds = (List)session.getAttribute("channelSelectdIds");
    
    List<CusChanPortray> custs = this.customerChannelService.listPortrayFieldInCusChanl();
    List<CusChanPortray> halls = this.customerChannelService.listPortrayFieldInHallPortrait();
    
    Map<String, Object> map = new HashMap();
    map.put("custs", custs);
    map.put("halls", halls);
    map.put("typeOrder", typeOrder);
    map.put("channelSelectdIds", channelSelectdIds);
    return map;
  }
}
