package com.asiainfo.cmc.authority.shiro.credentials;

import java.util.concurrent.atomic.AtomicInteger;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;

/**
 *@标题RetryLimitHashedCredentialsMatcher
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {

	//AtomicInteger是一个提供原子操作的Integer类，通过线程安全的方式操作加减。  
    private Cache<String, AtomicInteger> passwordRetryCache;  
  
    public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager) {  
        passwordRetryCache = cacheManager.getCache("passwordRetryCache");  
    }  
    //控制密码输入错误次数  
    @Override  
    public boolean doCredentialsMatch(AuthenticationToken token,  
            AuthenticationInfo info) {  
        String username = (String) token.getPrincipal();  
        // retry count + 1  
        AtomicInteger retryCount = passwordRetryCache.get(username);  
      //  System.out.println("retryCount:"+retryCount);  
        if (retryCount == null) {  
            retryCount = new AtomicInteger(0);  
            passwordRetryCache.put(username, retryCount);  
        }  
        if (retryCount.incrementAndGet() > 10) {  
            // if retry count > 5 throw  
            throw new ExcessiveAttemptsException();  
        }  
        boolean matches = super.doCredentialsMatch(token, info);  
        if (matches) {  
            // clear retry count  
            passwordRetryCache.remove(username);  
        }   
  
        return matches;  
    }  
}
