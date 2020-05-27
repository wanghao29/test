package com.asiainfo.cmc.authority.shiro.listener;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.springframework.beans.factory.annotation.Autowired;

import com.asiainfo.cmc.aopLog.Log;
import com.asiainfo.cmc.aopLog.service.ISystemLogService;
import com.asiainfo.cmc.utils.DateUtils;

/**
 *@标题MySessionListener
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
public class MySessionListener implements SessionListener {
	    @Autowired
	    private ISystemLogService systemLogService; 
	   
	   
	public void onStart(Session session) {//会话创建时触发  
	//	System.out.println("**************************会话创建：" + session.getId()+"》》时间："+session.getLastAccessTime());  
		}  
		@Override  
		public void onExpiration(Session session) {//会话过期时触发

	//	System.out.println("**********************会话过期：" + session.getId()+"》》时间："+new Date());  
		}  
		@Override  
		public void onStop(Session session) {//退出/会话过期时触发  
/*		System.out.println("***************************会话停止：" + session.getId()+"》》时间："+session.getLastAccessTime());  */
			Log log = new Log();
			try {
				log.setEndTime(Timestamp.valueOf(DateUtils.format(DateUtils.GetCurTime(), "yyyyMMddHHmmss", "yyyy-MM-dd hh:mm:ss")));
				log.setSessionId(String.valueOf(session.getId()));
				systemLogService.updateLoginOutTime(log);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		}  
}
