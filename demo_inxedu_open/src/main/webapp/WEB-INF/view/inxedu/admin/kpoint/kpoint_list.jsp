<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>课程节点</title>
<link type="text/css" rel="stylesheet" href="${ctx}/static/common/ztree/css/zTreeStyle.css" />
<script type="text/javascript" src="${ctx}/static/common/ztree/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/static/common/ztree/jquery.ztree.excheck-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/static/common/ztree/jquery.ztree.exedit-3.5.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/kindeditor/themes/default/default.css" />
	<script type="text/javascript" src="${ctx}/kindeditor/kindeditor-all.js"></script>
<script type="text/javascript" src="${ctx}/static/admin/kpoint/kpoint.js"></script>
<script type="text/javascript" src="${ctx}/static/admin/teacher/select_teacher_list.js"></script>

<script type="text/javascript" src="${ctx}/static/common/uploadify/ccswfobject.js"></script>
<style type="text/css">
#swfDiv embed {
	position: absolute;
	z-index: 1;
}
#swfDiv{*position:absolute; z-index:2;}
</style>
<script type="text/javascript">
		var ztree='${kpointList}';
		$(function(){
			showKpointZtree(ztree);
			//文本编辑框
			initKindEditor_addblog('content', 580, 350,'courseContxt','true');
		});
	</script>
