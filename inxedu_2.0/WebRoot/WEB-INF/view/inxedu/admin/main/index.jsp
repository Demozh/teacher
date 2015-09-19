<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" http-equiv="Content-Type" />
<title>资讯后台管理系统 - 因酷在线教育软件 - 在线教育整体解决方案提供商</title>
</head>
<body style="background: none;">
	<div class="rMain" style="margin-top: 8px">
		<h1>
			欢迎你,
			<span>超级管理员</span>
			!
		</h1>
		<p>点击快捷入口即可管理操作！</p>

		<div class="pad20">
			<!-- Big buttons -->
			<ul class="dash">
				<li>
					<a class="tooltip" title="新增课程" href="${ctx}/admin/cou/toAddCourse">
						<img alt="" src="${ctx}/static/admin/assets/icons/4_48x48.png">
						<span>新增课程</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/article/initcreate" target="content" title="新增文章" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/8_48x48.png" alt="" />
						<span>新增文章</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/article/showlist" target="content" title="文章列表" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/7_48x48.png" alt="" />
						<span>文章列表</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/sysuser/userlist" title="管理用户" target="content" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/16_48x48.png" alt="" />
						<span>管理用户</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/website/imagesPage" title="媒体图片管理" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/20_48x48.png" alt="" />
						<span>媒体图片管理</span>
					</a>
				</li>
			</ul>
			<!-- End of Big buttons -->
		</div>
	</div>
</body>
</html>