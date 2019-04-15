package com.utils.Redis;

import com.utils.SerializeUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

/**
 * @Date: 2019/3/21 17:33
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: redis缓存工具实现类
 **/
public class RedisDao {
    private static final Logger log = Logger.getLogger(RedisDao.class);

    //redis连接池
    private static JedisPool jedisPool = null;
    //redis连接
    private static Jedis jedis = null;
    //缓存时间
    private static final int  CACHE_TIME_OUT = 24*60*60;

    public static JedisPool getJedisPool() {
        return jedisPool;
    }

    public static void setJedisPool(JedisPool jedisPool) {
        RedisDao.jedisPool = jedisPool;
    }
    /**
     * @Date 21:23 2019/3/21
     * @Remark 从链接池中获取链接
     **/
    public static Jedis getJedis(){
        return jedisPool.getResource();
    }
    /**
     * @Date 21:24 2019/3/21
     * @Remark 静态代码块，项目初始化的时候，启动redis配置
     **/
    static {
        //获取redis配置资源
        InputStream in = RedisDao.class.getClassLoader().getResourceAsStream("redis.properties");
        Properties properties = new Properties();
        JedisPoolConfig config = new JedisPoolConfig();
        try {
            properties.load(in);
            //配置redispool最大连接数，可以通过pool.getResourse()获取
            config.setMaxTotal(Integer.parseInt(properties.getProperty("redis.maxActive")));
            //配置最大的空闲连接数
            config.setMaxIdle(Integer.parseInt(properties.getProperty("redis.maxIdle")));
            //配置最大等待时间，如果超过这个时间 则抛出异常JedisConnectionException
            config.setMaxWaitMillis(Integer.parseInt(properties.getProperty("redis.maxWait")));
            //在应用一个jedis时，是否有validate 如果为true 则jedis都是可用的实例
            config.setTestOnBorrow(Boolean.parseBoolean(properties.getProperty("redis.testOnBorrow")));
            //创建redis连接池   未设置密码
            jedisPool = new JedisPool(config,properties.getProperty("redis.host"),Integer.parseInt(properties.getProperty("redis.port")));

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @Date 21:51 2019/3/21
     * @Remark  判断redis是否连接成功 ，连接正常返回PONG 否则返回异常
     **/
    public static String ping(){
        jedis = getJedis();
        return jedis.ping();
    }

    /**
     * @Date 22:24 2019/3/21
     * @Remark 回收资源
     **/
    public static void releaseResource(Jedis jedis){
        if(jedis != null){
            jedisPool.returnBrokenResource(jedis);
        }
    }
    /**
     * @Date 22:30 2019/3/21
     * @Remark  返回以秒为单位的时间
     * -1  超时
     * -2  key不存在
     **/
    public static long ttl(String key){
        long len= 0L;
        try {
            jedis = getJedis();
            len = jedis.ttl(SerializeUtils.serialize(key));
        } catch (Exception e) {
           log.error("cache时间查询失败："+e);
        } finally {
            releaseResource(jedis);
        }
        return len;
    }
    /**
     * @Date 22:39 2019/3/21
     * @Remark  清除redis 所以key
     **/
    public static void fulshAll(){
        try{
            jedis = getJedis();
            jedis.flushAll();
        }catch (Exception e){
            log.error("cache清除失败："+e);
        }finally {
            releaseResource(jedis);
        }

    }

    /**
     * @Date 22:46 2019/3/21
     * @Remark  保存一个对象到redis中
     **/
    public static boolean set(Object key,Object object){
       return set(key,object,CACHE_TIME_OUT);
    }

    /**
     * @Date 22:52 2019/3/21
     * @Remark 保存一个对象到redis 并且有时间
     **/
    public static boolean set(Object key ,Object object, int secondes){
        try {
            jedis = getJedis();
            jedis.set(SerializeUtils.serialize(key),SerializeUtils.serialize(object));
            if(secondes !=0){  // 等于0 则表示没有设置时间
                jedis.expire(SerializeUtils.serialize(key),secondes);
            }
            return true;
        } catch (Exception e) {
            log.error("cache缓存失败："+e);
            return false;
        }finally {
            releaseResource(jedis);
        }
    }

    /**
     * @Date 23:02 2019/3/21
     * @Remark g根据key值获取redis缓存数据
     **/
    public static Object get(Object key){
        try {
            jedis  = getJedis();
            byte[] bytes = jedis.get(SerializeUtils.serialize(key));
            return bytes == null? null:SerializeUtils.unSerialize(bytes);
        } catch (Exception e) {
            log.error("cache获取数据失败："+e);
            return null;
        } finally {
            releaseResource(jedis);
        }
    }
    /**
     * @Date 23:06 2019/3/21
     * @Remark 根据key值删除缓存
     **/
    public static boolean del(Object key){
        try {
            jedis  = getJedis();
            jedis.del(SerializeUtils.serialize(key));
            return true;
        } catch (Exception e) {
           log.error("cache删除失败："+e);
           return false;
        }finally {
            releaseResource(jedis);
        }
    }
    /**
     * @Date 23:09 2019/3/21
     * @Remark  根据多个key值
     **/
    public static boolean del(Object... key){
        try {
            jedis = getJedis();
            jedis.del(SerializeUtils.serialize(key));
            return true;
        } catch (Exception e) {
            log.error("cache删除失败："+e);
            return false;
        } finally {
            releaseResource(jedis);
        }

    }

    /**
     * @Date 23:14 2019/3/21
     * @Remark 设置缓存时间
     **/
    public static boolean expire(Object key ,int secondes){

        try {
            jedis = getJedis();
            jedis.expire(SerializeUtils.serialize(key),secondes);
            return true;
        } catch (Exception e) {
           log.error("cache设置缓存时间失败："+e);
           return false;
        }finally {
            releaseResource(jedis);
        }

    }
    /**
     * 拿到缓存中所有符合pattern的key
     */
    public static Set<byte[]> keys(String pattern) {

        try {
            jedis = getJedis();
            Set<byte[]> allKey = jedis.keys(("*" + pattern + "*").getBytes());
            return allKey;
        } catch (Exception e) {
            log.error("Cache获取失败：" + e);
            return new HashSet<byte[]>();
        } finally {
            releaseResource(jedis);
        }
    }
    /**
     * 判断一个key是否存在
     */
    public static boolean exists(Object key) {
        boolean result = false;
        try {
            jedis = getJedis();
            result = jedis.exists(SerializeUtils.serialize(key));
            return result;
        } catch (Exception e) {
            log.error("Cache获取失败：" + e);
            return false;
        } finally {
            releaseResource(jedis);
        }
    }





}
