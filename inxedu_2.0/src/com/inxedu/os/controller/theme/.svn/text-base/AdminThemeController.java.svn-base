package com.inxedu.os.controller.theme;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asual.lesscss.LessEngine;
import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.util.StringUtils;

/**
 * 教师管理
 */
@Controller
@RequestMapping("/admin")
public class AdminThemeController extends BaseController {
    //log日志
    private static final Logger logger = LoggerFactory.getLogger(AdminThemeController.class);
    
    private static String to_update_theme=getViewPath("/admin/theme/update_theme");//讲师添加页面
   
    
    /** 到主题色修改页面 */
    @RequestMapping("/theme/toupdate")
    public String toUpdateTheme(HttpServletRequest request) {
        return to_update_theme;
    }
    /** 到主题色修改页面 */
    @RequestMapping("/theme/update")
    public String updateTheme(HttpServletRequest request,@RequestParam String color) {
    	//获得项目根目录
    	String strDirPath = request.getSession().getServletContext().getRealPath("/");     	
    	//读取字符串
    	StringBuffer sb = new StringBuffer();
    	//当前读取行数
    	int rowcount = 1 ;
    	//要修改的行数
    	int updaterowcount = 2 ;
    	FileReader fr;
		try {
			String path = strDirPath+"/static/inxweb/css/less/theme.less";
			fr = new FileReader(path);
			BufferedReader br = new BufferedReader(fr);
			String line = br.readLine();
			while (line != null) {
				if(rowcount==updaterowcount&&StringUtils.isNotEmpty(color)){
					sb.append("@mColor:"+color+";");
				}else{
					sb.append(line);
				}
				line = br.readLine();
				//System.out.println(line);
				rowcount++;
			}
			br.close();
			fr.close();
			LessEngine engine = new LessEngine();
			FileWriter fw = new FileWriter(strDirPath+"/static/inxweb/css/theme.css");
			fw.write(engine.compile(sb.toString()));
			fw.close();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/theme/toupdate";
    }
}