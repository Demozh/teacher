package com.inxedu.os.edu.controller.appapi;

import com.inxedu.os.common.constants.CommonConstants;
import com.inxedu.os.common.controller.BaseController;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.RichTextRun;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.openxmlformats.schemas.drawingml.x2006.main.CTRegularTextRun;
import org.openxmlformats.schemas.drawingml.x2006.main.CTTextBody;
import org.openxmlformats.schemas.drawingml.x2006.main.CTTextCharacterProperties;
import org.openxmlformats.schemas.drawingml.x2006.main.CTTextFont;
import org.openxmlformats.schemas.drawingml.x2006.main.CTTextParagraph;
import org.openxmlformats.schemas.presentationml.x2006.main.CTGroupShape;
import org.openxmlformats.schemas.presentationml.x2006.main.CTShape;
import org.openxmlformats.schemas.presentationml.x2006.main.CTSlide;
import org.slf4j.LoggerFactory;
import org.springframework.common.util.DateUtils;
import org.springframework.common.util.FileUploadUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.awt.*;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * app接口 Controller
 * @author www.inxedu.com
 */
@Controller
public class AppApiController extends BaseController {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AppApiController.class);

	private static final String toAddPpt = getViewPath("/admin/course/add_ppt_to_image");//添加课程
	
	/**
     * 到上传ppt页面
     */
    @RequestMapping("/admin/cou/toAddPpt")
    public ModelAndView toAddPpt(HttpServletRequest request) {
    	ModelAndView model = new ModelAndView();
        try {
        	model.setViewName(toAddPpt);
        } catch (Exception e) {
        	model.setViewName(this.setExceptionRequest(request, e));
            logger.error("AppApiController.toAddPpt", e);
        }
        return model;
    }
    
    
    /**
	 * 上传ppt，生成图片
	 * @param request
	 * @param response
	 * @param uploadfile 文件数据
	 * @param param 参数据
	 * @param fileType 允许上传类型
	 * @param pressText 是否上水印
	 * @return
	 */
	@RequestMapping(value="/app/uploadapp",method={RequestMethod.POST})
	public String gok4(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="uploadfile" ,required=true) MultipartFile uploadfile,
			@RequestParam(value="param",required=false) String param,
			@RequestParam(value="fileType",required=true) String fileType,
			@RequestParam(value="pressText",required=false) String pressText){
		try{
			String[] type = fileType.split(",");
			//获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名  
			String ext = FileUploadUtils.getSuffix(uploadfile.getOriginalFilename()); 
			//获取文件路径
			String filePath = "/ppt/upload/";
			if(param!=null && param.trim().length()>0){
				filePath+=param;
			}else{
				filePath+=CommonConstants.projectName;
			}
			//当前时间命名路径
			String currentTime="/"+DateUtils.toString(new Date(), "yyyyMMdd")+"/"+System.currentTimeMillis();
			filePath+=currentTime+"."+ext;
			
			File file = new File(request.getSession().getServletContext().getRealPath("")+filePath);
			//如果目录不存在，则创建
			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();
			}
			//保存文件
			uploadfile.transferTo(file);
			//上水印
			if(pressText!=null && pressText.equals("true")){
				FileUploadUtils.pressText("inxedu", file.getPath(), file.getPath(), "Segoe Script", Font.BOLD, Color.BLUE,0.2f);
			}
			//生成图片保存路径
			String outImagePath="/ppt/ppt_to_image"+currentTime;
			
			file = new File(request.getSession().getServletContext().getRealPath("")+outImagePath);
			//如果目录不存在，则创建
			if(!file.exists()){
				file.mkdirs();
			}
			//ppt转图片
			int resultImageSum=createPPTImage(request.getSession().getServletContext().getRealPath("")+filePath,request.getSession().getServletContext().getRealPath("")+outImagePath);
			
			//返回数据
			return responseData(outImagePath,0,"上传成功",resultImageSum);
			
		}catch (Exception e) {
			logger.error("gok4()--error",e);
			return responseData("",2,"系统繁忙，上传失败",0);
		}
	}
	
	/**
	 * 返回数据
	 * @param path 文件路径
	 * @param error 状态 0成功 其状态均为失败
	 * @param message 提示信息
	 * @param imageSum 生成图片总数
	 * @return 回调路径 
	 */
	public String responseData(String path,int error,String message,int imageSum){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("url", path);
		map.put("imageSum", imageSum);
		map.put("error", error);
		map.put("message", message);
		String url = "redirect:" + CommonConstants.contextPath+ "/kindeditor/plugins/image/redirect.html?s=" + gson.toJson(map) + "#" + gson.toJson(map);
		return url;
	}
	
	/**
	 * 2007 pptx 
	 * @param in
	 * @param outImagePath
	 * @return
	 */
	public int create2007PPTImage(InputStream in,String outImagePath){
		int index=1;
        try {
            XMLSlideShow xmlSlideShow=new XMLSlideShow(in);
            
			Dimension pgsize = xmlSlideShow.getPageSize();
			
            XSLFSlide [] slides=xmlSlideShow.getSlides();
            for(XSLFSlide slide : slides){
                
                //设置字体为宋体，解决中文乱码问题
                CTSlide rawSlide=slide.getXmlObject();
                CTGroupShape gs = rawSlide.getCSld().getSpTree();
                CTShape[] shapes = gs.getSpArray();
                for (CTShape shape : shapes) {
                    CTTextBody tb = shape.getTxBody();
                    if (null == tb)
                        continue;
                    CTTextParagraph[] paras = tb.getPArray();
                    CTTextFont font=CTTextFont.Factory.parse(
                            "<xml-fragment xmlns:a=\"http://schemas.openxmlformats.org/drawingml/2006/main\" xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\" xmlns:p=\"http://schemas.openxmlformats.org/presentationml/2006/main\">"+
                            "<a:rPr lang=\"zh-CN\" altLang=\"en-US\" dirty=\"0\" smtClean=\"0\"> "+
                                "<a:latin typeface=\"+mj-ea\"/> "+
                              "</a:rPr>"+
                            "</xml-fragment>");
                    for (CTTextParagraph textParagraph : paras) {
                        CTRegularTextRun[] textRuns = textParagraph.getRArray();
                        for (CTRegularTextRun textRun : textRuns) {
                            CTTextCharacterProperties properties=textRun.getRPr();
                            properties.setLatin(font);
                        }
                    }
                }
                
                BufferedImage img=new BufferedImage(pgsize.width,pgsize.height, BufferedImage.TYPE_INT_RGB);
                Graphics2D graphics=img.createGraphics();
                graphics.setPaint(Color.WHITE);
                graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
                slide.draw(graphics);
                
                FileOutputStream out = new FileOutputStream(outImagePath+"/"+index+".jpeg");   
                javax.imageio.ImageIO.write(img, "jpeg", out);   
                out.close();   
                index++;
            }
            System.out.println("生成2007ppt success");
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return index-1;
    }
    
    /**
     * 2003 ppt
     * @param in
     * @param outImagePath
     * @return
     */
    public  int create2003PPTImage(InputStream in,String outImagePath){
    	int index=1;
        try {
            SlideShow slideShow=new SlideShow(in);
            
            Slide[] slides=slideShow.getSlides();
			Dimension pgsize = slideShow.getPageSize();
            for(Slide slide : slides){
            	TextRun[] truns = slide.getTextRuns();
				for (int k = 0; k < truns.length; k++) {
					RichTextRun[] rtruns = truns[k].getRichTextRuns();
					for (int l = 0; l < rtruns.length; l++) {
						int qwe = rtruns[l].getFontIndex();
						String name = rtruns[l].getFontName();
						int fontsize=rtruns[l].getFontSize();
						rtruns[l].setFontIndex(l+1);
						rtruns[l].setFontName("宋体");
						if (fontsize==0) {//解决 32号字体 不显示
							rtruns[l].setFontSize(32);
						}
						//输出内容
						//System.out.println(rtruns[l].getText());
					}
				}
                BufferedImage img=new BufferedImage(pgsize.width,pgsize.height, BufferedImage.TYPE_INT_RGB);
                Graphics2D graphics=img.createGraphics();
                graphics.setPaint(Color.WHITE);
                graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
                slide.draw(graphics);
                
                FileOutputStream out = new FileOutputStream(outImagePath+"/"+index+".jpeg");   
                javax.imageio.ImageIO.write(img, "jpeg", out);   
                out.close();   
                index++;
            }
            System.out.println("生成2003ppt success");
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return index-1;
    }
    
    /**
     * 
     * @param filePath ppt原文件相对路径
     * @param outImagePath 生成ppt 图片的相对路径
     * @return 返回生成的图片总数
     */
    public int createPPTImage(String filePath,String outImagePath){
        try {
        	InputStream in=new FileInputStream(new File(filePath));
            if(!in.markSupported()){
                in=new BufferedInputStream(in);
            }
            if(in.markSupported()){
                in=new PushbackInputStream(in,8);
            }
            if(POIFSFileSystem.hasPOIFSHeader(in)){//2003
               return create2003PPTImage(in,outImagePath);
            }else if(POIXMLDocument.hasOOXMLHeader(in)){//2007
               return create2007PPTImage(in,outImagePath);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
