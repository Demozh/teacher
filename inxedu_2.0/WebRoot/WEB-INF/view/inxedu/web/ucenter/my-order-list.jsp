<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<head>
<title>我的订单</title>
</head>
<body>
	<article class="col-7 fl">
		<div class="u-r-cont">
			<section>
				<div>
					<section class="c-infor-tabTitle c-tab-title">
						<a href="javascript: void(0)" title="Wo的订单" style="cursor: default;">Wo的订单</a>
						<a href="${ctx }/uc/order/myOrderList/SUCCESS" title="已完成" <c:if test="${state=='SUCCESS'}">class="current"</c:if> >已完成</a>
						<a href="${ctx }/uc/order/myOrderList/INIT" title="未完成" <c:if test="${state=='INIT'}">class="current"</c:if> >未完成</a>
						<a href="${ctx }/uc/order/myOrderList/CANCEL" title="已取消" <c:if test="${state=='CANCEL'}">class="current"</c:if> >已取消</a>
					</section>
				</div>
				<div class="mt40">
					<c:if test="${empty orderList }">
						<!-- /无数据提示 开始-->
						<section class="no-data-wrap">
							<em class="icon30 no-data-ico">&nbsp;</em>
							<span class="c-666 fsize14 ml10 vam">您还没有购买过课程！</span>
						</section>
						<!-- /无数据提示 结束-->
					</c:if>
					<div>
						<div class="u-order-wrap">
							<c:forEach items="${orderList}" var="order" varStatus="index">
								<dl>
									<dt>
										<span class="c-999 f-fM"><fmt:formatDate type="both" value="${order.createTime }" pattern="yyyy-MM-dd HH:mm"/></span>
										<span class="c-999 ml20"><tt class="f-fM">订单号：</tt><tt class="f-fM c-666">${order.orderNo}</tt></span>
									</dt>
									<dd class="u-order-list mt15">
										<section class="col-7 fl">
											<div class="ml10">
												<a href="${ctx }/front/couinfo/${order.courseId }" title="" class="u-ol-pic">
													<c:choose>
														<c:when test="${not empty order.courseLogo }">
															<img src="<%=staticImage %>${order.courseLogo}" alt="">
														</c:when>
														<c:otherwise>
															<img src="${ctx }/static/inxweb/img/default-img.gif" alt="">
														</c:otherwise>
													</c:choose>	
												</a>
												<h6 class="hLh30 txtOf"><a href="${ctx }/front/couinfo/${order.courseId }" title="" class="fsize14 c-666">${order.courseName }</a></h6>
												<section class="hLh30 txtOf">
													<p class="c-999 f-fA">${order.courseTitle }</p>
												</section>
											</div>
										</section>
										<section class="col-3 fl">
											<div class="tac">
												<p class="hLh30"><span class="fsize16 c-666 f-fG">￥${order.sumMoney }</span></p>
												<c:if test="${order.states=='SUCCESS'}">
													<p class="hLh20"><span class="c-999">已完成订单</span></p>
													<p class="hLh20"><a href="${ctx }/uc/play/${order.courseId }" class="c-green">立即学习</a></p>
												</c:if>
												<c:if test="${order.states=='INIT'}">
													<p class="hLh20 c-999 f-fA"><a href="${ctx}/zfbpay/order/againpay/${order.orderId}" target="_blank" class="c-blue f-fM">继续支付</a></p>
													<p><a href="${ctx}/uc/order/cancelOrder/${order.orderId}" class="c-999 f-fM">取消</a></p>
												</c:if>
												<c:if test="${order.states=='CANCEL'}">
													<p class="hLh20"><span class="c-999">已取消订单</span></p>
												</c:if>
											</div>
										</section>
										<div class="clear"></div>
									</dd>
								</dl>
							</c:forEach>
						</div>
						<!-- 公共分页 开始 -->
						<jsp:include page="/WEB-INF/view/common/front_page.jsp" />
						<!-- 公共分页 结束 -->
						<form action="${ctx}/uc/order/myOrderList/${state}" method="post" id="searchForm">
							<input type="hidden" name="page.currentPage" value="1" id="pageCurrentPage" />
						</form>
					</div>
				</div>
			</section>
			<!-- /我的课程 -->
		</div>
	</article>
	<!-- /右侧内容区 结束 -->
</body>
</html>