package com.asiainfo.cmc.aopLog;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.PARAMETER, ElementType.METHOD})  
@Retention(RetentionPolicy.RUNTIME)  
@Documented  
public @interface SystemControllerLog {
	 String description() default "";  
	 String module()  default "";
	 String moduleMenu()  default "";
	 String moduleMenuKpi()  default "";
	 String business()  default ""; 
	 String type()  default "0"; //query 查询 update更新 delete 删除 add增加
}

