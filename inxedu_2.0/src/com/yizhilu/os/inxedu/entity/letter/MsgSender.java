package com.yizhilu.os.inxedu.entity.letter;

import com.yizhilu.os.inxedu.entity.user.User;

import java.io.Serializable;
import java.util.Date;


/**
 * @description 站内信
 */
public class MsgSender implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = -2972088766561758830L;
    private Long id;// 主键Id
    private Long cusId;// 发信人用户id
    private String content;// 信内容
    private Long receivingCusId;// 收信人id
    private Date addTime;// 添加时间
    private Date updateTime;// 更新时间
    private int type;// 类型2站内信
    private int status;//
    private String showname;// 会员名
    private User userExpandDto;// 用户信息

    public MsgSender() {
    }

    public static long getSerialVersionUID() {
        return MsgSender.serialVersionUID;
    }

    public Long getId() {
        return this.id;
    }

    public Long getCusId() {
        return this.cusId;
    }

    public String getContent() {
        return this.content;
    }

    public Long getReceivingCusId() {
        return this.receivingCusId;
    }

    public Date getAddTime() {
        return this.addTime;
    }

    public Date getUpdateTime() {
        return this.updateTime;
    }

    public int getType() {
        return this.type;
    }

    public int getStatus() {
        return this.status;
    }

    public String getShowname() {
        return this.showname;
    }

    public User getUserExpandDto() {
        return this.userExpandDto;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCusId(Long cusId) {
        this.cusId = cusId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setReceivingCusId(Long receivingCusId) {
        this.receivingCusId = receivingCusId;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setShowname(String showname) {
        this.showname = showname;
    }

    public void setUserExpandDto(User userExpandDto) {
        this.userExpandDto = userExpandDto;
    }

    public String toString() {
        return "com.yizhilu.os.inxedu.entity.letter.MsgSender(id=" + this.id + ", cusId=" + this.cusId + ", content=" + this.content + ", receivingCusId=" + this.receivingCusId + ", addTime=" + this.addTime + ", updateTime=" + this.updateTime + ", type=" + this.type + ", status=" + this.status + ", showname=" + this.showname + ", userExpandDto=" + this.userExpandDto + ")";
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof MsgSender)) return false;
        final MsgSender other = (MsgSender) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$cusId = this.getCusId();
        final Object other$cusId = other.getCusId();
        if (this$cusId == null ? other$cusId != null : !this$cusId.equals(other$cusId)) return false;
        final Object this$content = this.getContent();
        final Object other$content = other.getContent();
        if (this$content == null ? other$content != null : !this$content.equals(other$content)) return false;
        final Object this$receivingCusId = this.getReceivingCusId();
        final Object other$receivingCusId = other.getReceivingCusId();
        if (this$receivingCusId == null ? other$receivingCusId != null : !this$receivingCusId.equals(other$receivingCusId))
            return false;
        final Object this$addTime = this.getAddTime();
        final Object other$addTime = other.getAddTime();
        if (this$addTime == null ? other$addTime != null : !this$addTime.equals(other$addTime)) return false;
        final Object this$updateTime = this.getUpdateTime();
        final Object other$updateTime = other.getUpdateTime();
        if (this$updateTime == null ? other$updateTime != null : !this$updateTime.equals(other$updateTime))
            return false;
        if (this.getType() != other.getType()) return false;
        if (this.getStatus() != other.getStatus()) return false;
        final Object this$showname = this.getShowname();
        final Object other$showname = other.getShowname();
        if (this$showname == null ? other$showname != null : !this$showname.equals(other$showname)) return false;
        final Object this$userExpandDto = this.getUserExpandDto();
        final Object other$userExpandDto = other.getUserExpandDto();
        if (this$userExpandDto == null ? other$userExpandDto != null : !this$userExpandDto.equals(other$userExpandDto))
            return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 0 : $id.hashCode());
        final Object $cusId = this.getCusId();
        result = result * PRIME + ($cusId == null ? 0 : $cusId.hashCode());
        final Object $content = this.getContent();
        result = result * PRIME + ($content == null ? 0 : $content.hashCode());
        final Object $receivingCusId = this.getReceivingCusId();
        result = result * PRIME + ($receivingCusId == null ? 0 : $receivingCusId.hashCode());
        final Object $addTime = this.getAddTime();
        result = result * PRIME + ($addTime == null ? 0 : $addTime.hashCode());
        final Object $updateTime = this.getUpdateTime();
        result = result * PRIME + ($updateTime == null ? 0 : $updateTime.hashCode());
        result = result * PRIME + this.getType();
        result = result * PRIME + this.getStatus();
        final Object $showname = this.getShowname();
        result = result * PRIME + ($showname == null ? 0 : $showname.hashCode());
        final Object $userExpandDto = this.getUserExpandDto();
        result = result * PRIME + ($userExpandDto == null ? 0 : $userExpandDto.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof MsgSender;
    }
}
