<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>上传ppt</title>
<script type="text/javascript" src="${ctx}/static/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctximg}/static/common/multilevel.js"></script>
<script type="text/javascript" src="${ctximg}/static/common/uploadify/swfobject.js"></script>
<script type="text/javascript" src="${ctximg}/static/common/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
<script type="text/javascript" src="${ctximg}/kindeditor/kindeditor-all.js"></script>
<script src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-1.10.4.custom.js"></script>
<script src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-timepicker-zh-CN.js"></script>

<%--验证框架--%>
<link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
<script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
<script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
<script type="text/javascript">
$(function(){
	initSimpleImageUpload('imageFile','ppt',callback);
});

/**
 * 后台ppt上传
 * @param btnId 上传组件的ID
 * @param param 图片上传目录名
 * @param callback 上传成功后的回调函数，函数接收一个参数（上传图片的URL）
 * @param pressText 是否上水印 false或空 否 true是
 */
function initSimpleImageUpload(btnId,param,callback,pressText){
	KindEditor.ready(function(K) {
		var uploadbutton = K.uploadbutton({
			button : K('#'+btnId+'')[0],
			fieldName : "uploadfile",
			url : '${ctx}/app/uploadapp?&param='+param+'&fileType=jpg,gif,png,jpeg&pressText='+pressText,
			afterUpload : function(data) {
				if (data.error == 0) {
					var url = K.formatUrl(data.url, 'absolute');//absolute,domain
					var imageSum = data.imageSum;
					callback(url,imageSum);
				} else {
					alert(data.message);
				}
			},
			afterError : function(str) {
				alert('自定义错误信息: ' + str);
			}
		});
		uploadbutton.fileBox.change(function(e) {
			uploadbutton.submit();
		});
	});
}

/**
 * 图片上传回调
 * @param imgUrl 图片路径
 */
function callback(imgUrl,imageSum){
	$("#pptImageUrl").val(imgUrl);
	$("#pptImageSum").val(imageSum);
	alert(imgUrl);
	alert("生成图片数"+imageSum);
}
    </script>
</head>
<body>
	<div class="pad20" style="background-color: #f0f0f0;">
		<form action="${ctx}/admin/cou/addCourse" method="post" id="saveCourseForm" data-validator-option="{stopOnError:false, timely:false}">
			<input type="hidden" name="" id="pptImageUrl"/>
			<input type="hidden" name="" id="pptImageSum"/>
			<table style="line-height: 35px;">
				<!-- <tr>
					<td>
						<font color="red">*</font>课程名称:
					</td>
					<td>
						<input name="course.courseName" type="text" style="width: 580px;" data-rule="required;"/>
					</td>
				</tr> -->
				
				<tr>
					<td>PPT：</td>
					<td style="text-align: left;">
						<input type="button" value="上传" id="imageFile" />
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input onclick="saveCourse()" class="button" type="button" value="保存" />
						<input onclick="history.go(-1);" class="button" type="button" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
