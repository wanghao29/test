package com.asiainfo.cmc.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.ibatis.javassist.bytecode.Descriptor.Iterator;
import org.apache.ibatis.session.SqlSession;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.junit.Test;
import org.springframework.util.ObjectUtils;

import com.asiainfo.cmc.enties.BrokenScreen;
import com.asiainfo.cmc.enties.EcssPhone;
import com.asiainfo.cmc.enties.Goods;
import com.asiainfo.cmc.mapper.GoodsMapper;
import com.asiainfo.cmc.utils.MyBatisUtil;
import junit.framework.Assert;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;

import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;

import java.net.URL;

import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
public class test {
	@Test
    public void getGoodsPagerTest() {
        int skip=4;
        int size=2;
        SqlSession session=MyBatisUtil.getSession();
        try {
        	GoodsMapper bookdao=session.getMapper(GoodsMapper.class);
            List<Goods> goods=bookdao.getGoodsPager();
            System.out.println( goods.size());
        } finally {
            session.close();
        }
    }

    @Test
    public void getGoodsByIdTest() {
        SqlSession session=MyBatisUtil.getSession();
        try {
        	GoodsMapper bookdao=session.getMapper(GoodsMapper.class);
            Goods goods=bookdao.getGoodsById(1);
            System.out.println(  goods.getId());
        } finally {
            session.close();
        }
    }
    
    @Test
    public void getGoodsCountTest() {
        SqlSession session=MyBatisUtil.getSession();
        try {
        	GoodsMapper bookdao=session.getMapper(GoodsMapper.class);
        	 System.out.println(  bookdao.getGoodsCount());
        } finally {
            session.close();
        }
    }
    
    @Test
    public void insertTest() {
        SqlSession session=MyBatisUtil.getSession();
        try {
            Goods entity=new Goods();
            entity.setName("正宗无锡阳山水蜜桃新鲜水果水密桃12个6斤装江浙沪皖顺丰包邮");
            entity.setPrice(108);
            entity.setPicture("nopic.jpg");
            GoodsMapper bookdao=session.getMapper(GoodsMapper.class);
            System.out.println(  bookdao.insert(entity));
        } finally {
            session.close();
        }
    }

/*    @Test
    public void deleteTest() {
        SqlSession session=MyBatisUtil.getSession();
        try {
        	GoodsMapper bookdao=session.getMapper(GoodsMapper.class);
            Assert.assertEquals(1, bookdao.delete(12));
        } finally {
            session.close();
        }
    }*/

    @Test
    public void update() {
        SqlSession session=MyBatisUtil.getSession();
        try {
        	GoodsMapper bookdao=session.getMapper(GoodsMapper.class);
            Goods entity=bookdao.getGoodsById(10);
            entity.setName("正宗无锡阳山水蜜桃新鲜水果水密桃12个6斤装");
            entity.setPrice(107);
            entity.setPicture("nopicture.jpg");

            System.out.println(  bookdao.update(entity));
        } finally {
            session.close();
        }
    }
    
