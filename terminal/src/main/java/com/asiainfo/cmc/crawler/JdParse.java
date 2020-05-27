package com.asiainfo.cmc.crawler;

import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import com.asiainfo.cmc.crawler.JdModel;
/*
 * 
 * 用于将上面传下来的html解析，获取我们需要的内容
 * 解析方式，采用Jsoup解析，有不明白Jsoup的可以上网搜索API文档
 * Jsoup是一款很简单的html解析器
 */
public class JdParse {
    public static List<JdModel> getData (String html) throws Exception{
        //获取的数据，存放在集合中
        List<JdModel> data = new ArrayList<JdModel>();
        //采用Jsoup解析
        Document doc = Jsoup.parse(html);
        //获取html标签中的内容
        String bookPrice=doc.select("b[class=sku-price]").text();
        
        Elements elements=doc.select("table[class=cs_tab]").select("tr").select("td");
        String bookID= elements.get(1).text();
        String bookName=elements.get(3).text();
        
        //创建一个对象，这里可以看出，使用Model的优势，直接进行封装
        JdModel jdModel=new JdModel();
        //对象的值
        jdModel.setBookID(bookID);
        jdModel.setBookName(bookName);
        jdModel.setBookPrice(bookPrice);
        //将每一个对象的值，保存到List集合中
        data.add(jdModel);

        /*Elements elements=doc.select("div[class=result_list_container cfix]").select("ul").select("li");
        for (Element ele:elements) {
            String bookID=ele.select("a[class=mod_btn]").attr("data-sku-id");
            String bookPrice=ele.select("div[class=price_wrap cfix]").select("em").text();
            String bookName=ele.select("div[class=name_wrap]").select("a").text();
            //创建一个对象，这里可以看出，使用Model的优势，直接进行封装
            JdModel jdModel=new JdModel();
            //对象的值
            jdModel.setBookID(bookID);
            jdModel.setBookName(bookName);
            jdModel.setBookPrice(bookPrice);
            //将每一个对象的值，保存到List集合中
            data.add(jdModel);
        }*/
        //返回数据
        return data;
    }
    
    public static String getPage (String html) throws Exception{
        //获取的数据，存放在集合中
    	String page = "";
        //采用Jsoup解析
        Document doc = Jsoup.parse(html);
        //获取html标签中的内容
        page=doc.select("div[class=position_page fr]").select("em").text();
        //返回数据
        return page;
    }
    
    public static List<URLModel> getURL (String html) throws Exception{
    	//获取的数据，存放在集合中
        List<URLModel> data = new ArrayList<URLModel>();
        //采用Jsoup解析
        Document doc = Jsoup.parse(html);
        //获取html标签中的内容
        Elements elements=doc.select("div[class=result_list_container cfix]").select("ul").select("li");
        for (Element ele:elements) {
            String bookURL=ele.select("div[class=name_wrap]").select("a").attr("href");
            String bookName=ele.select("div[class=name_wrap]").select("a").text();
            //创建一个对象，这里可以看出，使用Model的优势，直接进行封装
            URLModel urlModel=new URLModel();
            //对象的值
            urlModel.setBookURL(bookURL);
            urlModel.setBookName(bookName);
            
            //将每一个对象的值，保存到List集合中
            data.add(urlModel);
        }
        //返回数据
        return data;
    }
}