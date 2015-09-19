var subjectList;
var setting = {
	view : {
		showLine : true,
		showIcon : true,
		selectedMulti : false
	},
	data : {
		simpleData : {
			enable : true,
			idKey : 'subjectId',
			pIdKey : 'parentId',
			rootPid : ''
		},
		key : {
			name : 'subjectName',
			title : 'subjectName'
		}
	},
	callback : {
		onClick:seleSubject
	}
};
$(function() {
	initSimpleImageUpload('fileuploadButton', 'teacher', callback);
	subjectList = eval('('+subjectList+')');
	var treeObj = $.fn.zTree.init($("#ztreedemo"), setting, subjectList);
});


function callback(imgUrl) {
	$("#imagesUrl").val(imgUrl);
	$("#subjcetpic").attr("src", imagesPath + imgUrl);
}

/**
 * 选择专业
 */
function seleSubject(event, treeId, treeNode){
	$("#subjectId").val(treeNode.subjectName);
	$("input[name='teacher.subjectId']").val(treeNode.subjectId);
	$("#ztreedemo").hide();
}

/**
 * 显示专业组件
 */
function showSubjectList(){
	$("#ztreedemo").show();
}
/**
 * 保存讲师信息
 */
function teacherFormSubmit() {
	var name = $("input[name='teacher.name']").val();
	if (name == null || $.trim(name) == '') {
		alert('请填写讲师名！');
		return false;
	}
	var education = $("textarea[name='teacher.education']").val();
	if (education == null || $.trim(education) == '') {
		alert('请填写讲师资历！');
		return false;
	}
	var subjectId = $("input[name='teacher.subjectId']").val();
	if(subjectId<=0){
		alert("请选择讲师专业！");
		return false;
	}
	var sort = $("input[name='teacher.sort']").val();
	if(!(/^\d+$/.test(sort))){
		alert("讲师排序值必须是正整数！")
		return false;
	}
	var career = $("textarea[name='teacher.career']").val();
	if (career == null || $.trim(career) == '') {
		alert('请填写讲师简介！');
		return false;
	}
	$("#saveTeacherForm").submit();
}