    @Test
    public void testTime() {
    	String startMonth = "201905";
		String endMonth = "201908";
		
		   
    	
    	
    	
    	
    }
    
    
    
    
    
    
    


/**
 * 测试接口调用的方法
 * 
 */
@Test
public void testApi(){
	
	/**

	* 接口调用 POST

	*/

	
		final String POST_URL = "http://112.124.111.36/ecss/open/api?";   //测试地址
      //final String POST_URL = "http://www.cmdc-ecss.cn/ecss/open/api?";//正式地址
	try {

	URL url = new URL(POST_URL);

	 
	// 将url 以 open方法返回的urlConnection 连接强转为HttpURLConnection连接 (标识一个url所引用的远程对象连接)

	HttpURLConnection connection = (HttpURLConnection) url.openConnection();// 此时cnnection只是为一个连接对象,待连接中

	 
	// 设置连接输出流为true,默认false (post 请求是以流的方式隐式的传递参数)

	connection.setDoOutput(true);

	 
	// 设置连接输入流为true

	connection.setDoInput(true);

	 
	// 设置请求方式为post

	connection.setRequestMethod("POST");

	 
	// post请求缓存设为false

	connection.setUseCaches(false);

	 
	// 设置该HttpURLConnection实例是否自动执行重定向

	connection.setInstanceFollowRedirects(true);

	 
	// 设置请求头里面的各个属性 (以下为设置内容的类型,设置为经过urlEncoded编码过的from参数)

	// application/x-javascript text/xml->xml数据 application/x-javascript->json对象 application/x-www-form-urlencoded->表单数据

	// ;charset=utf-8 必须要，不然妙兜那边会出现乱码【★★★★★】

	connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

	 
	// 建立连接 (请求未开始,直到connection.getInputStream()方法调用时才发起,以上各个参数设置需在此方法之前进行)

	connection.connect();

	 
	// 创建输入输出流,用于往连接里面输出携带的参数,(输出内容为?后面的内容)
	//shopId：DP0053
	//app_key：57838567
	//app_secret：NQdqwIiYpG7xJTIx
	//session：lPiyUGAXxKP2t63bqBtHqkSBSRKBGVGk
	//sign_method：md5
	//sign：详情参考接口文档的签名sign生成规则
	Date date = new Date(); // this object contains the current date value 
	

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	  String newTime = formatter.format(date);
	
	
	
	
	
	
	
	
	

	DataOutputStream dataout = new DataOutputStream(connection.getOutputStream());
	String sign="NQdqwIiYpG7xJTIx"+"app_key"+"57838567"+"method"+"ECSSAllOrderInquiry"+"session"
			+"lPiyUGAXxKP2t63bqBtHqkSBSRKBGVGk"+"sign_method"+"md5"+"timestamp"+newTime+"NQdqwIiYpG7xJTIx";
			
			sign=encoderByMd5(sign).toUpperCase();
			
			System.out.println(sign);
	 //系统级必须参数
	 sign = "sign="+sign;//分配给平台的app_ secret(secret)，由ECSS分配
	String app_key= "&app_key=57838567"; //时间戳，格式为yyyy-MM-dd HH:mm:ss，例如：2013-05-06 13:52:03 ECSS API服务端允许客户端请求时间误差为10分钟。
	String method ="&method=ECSSAllOrderInquiry"; // 已修改【改为错误数据，以免信息泄露】
	String session ="&session=lPiyUGAXxKP2t63bqBtHqkSBSRKBGVGk";// 分配给用户的SessionKey(或 Access Token），
	String sign_method = "&sign_method=md5";//对API输入参数进行md5加密获得，详细参考签名sign 
	String timestamp="&timestamp="+newTime; // API接口名称 
	String app_secret= "&app_secret=NQdqwIiYpG7xJTIx"; // 分配给平台的AppKey，由ECSS分配 
	String shopId ="&shopId=DP0053";//Ecss分配，不用参加加密
    int pageSizenub=2;
    String pageSize="&pageSize="+pageSizenub;
	//应用级参数
	int payStatus =1;//支付状态
	String pay="&payStatus="+payStatus;	
	int orderState = 17;//订单状态
	String order ="&orderState="+orderState;
	 int isCheck=1;
	 String check="&isCheck="+isCheck;
	// 格式 parm = aaa=111&bbb=222&ccc=333&ddd=444
	 String start="2020-04-21 08:23:26";
     String transactionStartTime="&transactionStartTime="+start;
      String fields="&fields="+"orderInfo.orderId,"+"orderInfo.orderCode,"+
"orderInfo.transactionTime,"+"orderInfo.storeNo,"+"orderInfo.storeName,"+
    		  "productInfo.title,"+"productInfo.barCode,"+"productInfo.specifications,"+"productInfo.color,"
              +"orderInfo.orderSource,"+"productInfo.totalNum,"+"orderInfo.orderStatus,"
    		  +"orderInfo.payment,"+"productInfo.financialPrice";
        
       
     
     
	String parm = sign+app_key+ method+ session+ sign_method+ timestamp+ app_secret+
			shopId+pay+order+check+transactionStartTime+pageSize+fields;

	 
	// 将参数输出到连接

	dataout.writeBytes(parm);

	
	// 输出完成后刷新并关闭流

	dataout.flush();

	dataout.close(); // 重要且易忽略步骤 (关闭流,切记!)

	 
	// System.out.println(connection.getResponseCode());

	Map<String, Object> maps = new HashMap<String, Object>();
	// 连接发起请求,处理服务器响应 (从连接获取到输入流并包装为bufferedReader)

	BufferedReader bf = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
	
	String line;
	
	StringBuilder sb = new StringBuilder(); // 用来存储响应数据
	 
     String buffer = null;
     // 存放请求内容
//     StringBuffer xml = new StringBuffer();
//     while ((buffer = bf.readLine()) != null) {
//         // 在页面中显示读取到的请求参数
//         xml.append(buffer);
//     }


	
	// 循环读取流,若不到结尾处

	while ((line = bf.readLine()) != null) {

	// sb.append(bf.readLine());

	sb.append(line).append(System.getProperty("line.separator"));
		//sb.append(line);
	}

	
	 String callbackMessage = sb.toString();
     if (!ObjectUtils.isEmpty(callbackMessage)) {
         EcssPhone payment1= new EcssPhone();
         Document doc = null;
         //1.读取并解析XML文档,SAXReader就是一个管道，用一个流的方式，把xml文件读出来
         // SAXReader reader = new SAXReader();
         // Document document = reader.read(new File("User.hbm.xml")); //User.hbm.xml表示你要解析的xml文档
         //2.将字符串转为XML
         doc = DocumentHelper.parseText(callbackMessage);
         Element rootElt = doc.getRootElement(); // 获取根节点Request
         
         java.util.Iterator<Element> iterator = rootElt.elementIterator();
         while (iterator.hasNext()){
             Element stu = (Element) iterator.next();
             if("orderList".equals(stu.getName())){
            	 java.util.Iterator<Element> iterator1 = stu.elementIterator();
            	 int q = 1;
                 while (iterator1.hasNext()){
                	 Element element = (Element) iterator1.next();
                	 
                	 java.util.Iterator<Element> iterator2 = element.elementIterator();
                	 System.out.println("order"+q++);
                	 while (iterator2.hasNext()){
                		 Element element0 = (Element) iterator2.next();
                		 if("orderInfo".equals(element0.getName())){
                			 java.util.Iterator<Element> iterator3 = element0.elementIterator();
                			 while (iterator3.hasNext()){
                				 Element element2 = (Element) iterator3.next();
                				 if("orderId".equals(element2.getName())){
                					payment1.setOrderId(element2.getStringValue()); 
                				 }
                				 if("orderCode".equals(element2.getName())){
                 					payment1.setOrderCode(element2.getStringValue()); 
                 				 }
                				 if("orderStatus".equals(element2.getName())){
                 					payment1.setOrderStatus(Integer.parseInt(element2.getStringValue())); 
                 				 }
                				 if("orderSource".equals(element2.getName())){
                 					payment1.setOrderSource(Integer.parseInt(element2.getStringValue())); 
                 				 }
                				 if("payment".equals(element2.getName())){
                 					payment1.setPayment(Double.valueOf(element2.getStringValue())); 
                 				 }
                				 if("payStatus".equals(element2.getName())){
                 					payment1.setPayStatus(Integer.parseInt(element2.getStringValue())); 
                 				 }
                				 if("transactionTime".equals(element2.getName())){
                 					payment1.setTransactionTime(element2.getStringValue()); 
                 				 }
                				 if("storeNo".equals(element2.getName())){
                 					payment1.setStoreNo(element2.getStringValue()); 
                 				 }
                				 if("storeName".equals(element2.getName())){
                 					payment1.setStoreName(element2.getStringValue()); 
                 				 }
                				 
                				 
                				 System.out.println("节点名："+element2.getName()+"---节点值："+element2.getStringValue());
                			 }
                		 }else if("productList".equals(element0.getName())){
                			 
                			 java.util.Iterator<Element> iterator4 = element0.elementIterator();
                			 while (iterator4.hasNext()){
                				 Element element3 = (Element) iterator4.next();
                					//设置title的值到对象payment
                				 if("title".equals(element3.getName())){
                				
                					 payment1.setTitle(element3.getStringValue());
                					 System.out.println("节点名："+element3.getName()+"---节点值："+element3.getStringValue());
                				 }
                				 //设置totalNum值到对象payment
                				 if("totalNum".equals(element3.getName())){
                 					
                 					 payment1.setTotalNum(Integer.parseInt(element3.getStringValue()));
                 					 System.out.println("节点名："+element3.getName()+"---节点值："+element3.getStringValue());
                 				 }
                				 //设置totalNum值到对象payment
                				 if("barCode".equals(element3.getName())){
                 					
                 					 payment1.setBarCode(element3.getStringValue());
                 					 System.out.println("节点名："+element3.getName()+"---节点值："+element3.getStringValue());
                 				 }	 
                				 //设置financialPrice值到对象payment
                				 if("financialPrice".equals(element3.getName())){
                 					
                 					 payment1.setFinancialPrice(Double.valueOf(element3.getStringValue()));
                 					 System.out.println("节点名："+element3.getName()+"---节点值："+element3.getStringValue());
                 				 }
                				 //设置specifications值到对象payment
                				 if("specifications".equals(element3.getName())){
                 					
                 					 payment1.setSpecifications(element3.getStringValue());
                 					 System.out.println("节点名："+element3.getName()+"---节点值："+element3.getStringValue());
                 				 }
                				 //设置color值到对象payment
                				 if("color".equals(element3.getName())){
                 					
                 					 payment1.setColor(element3.getStringValue());
                 					 System.out.println("节点名："+element3.getName()+"---节点值："+element3.getStringValue());
                 				 }
                				System.out.println(payment1);
                			 }
                			 maps.put("haha", payment1);
                			 
                		 }
                	 }
                 }
             }
             
         }
 
	
     }
     
     
     bf.close(); // 重要且易忽略步骤 (关闭流,切记!)
     
     connection.disconnect(); // 销毁连接
     
     System.out.println(sb.toString());
     
     
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
	
}
	
	
	

	




public static String encoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
    MessageDigest md5 = MessageDigest.getInstance("MD5");
    md5.update((str).getBytes("UTF-8"));
    byte b[] = md5.digest();

    int i;
    StringBuffer buf = new StringBuffer("");

    for (int offset = 0; offset < b.length; offset++) {
        i = b[offset];
        if (i < 0) {
            i += 256;
        }
        if (i < 16) {
            buf.append("0");
        }
        buf.append(Integer.toHexString(i));
    }

    return buf.toString();
}



























	}

	 
	

	 
//	public static void main(String[] args) {
//
//	// httpURLConectionGET();
//
//	httpURLConnectionPOST();
//
//	}

		
	
	
	
	
	
	
	
	
	
	

     





















