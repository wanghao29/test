package com.asiainfo.cmc.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.asiainfo.cmc.qudao.enties.FollowCustomerSearch;
import com.asiainfo.cmc.qudao.mapper.FollowCustomerSearchMapper;
import com.asiainfo.cmc.qudao.vo.FollowCustomerSearchVo;
import com.asiainfo.cmc.utils.MyBatisUtil;
public class CopyOftest {
	
	@Test
    public void test01() {
		String path = "广东省广州市番禺区洛溪南路20号";
		String encodePath = "";
		try {
			encodePath = URLEncoder.encode(path,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String url = "http://api.map.baidu.com/geocoder/v2/?address="+encodePath+"&output=json&ak=F19q5OcuWjjkMN55MFhqBU1h3GFfW0S3";
        
        String result = "";
        BufferedReader in = null;
        try {           
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
             //   System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
          //  System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        System.out.println(result);

    }

}