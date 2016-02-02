package com.inxedu.os.common.controller;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.common.util.DateUtils;
import org.springframework.common.util.FileUploadUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.inxedu.os.common.constants.CommonConstants;

/**
 * @author www.inxedu.com
 *
 */
@Controller
@RequestMapping("/image")
public class ImageUploadController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(ImageUploadController.class);
	private List<String> fileTypeList;
	
	/**
	 * 图片上传，原图保存
	 * @param request
	 * @param response
	 * @param uploadfile 文件数据
	 * @param param 参数据
	 * @param fileType 允许上传类型
	 * @param pressText 是否上水印
	 * @return
	 */
	@RequestMapping(value="/gok4",method={RequestMethod.POST})
	public String gok4(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="uploadfile" ,required=true) MultipartFile uploadfile,
			@RequestParam(value="param",required=false) String param,
			@RequestParam(value="fileType",required=true) String fileType,
			@RequestParam(value="pressText",required=false) String pressText){
		try{
			String[] type = fileType.split(",");
			//设置图片类型
			setFileTypeList(type);
			//获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名  
			String ext = FileUploadUtils.getSuffix(uploadfile.getOriginalFilename()); 
			if(!fileType.contains(ext)){
				return responseData("",1,"文件格式错误，上传失败");
			}
			//获取文件路径
			String filePath = getPath(request,ext,param);
			
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
			//返回数据
			return responseData(filePath,0,"上传成功");
			
		}catch (Exception e) {
			logger.error("gok4()--error",e);
			return responseData("",2,"系统繁忙，上传失败");
		}
	}
	
	/**
	 * 编辑器图片上传，原图保存
	 * @param request
	 * @param response
	 * @param uploadfile 文件数据
	 * @param param 参数据
	 * @param fileType 允许上传类型
	 * @param pressText 是否上水印
	 * @return
	 */
	@RequestMapping(value="/keupload",method={RequestMethod.POST})
	public String kindEditorUpload(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="param",required=false) String param,
			@RequestParam(value="fileType",required=true) String fileType,
			@RequestParam(value="pressText",required=false) String pressText){
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
			MultipartFile imgFile = multipartRequest.getFile("imgFile");
			if(imgFile==null){
				return responseData("",1,"请选择上传的文件，上传失败");
			} 
			String[] type = fileType.split(",");
			//设置图片类型
			setFileTypeList(type);
			//获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名  
			String ext = FileUploadUtils.getSuffix(imgFile.getOriginalFilename()); 
			if(!fileType.contains(ext)){
				return responseData("",1,"文件格式错误，上传失败");
			}
			//获取文件路径
			String filePath = getPath(request,ext,param);
			
			File file = new File(request.getSession().getServletContext().getRealPath("")+filePath);
			//如果目录不存在，则创建
			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();
			}
			//保存文件
			imgFile.transferTo(file);
			//上水印
			if(pressText!=null && pressText.equals("true")){
				FileUploadUtils.pressText("inxedu", file.getPath(), file.getPath(), "Segoe Script", Font.BOLD, Color.BLUE,0.2f);
			}
			//返回数据
			return responseData(filePath,0,"上传成功");
			
		}catch (Exception e) {
			logger.error("kindEditorUpload()--error",e);
			return responseData("",2,"系统繁忙，上传失败");
		}
	}
	
	/**
	 * 用户头像上传
	 */
	@RequestMapping({ "/saveface" })
	@ResponseBody
	public String saveface(HttpServletRequest request,HttpServletResponse response) {
		try {
			String photoPath = request.getParameter("photoPath");
			
			//原图片的宽（现显示的宽度，非原图片宽度）
			int imageWidth = Integer.parseInt(request.getParameter("txt_width"));
			//原图片的高（现显示的高度，非原图片高度）
			int imageHeight = Integer.parseInt(request.getParameter("txt_height"));
			
			//因页面显示关系，需要转换图片大小（转成现页面显示的图片大小）
			FileUploadUtils.changeSize(request.getSession().getServletContext().getRealPath("")+photoPath,request.getSession().getServletContext().getRealPath("")+photoPath,imageWidth,imageHeight);
			
			//选中区域距离顶部的大小
			int cutTop = Integer.parseInt(request.getParameter("txt_top"));
			//选中区域距离左边的大小
			int cutLeft = Integer.parseInt(request.getParameter("txt_left"));

			//选中区域的宽
			int dropWidth = Integer.parseInt(request.getParameter("txt_DropWidth"));
			//选中区域的高
			int dropHeight = Integer.parseInt(request.getParameter("txt_DropHeight"));
			
			String ext = FileUploadUtils.getSuffix(photoPath); 
			String newPath = getPath(request,ext,"customer");
			FileUploadUtils.cut(request.getSession().getServletContext().getRealPath("")+photoPath, request.getSession().getServletContext().getRealPath("")+newPath, cutLeft, cutTop, dropWidth, dropHeight);
			
			//上传剪裁完成后，删除模板图片
			File file = new File(request.getSession().getServletContext().getRealPath("")+photoPath);
			if(file.exists()){
				file.delete();
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("src",newPath);
			map.put("status","1");
			return gson.toJson(map);
		} catch (Exception e) {
			logger.error("saveface()---error", e);
		}
		return null;
	}
	
	
	/**
	 * 删除文件
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteFile(HttpServletRequest request,@RequestParam(value="filePath",required=true) String filePath){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			if(filePath!=null && filePath.trim().length()>0 && filePath.startsWith("/images/upload/")){
				File file = new File(request.getSession().getServletContext().getRealPath("")+filePath);
				if(file.exists()){
					file.delete();
					json = this.setJson(true, "文件删除成功", null);
				}else{
					json = this.setJson(false, "文件不存在，删除失败", null);
				}
			}else{
				json = this.setJson(false, "删除失败", null);
			}
		}catch (Exception e) {
			json = this.setJson(false, "系统繁忙，文件删除失败", null);
			logger.error("deleteFile()--error",e);
		}
		return json;
	}
	
	//--------------------------------------------------------------------------------------
	
	/**
	 * 获取文件保存的路径
	 * @param request
	 * @param ext 文件后缀
	 * @param param 传入参数
	 * @return 返回文件路径
	 */
	private String getPath(HttpServletRequest request,String ext,String param){
		String filePath = "/images/upload/";
		if(param!=null && param.trim().length()>0){
			filePath+=param;
		}else{
			filePath+=CommonConstants.projectName;
		}
		filePath+="/"+DateUtils.toString(new Date(), "yyyyMMdd")+"/"+System.currentTimeMillis()+"."+ext;
		return filePath;
	}
	
	/**
	 * 返回数据
	 * @param path 文件路径
	 * @param error 状态 0成功 其状态均为失败
	 * @param message 提示信息
	 * @return 回调路径 
	 */
	public String responseData(String path,int error,String message){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("url", path);
		map.put("error", error);
		map.put("message", message);
		String url = "redirect:" + CommonConstants.contextPath+ "/kindeditor/plugins/image/redirect.html?s=" + gson.toJson(map) + "#" + gson.toJson(map);
		return url;
	}
	
	/**
	 * 设置图片类型
	 */
	public void setFileTypeList(String[] type){
		fileTypeList = new ArrayList<String>();
		for(String _t : type){
			fileTypeList.add(_t);
		}
	}
	
}
