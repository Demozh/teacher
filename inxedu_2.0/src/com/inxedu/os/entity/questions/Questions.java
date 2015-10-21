package com.inxedu.os.entity.questions;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.common.util.StringUtils;

import lombok.Data;

/**
 * 问答
 */
@Data
public class Questions implements Serializable {
	private static final long serialVersionUID = 7687324559966427231L;
    private Long id;// 主键
    private Long cusId;// 创建者
    private String title;// 标题
    private String content;//内容
    private int type;// 分类 1课程问答 2 学习分享
    private int status;// 状态 0可回复1不可回复（采纳最佳答案后改为1 ）
    private int replyCount;// 回复数量
    private int browseCount;// 浏览次数
    private int praiseCount;//点赞数
    private Date addTime;// 添加时间
    
    private String orderFalg="addTime";//排序方式  最新addTime  热门replycount
    private String modelTime;//格式化显示时间
    private String showName;//用户名
    private String email;//用户邮箱
    private String picImg;//用户头像
    private List<QuestionsComment> questionsCommentList;//问答评论list
    private List<QuestionsTagRelation> questionsTagRelationList;//问答和问答标签关联list
    private Long questionsTagId;//问答标签id
    private Date beginCreateTime;//查询 开始添加时间
    private Date endCreateTime;//查询 结束添加时间
    private Long commentUserId;//用于查询我的回答
    
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
        //格式化显示时间
        this.modelTime = StringUtils.getModelDate(addTime);
    }
}