</head>
<body>
<div class="mt20">
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="commonTab01">
		<thead>
		<tr>
			<th colspan="2" align="left">
				<span>${courseSellType}节点管理</span>
				<font color="red">*视频节点只支持二级</font>
			</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td width="20%">
				<fieldset style="height: 662px;">
					<legend>
						<span>${courseSellType}节点管理</span>
						&gt;
						<span>节点列表</span>
					</legend>
					<div class="mt20">
						<div class="commonWrap">
							<div id="kpointList" class="ztree"></div>
							<a title="创建视频节点" onclick="addaKpoint(${courseId});" class="button tooltip" href="javascript:void(0)">
								<span></span>
								创建视频节点
							</a>
							<a title="取消选中" onclick="ztreeCancelSelectedNode();" class="button tooltip" href="javascript:void(0)">
								<span></span>
								取消选中
							</a>
						</div>
					</div>
				</fieldset>

			</td>
			<td width="80%"  >
				<fieldset id="updateWin" style="display: none; height: 662px;">
					<legend>
						&gt;
						<span>编辑节点</span>
					</legend>
					<div class="mt20">
						<div class="commonWrap">
							<form id="updateForm">
								<input type="hidden" name="courseKpoint.kpointId" />
								<input type="hidden" id="courseId" />
								<input type="hidden" name="courseKpoint.atlas" value="" id="atlas" />
								<input type="hidden" name="courseKpoint.atlasThumbnail" value="" id="atlasThumbnail" />
								<table style="line-height: 35px;" width="100%" cellspacing="0" cellpadding="0" border="0" class="commonTab01">
									<tr>
										<td>节点名称:</td>
										<td style="text-align: left;">
											<input name="courseKpoint.name" type="text" />
										</td>
									</tr>
									<tr>
										<td>节点类型:</td>
										<td style="text-align: left;">
											<select id="courseKpointKpointType" name="courseKpoint.kpointType" onchange="kpointTypeChange()">
												<option value="0">目录</option>
												<option value="1">章节</option>
											</select>
										</td>
									</tr>
									<tr style="display:none" class="tr_all">
										<td>课件类型:</td>
										<td style="text-align: left;">
											<select id="fileType" name="courseKpoint.fileType" onchange="chooseFileType()">
												<option value="VIDEO">视频</option>
												<option value="TXT">文本</option>
											</select>
										</td>
									</tr>
									<tr style="display:none" class="tr_all videoType ">
										<td>视频类型:</td>
										<td style="text-align: left;">
											<select id="courseKpointVideoType" name="courseKpoint.videoType" >
												<%--<option value="">--请选择--</option>--%>
												<option value="INXEDUVIDEO">因酷云</option>
												<%--<option value="baofeng">暴风</option>--%>
												<option value="IFRAME">其他</option>
												<option value="CC">CC视频</option>
											</select>
										</td>
									</tr>
									<tr class="uploadCCVideo tr_fileType_control" style="display:none">
										<td>上传CC视频:</td>
										<td style="text-align: left;">
											<div id="swfDiv" style="*position:absolute; z-index:2;float:left;z-index: 1000;cursor: pointer; margin-top:5px;"></div><input type="button" value="上传" id="btn_width" style="width: 80px; height: 25px;"/>
											<input type="hidden" id="upload_title" minlength="0">
											<input type="hidden"  id="upload_tag" minlength="0">
											<input type="hidden"  id="upload_desp" minlength="0">
											<script type="text/javascript">
												// 加载上传flash ------------- start
												var swfobj=new SWFObject('http://union.bokecc.com/flash/api/uploader.swf', 'uploadswf', '80', '25', '8');
												swfobj.addVariable( "progress_interval" , 1);	//	上传进度通知间隔时长（单位：s）
												swfobj.addVariable( "notify_url" , "");	//	上传视频后回调接口
												swfobj.addParam('allowFullscreen','true');
												swfobj.addParam('allowScriptAccess','always');
												swfobj.addParam('wmode','transparent');
												swfobj.write('swfDiv');
												// 加载上传flash ------------- end
											</script>
										</td>
									</tr>
									<tr class=" tr_fileType_control uploadCCVideo" style="display:none">
										<td>上传进度:</td>
										<td style="text-align: left;">
											<span id="up">无</span>
										</td>
									</tr>
									<tr style="display:none" class="tr_all videoType">
										<td id="videoUrlTitle">视频地址:</td>
										<td style="text-align: left;">
											<input type="text" name="courseKpoint.videoUrl" id="videourl" value="" style="width: 360px;"/>
									</tr>
									<tr class="tr_all txtContent" style="display: none;">
										<td>文本内容:</td>
										<td><textarea id="content" name="courseKpoint.content" rows="" cols=""></textarea></td>
									</tr>

									<tr>
										<td>排序:</td>
										<td>
											<input type="text" value="0" name="courseKpoint.sort" />
										</td>
									</tr>
									<tr class="tr_all videoType">
										<td>播放次数:</td>
										<td>
											<input type="text" value="0" name="courseKpoint.playCount" disabled="disabled" readonly=""readonly/>
										</td>
									</tr>
									<tr class="tr_all videoType" id="timeLongTr">
										<td>播放时间:</td>
										<td>
											<input type="text" value="00:00" name="courseKpoint.playTime" />
										</td>
									</tr>
									<tr class="tr_all videoType">
										<td>是否免费:</td>
										<td style="text-align: left;" id="isfree">
											<input type="radio" name="courseKpoint.free" value="1" />
											是
											<input type="radio" name="courseKpoint.free" value="2" />
											否
											<font color="red vam ml10">文档、文本格式、图片集、音频等格式暂不支持试听</font>
										</td>
									</tr>
									<tr class="tr_all videoType" id="teacherTr">
										<td>视频讲师:</td>
										<td style="text-align: left;">
											<input type="hidden" name="courseKpoint.teacherId" value="0" />
											<p id="teacher" style="margin: 0 0 0em;"></p>
											<a href="javascript:void(0)" onclick="selectTeacher('radio')">选择老师</a>
										</td>
									</tr>

									<tr>
										<td colspan="2">
											<button class="ui-state-default ui-corner-all" style="float: left;" onclick="updateKpoint()" type="button">确定</button>
											<button class="ui-state-default ui-corner-all closeBut" style="float: left;" type="button">取消</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left">

			</td>
		</tr>
		</tbody>
	</table>
</div>
	<!-- 修改视频节点信息窗口，结束 -->
</body>
</html>