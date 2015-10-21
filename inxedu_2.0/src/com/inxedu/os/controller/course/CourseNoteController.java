package com.inxedu.os.controller.course;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inxedu.os.common.controller.BaseController;
import org.springframework.common.entity.PageEntity;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.entity.course.CourseNote;
import com.inxedu.os.entity.course.QueryCourseNote;
import com.inxedu.os.service.course.CourseNoteService;
/**
 * CourseNote Controller
 */
@Controller
public class CourseNoteController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(CourseNoteController.class);
 	@Autowired
    private CourseNoteService courseNoteService;
    
    private static final String getUserCourseNote=getViewPath("/ucenter/coursenote_list");
    /**
     * 查询该用户笔记
     * 
     * @return
     */
    @RequestMapping("/courseNote/ajax/querynote")
    @ResponseBody
    public Map<String, Object> querynote(HttpServletRequest request, @RequestParam("kpointId") Long kpointId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            //通过节点id和用户id查询笔记
            CourseNote courseNote = courseNoteService.getCourseNoteByKpointIdAndUserId(kpointId, Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));
            map.put("courseNote", courseNote);
            map.put("courseNote1", 1);
        } catch (Exception e) {
            logger.error("CourseNoteController.querynote()", e);
            map.put("message", "false");
            return map;
        }
        return map;
    }
    /**
     * 添加笔记
     * 
     * @return
     */
    @RequestMapping("/courseNote/ajax/addnote")
    @ResponseBody
    public Map<String, Object> addnote(HttpServletRequest request, @ModelAttribute("courseNote") CourseNote courseNote) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            //添加笔记（如果笔记存在则更新不存在则添加）
            courseNote.setUpdateTime(new Date());
            courseNote.setUserId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));
            String falg = courseNoteService.addCourseNote(courseNote);
            map.put("message", falg);
        } catch (Exception e) {
            logger.error("CourseNoteController.addnote", e);
            map.put("message", "false");
            return map;
        }
        return map;
    }
    
    
    
    
    
    

    /**
     * 获得用户课程笔记 前台
     * @param request
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("/uc/note")
    public String getUserCourseNote(HttpServletRequest request,Model model,@ModelAttribute("page") PageEntity page){
    	try{
    		this.setPage(page);
    		this.getPage().setPageSize(3);
    		List<QueryCourseNote> courseNoteList=courseNoteService.getUserCourseNoteByUserId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)), this.getPage());
    		model.addAttribute("courseNoteList", courseNoteList);
    		model.addAttribute("page", this.getPage());
    	}catch(Exception e){
    		logger.error("getUserCourseNote", e);
    		return setExceptionRequest(request, e);
    	}
    	return getUserCourseNote;
    }
    
}