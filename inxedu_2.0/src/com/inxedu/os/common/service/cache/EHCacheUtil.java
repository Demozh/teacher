package com.inxedu.os.common.service.cache;


import com.inxedu.os.common.util.ObjectUtils;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

/*
 *  ehcache工具类
 */
public class EHCacheUtil {
	 private static CacheManager cacheManager = null;
	    private static Cache cache = null;
	    static{  
	        EHCacheUtil.initCacheManager();  
	    }
	    
	    /** 
	     * 初始化缓存
	     */  
	    public static CacheManager initCacheManager() {  
	        try {  
	            if (cacheManager == null){
					cacheManager = net.sf.ehcache.CacheManager.create();
					//cache名字　　　最大对象数
					/*maxElementsInMemory：缓存中允许创建的最大对象数
					eternal：缓存中对象是否为永久的，如果是，超时设置将被忽略，对象从不过期。
					timeToIdleSeconds：缓存数据的钝化时间，也就是在一个元素消亡之前，
					两次访问时间的最大时间间隔值，这只能在元素不是永久驻留时有效，
					如果该值是 0 就意味着元素可以停顿无穷长的时间。
					timeToLiveSeconds：缓存数据的生存时间，也就是一个元素从构建到消亡的最大时间间隔值，
					这只能在元素不是永久驻留时有效，如果该值是0就意味着元素可以停顿无穷长的时间。
					overflowToDisk：内存不足时，是否启用磁盘缓存。
					memoryStoreEvictionPolicy：缓存满了之后的淘汰算法。*/
					cache = new net.sf.ehcache.Cache("objectCache", 10000, true, false, 60*60, 60*60);
					cacheManager.addCache(cache);
				}
	        } catch (Exception e) {
	            e.printStackTrace();  
	        }  
	        return cacheManager;  
	    }
	    /*
	     * 通过key获得缓存
	     */
	public static Object get(String key) {
		try {
			if (ObjectUtils.isNotNull(cache)&&ObjectUtils.isNotNull(cache.get(key))){
				return cache.get(key).getObjectValue();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	   /*
     *   设置缓存
     */
	public static  void set(String key, Object value) {
		try {
			if (cache != null){
				cache.put(new Element(key, value));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	   /*
     *  通过key移除缓存
     */
	public static boolean remove(String key) {
		try {
			if (cache != null)
				return cache.remove(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	   /*
     *  移除缓存
     */
	public static boolean removeAll() {
		try {
			if (cache != null)
				cache.removeAll();;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
    /*
     *  设置缓存并可以设置缓存时间
     */
	public static void set(String key, Object value, int exp) {
		try {
			if (cache != null){
				Element element = new Element(key, value);
				element.setTimeToLive(exp);
				cache.put(element);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}