package com.asiainfo.cmc.crawler;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.ibatis.session.SqlSession;

import com.asiainfo.cmc.utils.MyBatisUtil;
import com.asiainfo.cmc.utils.sqlUtils.SqlMapper;
import com.asiainfo.cmc.crawler.JdModel;
import com.asiainfo.cmc.crawler.URLFecter;
/*   
 *  
 */
public class JdongMain {
    
    static final Log logger = LogFactory.getLog(JdongMain.class);
    /*public static void main(String[] args) throws Exception {*/
    public void startRun() throws Exception {
    	///System.out.println("----------爬虫定时任务开始运行------------");
        //初始化一个httpclient
        HttpClient client = new DefaultHttpClient();
        
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        SqlSession session=MyBatisUtil.getSession();
        SqlMapper sqlMapper = new SqlMapper(session);
        
        String page =URLFecter.URLParserPage(client, "http://www.okhqb.com/list/137---1-.html");
        //我们要爬取的一个地址，这里可以从数据库中抽取数据，然后利用循环，可以爬取一个URL队列
        for(int i=1;i<=Integer.parseInt(page);i++){   	
        	String url="http://www.okhqb.com/list/137---"+i+"-.html";
        	//抓取的数据
        	List<URLModel> urldatas=URLFecter.URLParserURL(client, url);
        	//循环输出抓取的数据
        	for (URLModel jd1:urldatas) {
        		logger.info("bookurl:"+jd1.getBookURL()+"\t"+"bookName:"+jd1.getBookName());
        		if(jd1.getBookName().contains("二手")){
        			
        		}else{
        			if(jd1.getBookName().contains("苹果")||jd1.getBookName().contains("三星")||jd1.getBookName().contains("华为")
        					||jd1.getBookName().contains("魅族")||jd1.getBookName().contains("中兴")||jd1.getBookName().contains("小米")
        					||jd1.getBookName().contains("荣耀")||jd1.getBookName().contains("OPPO")||jd1.getBookName().contains("vivo")){
        				//抓取的数据
        				List<JdModel> bookdatas=URLFecter.URLParser(client,jd1.getBookURL());
        				//循环输出抓取的数据
        				for (JdModel jd:bookdatas) {
        					logger.info("bookID:"+jd.getBookID()+"\t"+"bookPrice:"+jd.getBookPrice()+"\t"+"bookName:"+jd.getBookName());
        					String name=jd.getBookID();
        					String [] arr2 = name.split("/");
        					if(arr2.length>1)
        					{
        						name=arr2[1];
        					}
        					//将抓取的数据插入数据库
        					String sql ="insert into ZD_RESULT_OPER_OPEN_PRICE_D values ('"+name+"','"+jd.getBookName()+"','"+sdf.format(d)+"','"+jd.getBookPrice()+"')";
        					sqlMapper.insert(sql);
        					
        				}
        			}
        		}
        	}
        	
        }
        
        String sql="insert into ZD_RESULT_OPER_OPEN_PRICE_FINAL_D " +
        		"select d.BRANDNAME,d.SPEC,d.DODATE,avg(d.OPENPRICE) from ZD_RESULT_OPER_OPEN_PRICE_D d " +
        		"where d.DODATE='"+sdf.format(d)+"' " +
        		"group by d.BRANDNAME,d.SPEC,d.DODATE";
        sqlMapper.insert(sql);
    	//System.out.println("----------爬虫定时任务运行结束------------");
    }
}