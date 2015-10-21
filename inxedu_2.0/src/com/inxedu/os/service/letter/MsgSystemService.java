package com.inxedu.os.service.letter;

import java.util.Date;
import java.util.List;

import org.springframework.common.entity.PageEntity;

import com.inxedu.os.entity.letter.MsgSystem;

/**
 * @author : xiaokun
 * @ClassName com.yizhilu.os.sns.service.letter.MsgSenderService
 * @description 站内信的发件箱service
 * @Create Date : 2014-1-26 下午1:53:44
 */
public interface MsgSystemService {

    /**
     * 添加系统消息
     *
     * @param msgSystem
     * @return
     * @throws Exception
     */
    public Long addMsgSystem(MsgSystem msgSystem) throws Exception;

    /**
     * 批量添加系统消息
     *
     * @param msgSystemList 消息的list
     */
    public void addMsgSystemBatch(List<MsgSystem> msgSystemList);

    /**
     * 查询系统消息
     *
     * @param msgSystem
     * @return
     * @throws Exception
     */
    public List<MsgSystem> queryMsgSystemList(MsgSystem msgSystem, PageEntity page) throws Exception;

    /**
     * 通过id删除系统消息
     *
     * @param msgSystem
     * @return
     * @throws Exception
     */
    public Long delMsgSystemById(Long id) throws Exception;


    /**
     * 查询大于传入的时间的系统系统消息
     *
     * @param msgSystem
     * @return
     * @throws Exception
     */
    public List<MsgSystem> queryMSListByLT(Date lastTime) throws Exception;

    /**
     * 检查系统消息过期更新字段 删除过期的站内信
     *
     * @param msgSystem
     * @return
     * @throws Exception
     */
    public void updatePast() throws Exception;

}
