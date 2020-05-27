package com.asiainfo.cmc.aopLog;

import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.asiainfo.cmc.aopLog.service.ISystemLogService;
import com.asiainfo.cmc.authority.pojo.User;
import com.asiainfo.cmc.authority.shiro.realm.UserRealm;
import com.asiainfo.cmc.utils.DateUtils;

@Aspect
@Component  
public class SystemLogAspect {
	
	
	public SystemLogAspect(){
		 
	}
	
	   //获取开始时间
    private String BEGIN_TIME ;

    //获取结束时间
    private String  END_TIME;
    
    @Autowired
    private UserRealm userRealm;
	  //注入Service用于把日志保存数据库  
    @Autowired
    private ISystemLogService systemLogService;  
    //本地异常日志记录对象  
    //private static final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);  
  
    //Service层切点  
/*    @Pointcut("@annotation(com.annotation.SystemServiceLog)")  
    public void serviceAspect() {  
    }  */
  
    //Controller层切点  
	/*@Pointcut("execution(* com.asiainfo.cmc.authority.contoller.*.*(..))")*/
    @Pointcut("@annotation(com.asiainfo.cmc.aopLog.SystemControllerLog)")
    public void controllerAspect() {  
    }  
  
    /** 
     * 前置通知 用于拦截Controller层记录用户的操作 
     * 
     * @param joinPoint 切点 
     */  
	@Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) {
		try {
			
		
			//System.out.println("userID:"+userId+"***userName:"+userName+"********************切点 "+resultMap.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		 /*Log log = new Log();  
		 try { 
			 	BEGIN_TIME =DateUtils.GetCurTime();
		        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
		        HttpSession session = request.getSession();  
		        
		        //读取session中的用户  
		        Operator user = (Operator)session.getAttribute( WebConstant.SESSION_ATTRIBUTE_USER);
		        log= getLogInfo(joinPoint,request);
		        
		        log.setStep("方法执行开始");
          } catch (Exception e) {  
            //记录本地异常日志  
        	  log.setExceptionDetail("日志记录异常"+e.getMessage());
        	 
          }finally{
        	systemLogDao.insertSystemLog(log);
          }*/
    }  
	 /**
     * 方法结束执行
     */
/*    @After("controllerAspect()")
    public void after(JoinPoint joinPoint){
    	Log log = new Log();
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
    	log= getLogInfo(joinPoint,request);
        END_TIME = DateUtils.GetCurTime();
        log.setEnd_time(END_TIME);
        log.setStep("方法执行成功");
        System.out.println("结束"+END_TIME);
    }
*/
    
    /**
     * 方法结束执行后的操作
     */
    @AfterReturning("controllerAspect()")
    public void doAfter(JoinPoint joinPoint){
    //	System.out.println("***************方法结束执行后的操作");
		try {
			Map<String, String>	resultMap = getControllerMethodDescription(joinPoint);
			Log log = new Log();
			User user = (User) SecurityUtils.getSubject().getPrincipal();
			String userId=user.getUsername();//账号
			String userName=user.getNickname();//名称
			
			   HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
		       
		        //读取session中的用户  
		      //  User user = (User) session.getAttribute(WebConstants.CURRENT_USER);  
		        //获取请求ip  
		        String ip = request.getRemoteAddr();  
		        //获取用户请求方法的参数并序列化为JSON格式字符串  
			
			log.setUserName(userName);
			log.setRoleName(user.getName());
			log.setUserId(userId);
			log.setMethod("method");
			log.setModule(resultMap.get("module"));
			log.setModuleMenu(resultMap.get("moduleMenu"));
			log.setModuleMenuKpi(resultMap.get("moduleMenuKpi"));
			log.setIp(ip);
			log.setDescription(resultMap.get("description"));
			log.setParams("");
			log.setBeginTime(Timestamp.valueOf(DateUtils.format(DateUtils.GetCurTime(), "yyyyMMddHHmmss", "yyyy-MM-dd hh:mm:ss")));
			log.setEndTime(Timestamp.valueOf(DateUtils.format(DateUtils.GetCurTime(), "yyyyMMddHHmmss", "yyyy-MM-dd hh:mm:ss")));
			log.setExceptionCode("");
			log.setExceptionDetail("");
			log.setType(resultMap.get("type"));
			log.setBillcyc(DateUtils.GetCurDate());
			log.setBusiness("");
			log.setSessionId(request.getSession().getId());
			Integer seq = systemLogService.insertSystemLog(log);
			if("LOGIN".equals(resultMap.get("type"))) {
				request.getSession().setAttribute("loginKey", seq);
			}else if("LOGOUT".equals(resultMap.get("type"))) {
				userRealm.clearCached();
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 

		
		
		
		
	
    	/*Log log = new Log();
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
    	log= getLogInfo(joinPoint,request);
    	log.setStep("方法执行结束");
    	systemLogDao.insertSystemLog(log);*/
    }

    /**
     * 方法有异常时的操作
     */
    @AfterThrowing(pointcut = "controllerAspect()", throwing = "e")
    public void doAfterThrow(JoinPoint joinPoint, Throwable e ){
    	/*Log log = new Log();
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
    	log= getLogInfo(joinPoint,request);
    	log.setExceptionCode(e.getClass().getName());
    	log.setExceptionDetail(e.getMessage());
    	log.setType("exception");
    	log.setStep("方法执行异常");
    	systemLogDao.insertSystemLog(log);*/
    //	System.out.println("***************方法执行异常");
    
    }

    
    
    /** 
     * 异常通知 用于拦截service层记录异常日志 
     * 
     * @param joinPoint 
     * @param e 
     */  
  /*  @AfterThrowing(pointcut = "serviceAspect()", throwing = "e")  
    public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {  
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
        //读取session中的用户  
      //  User user = (User) session.getAttribute(WebConstants.CURRENT_USER);  
        //获取请求ip  
        String ip = request.getRemoteAddr();  
        //获取用户请求方法的参数并序列化为JSON格式字符串  
        String params = "";  
        if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {  
            for (int i = 0; i < joinPoint.getArgs().length; i++) {  
               // params += JSONUtil.toJsonString(joinPoint.getArgs()[i]) + ";";  
            }  
        }  
        try {  
              ========控制台输出=========  
            System.out.println("=====异常通知开始=====");  
            System.out.println("异常代码:" + e.getClass().getName());  
            System.out.println("异常信息:" + e.getMessage());  
            System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
            System.out.println("方法描述:" + getServiceMthodDescription(joinPoint));  
            //System.out.println("请求人:" + user.getName());  
            System.out.println("请求IP:" + ip);  
            System.out.println("请求参数:" + params);  
               ==========数据库日志=========  
            Log log = SpringContextHolder.getBean("logxx");  
            log.setDescription(getServiceMthodDescription(joinPoint));  
            log.setExceptionCode(e.getClass().getName());  
            log.setType("1");  
            log.setExceptionDetail(e.getMessage());  
            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
            log.setParams(params);  
            log.setCreateBy(user);  
            log.setCreateDate(DateUtil.getCurrentDate());  
            log.setRequestIp(ip);  
            //保存数据库  
            logService.add(log);  
            System.out.println("=====异常通知结束=====");  
        } catch (Exception ex) {  
            //记录本地异常日志  
         //   logger.error("==异常通知异常==");  
         //   logger.error("异常信息:{}", ex.getMessage());  
        }  
         ==========记录本地异常日志==========  
       // logger.error("异常方法:{}异常代码:{}异常信息:{}参数:{}", joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName(), e.getClass().getName(), e.getMessage(), params);  
  
    }  */
  
  
    /** 
     * 获取注解中对方法的描述信息 用于service层注解 
     * 
     * @param joinPoint 切点 
     * @return 方法描述 
     * @throws Exception 
     */  
/*    public static String getServiceMthodDescription(JoinPoint joinPoint)  
            throws Exception {  
        String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        String description = "";  
        for (Method method : methods) {  
            if (method.getName().equals(methodName)) {  
                Class[] clazzs = method.getParameterTypes();  
                if (clazzs.length == arguments.length) {  
                    description = method.getAnnotation(SystemServiceLog.class).description();  
                    break;  
                }  
            }  
        }  
        return description;  
    }  
  */
    /** 
     * 获取注解中对方法的描述信息 用于Controller层注解 
     * 
     * @param joinPoint 切点 
     * @return 方法描述 
     * @throws Exception 
     */  
    public static Map<String,String> getControllerMethodDescription(JoinPoint joinPoint) throws Exception {  
    	
    	Map<String,String> resultMap = new HashMap<String, String>();
        String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        String description = "";  
        for (Method method : methods) {  
            if (method.getName().equals(methodName)) {  
                Class[] clazzs = method.getParameterTypes();  
                if (clazzs.length == arguments.length) {  
                	if(method.isAnnotationPresent(SystemControllerLog.class)){
                		resultMap.put("description", method.getAnnotation(SystemControllerLog.class).description());  
                		resultMap.put("business", method.getAnnotation(SystemControllerLog.class).business());  
                		resultMap.put("module", method.getAnnotation(SystemControllerLog.class).module());  
                		resultMap.put("moduleMenu", method.getAnnotation(SystemControllerLog.class).moduleMenu()); 
                		resultMap.put("moduleMenuKpi", method.getAnnotation(SystemControllerLog.class).moduleMenuKpi()); 
                		resultMap.put("type", method.getAnnotation(SystemControllerLog.class).type());  
                         
                	}
                    
                    break;  
                }  
            }  
        }  
        return resultMap;  
    }
    
    
/*    private Log getLogInfo(JoinPoint joinPoint,HttpServletRequest request){
    	Log log = new Log();  
    	
    	try {  
    	HttpSession session = request.getSession();  
        //读取session中的用户  
        Operator user = (Operator)session.getAttribute( WebConstant.SESSION_ATTRIBUTE_USER);
    	Map<String,String> param = RequestUtils.getParamsMap(request);
		Map<String,String> resultMap =getControllerMethodDescription(joinPoint);
        Object[] os=joinPoint.getArgs();  
        //*========数据库日志=========* 
      
      /*  log.setDescription(resultMap.toString());  
        log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
        log.setType(resultMap.get("type"));  
        log.setIp(request.getRemoteAddr());  
        log.setExceptionCode(null);  
        log.setExceptionDetail(null);  
        log.setParams(param.toString());  
        log.setUserName(user.getOperName());  
        log.setCity(user.getOrgCode());
        log.setUserId(user.getOperId()); 
        if(param.containsKey("datetime")){
        	 log.setBillcyc(.format(param.get("datetime"), "yyyy-MM", "yyyyMM")); 
        }else{
        	 log.setBillcyc(DateUtils.format(DateUtils.GetCurDate(), "yyyyMMdd", "yyyyMM")); 
        }
       
        
        log.setModule(resultMap.get("module"));
        log.setBusiness(resultMap.get("business"));
       // log.setMethod(resultMap.get("methods"));
        log.setBegin_time(BEGIN_TIME);
        log.setEnd_time(END_TIME);
    	} catch (Exception e) {  
               //记录本地异常日志  
           	   log.setExceptionDetail(e.getMessage());
           	   //log.setExceptionCode(e.getCause().toString());
               System.out.println("==前置通知异常==");  
               System.out.println("异常信息:{}"+ e.getMessage());  
        }finally{
           	//systemLogDao.insertSystemLog(log);
        	
        }
    	return log;*/
  /*  }*/
}

