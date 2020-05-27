package com.asiainfo.cmc.authority.contoller;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 *@鏍囬InitServlet
 * @浣滆��: meiyuxiang
 * @鍒涘缓鏃堕棿: 2018-06-29 0029
 * @鎻忚堪: 
 */
public class InitServlet extends HttpServlet {
    private static WebApplicationContext wc;


    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // 鍒濆鍖� Spring 鐨勫伐鍘�
        wc = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
    }

    public static WebApplicationContext getWc() {
        return wc;
    }

    public static Object getBean(String beanName){
        return wc.getBean(beanName);
    }
}
