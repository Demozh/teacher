<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>个人中心</title>
</head>
<body>
<article class="col-7 fl">
	<div class="u-r-cont">
		<section>
			<div>
				<section class="c-infor-tabTitle c-tab-title">
					<a href="javascript: void(0)" title="Wo的课程" style="cursor: default;">Wo的课程</a>
					<a href="${ctx }/uc/index" title="收费课程">收费</a>
					<a href="${ctx }/uc/freeCourseList" title="免费课程" class="current">免费</a>
				</section>
			</div>
			<div class="mt40">
				<c:if test="${courseList==null || courseList.size()<=0 }">
					<!-- /无数据提示 开始-->
					<section class="no-data-wrap">
						<em class="icon30 no-data-ico">&nbsp;</em>
						<span class="c-666 fsize14 ml10 vam">暂无免费课程！</span>
					</section>
					<!-- /无数据提示 结束-->
				</c:if>
				<c:if test="${not empty courseList }">
					<div class="u-course-list">
						<article class="comm-course-list">
							<ul class="clearfix">
								<c:forEach items="${courseList}" var="course">
									<li>
										<div class="cc-l-wrap">
											<section class="course-img">
												<c:choose>
													<c:when test="${not empty course.logo}">
														<img src="<%=staticImage%>${course.logo}" class="img-responsive" alt="${course.courseName}" />
													</c:when>
													<c:otherwise>
														<img src="${ctx}/static/web/images/shopDefaultImage.png" class="img-responsive" alt="${course.courseName}" />
													</c:otherwise>
												</c:choose>
												<div class="cc-mask">
													<a href="${ctx}/uc/play/${course.courseId}" title="" class="comm-btn c-btn-1">继续学习</a>
												</div>
											</section>
											<h3 class="hLh30 txtOf mt10">
												<a href="${ctx}/uc/play/${course.courseId}" title="${course.courseName}" class="course-title fsize18 c-333">${course.courseName}</a>
											</h3>
										</div>
									</li>
								</c:forEach>
							</ul>
						</article>
						<!-- 公共分页 开始 -->
						<jsp:include page="/WEB-INF/view/common/front_page.jsp" />
						<!-- 公共分页 结束 -->
						<form method="post" id="searchForm" action="${ctx}/uc/freeCourseList">
							<input type="hidden" id="pageCurrentPage" name="page.currentPage" value="1" />
						</form>
					</div>
				</c:if>
			</div>
		</section>
		<!-- /我的课程 -->
	</div>
</article>
</body>
</html>