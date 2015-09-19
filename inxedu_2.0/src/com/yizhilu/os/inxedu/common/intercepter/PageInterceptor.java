package com.yizhilu.os.inxedu.common.intercepter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.mapping.MappedStatement.Builder; 
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.common.entity.PageOL;
import com.yizhilu.os.inxedu.common.util.ObjectUtils;
import com.yizhilu.os.inxedu.common.util.StringUtils;

import sun.reflect.misc.ReflectUtil;

/**
 * mybatis分页拦截
 *
 */
@Intercepts({@Signature(type=Executor.class,method="query",args={ MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class })})  
public class PageInterceptor implements Interceptor{
	 public Object intercept(Invocation invocation) throws Throwable {  
		 //当前环境 MappedStatement，BoundSql，及sql取得  
		    MappedStatement mappedStatement=(MappedStatement)invocation.getArgs()[0];      
		    Object parameter = invocation.getArgs()[1];   
		    BoundSql boundSql = mappedStatement.getBoundSql(parameter);   
		    String originalSql = boundSql.getSql().trim();  
		    Object parameterObject = boundSql.getParameterObject();  
		       //拿到当前绑定Sql的参数对象，就是我们在调用对应的Mapper映射语句时所传入的参数对象  
		       Object obj = boundSql.getParameterObject();  
		       //只有是传入对象是map的,并传入了分页标识的查询才走分页方法
		       if (obj instanceof Map) {  
		    	  Map<String,Object> map =  (Map)obj;
		    	 String  countfalg = (String)map.get("countfalg");
		    	  if(StringUtils.isNotEmpty(countfalg)){
		    		  PageEntity page = (PageEntity)map.get("pageEntity");
			    	   String countSql = getCountSql(originalSql);  
			    	      Connection connection=mappedStatement.getConfiguration().getEnvironment().getDataSource().getConnection()  ;            
			    	      PreparedStatement countStmt = connection.prepareStatement(countSql);    
			    	      BoundSql countBS = copyFromBoundSql(mappedStatement, boundSql, countSql);  
			    	      DefaultParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject, countBS);  
			    	      parameterHandler.setParameters(countStmt);  
			    	      ResultSet rs = countStmt.executeQuery();  
			    	      int totpage=0;  
			    	      if (rs.next()) {    
			    	        totpage = rs.getInt(1);    
			    	      }  
			    	      rs.close();    
			    	      countStmt.close();    
			    	      connection.close();  
			    	      //分页计算  
			    	      page.setTotalResultSize(totpage);  
			    	      int totalPageSize = (page.getTotalResultSize() - 1) / page.getPageSize() + 1;
			    			page.setTotalPageSize(totalPageSize);
			    	      //对原始Sql追加limit  
			    	      int offset = (page.getCurrentPage() - 1) * page.getPageSize();  
			    	      StringBuffer sb = new StringBuffer();  
			    	      sb.append(originalSql).append(" limit ").append(offset).append(",").append(page.getPageSize());  
			    	      BoundSql newBoundSql = copyFromBoundSql(mappedStatement, boundSql, sb.toString());  
			    	      MappedStatement newMs = copyFromMappedStatement(mappedStatement,new BoundSqlSqlSource(newBoundSql));    
			    	      invocation.getArgs()[0]= newMs;    
		    	  }
		       }  
	       Object result = invocation.proceed();  
	       return result;  
	    }  
	 
	 /** 
	   * 复制MappedStatement对象 
	   */  
	  private MappedStatement copyFromMappedStatement(MappedStatement ms,SqlSource newSqlSource) {  
	    Builder builder = new Builder(ms.getConfiguration(),ms.getId(),newSqlSource,ms.getSqlCommandType());  
	    builder.resource(ms.getResource());  
	    builder.fetchSize(ms.getFetchSize());  
	    builder.statementType(ms.getStatementType());  
	    builder.keyGenerator(ms.getKeyGenerator());  
	    builder.timeout(ms.getTimeout());  
	    builder.parameterMap(ms.getParameterMap());  
	    builder.resultMaps(ms.getResultMaps());  
	    builder.resultSetType(ms.getResultSetType());  
	    builder.cache(ms.getCache());  
	    builder.flushCacheRequired(ms.isFlushCacheRequired());  
	    builder.useCache(ms.isUseCache());  
	      
	    return builder.build();  
	  }  
	   
	 public class BoundSqlSqlSource implements SqlSource {    
	      BoundSql boundSql;    
	      public BoundSqlSqlSource(BoundSql boundSql) {    
	        this.boundSql = boundSql;    
	      }    
	      public BoundSql getBoundSql(Object parameterObject) {    
	        return boundSql;    
	      }    
	    }    
	 
	 /** 
	   * 复制BoundSql对象 
	   */  
	  private BoundSql copyFromBoundSql(MappedStatement ms, BoundSql boundSql, String sql) {  
	    BoundSql newBoundSql = new BoundSql(ms.getConfiguration(),sql, boundSql.getParameterMappings(), boundSql.getParameterObject());  
	    for (ParameterMapping mapping : boundSql.getParameterMappings()) {  
	        String prop = mapping.getProperty();  
	        if (boundSql.hasAdditionalParameter(prop)) {  
	            newBoundSql.setAdditionalParameter(prop, boundSql.getAdditionalParameter(prop));  
	        }  
	    }  
	    return newBoundSql;  
	  }  
	  
	 /** 
	   * 根据原Sql语句获取对应的查询总记录数的Sql语句 
	   */  
	  private String getCountSql(String sql) {  
	    return "SELECT COUNT(*) FROM (" + sql + ") aliasForPage";  
	  }  
	    public Object plugin(Object target) {  
	       return Plugin.wrap(target, this);  
	    }  
	   
	    public void setProperties(Properties properties) {  
	    }  
	
}
