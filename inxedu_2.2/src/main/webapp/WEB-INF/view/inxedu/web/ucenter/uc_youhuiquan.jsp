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
						<a href="javascript: void(0)" title="Wo的订单" style="cursor: default;">Wo的优惠券</a>
						<a href="" title="已完成" <c:if test="${state=='SUCCESS'}">class="current"</c:if> >未使用</a>
						<a href="" title="未完成" <c:if test="${state=='INIT'}">class="current"</c:if> >已使用</a>
						<a href="" title="已取消" <c:if test="${state=='CANCEL'}">class="current"</c:if> >已过期</a>
					</section>
				</div>
				<div class="mt40">
					<c:if test="${empty orderList }">
						<!-- /无数据提示 开始-->
						<section class="no-data-wrap">
							<em class="icon30 no-data-ico">&nbsp;</em>
							<span class="c-666 fsize14 ml10 vam">很遗憾！你还没有优惠券哦</span>
						</section>
						<!-- /无数据提示 结束-->
					</c:if>
					<div class="coupon-box-wrap">
						<!-- 优惠券未使用开始 -->
						<div class="mt20 of ml30">
							<ul class="coupon-list">
								<li>
									<div class="clearfix">
										<div class="fl coupon-left">
											<div><span class="cou-left-num">编码：120983463236</span></div>
											<div class="c-mon-wrap"><span class="cou-money"><font>￥</font><tt class="f-fG">50</tt></span></div>
											<p class="c-666 f-fM mt10">有效期：2014-06-24~2015-02-16</p>
										</div>
										<div class="fl coupon-right">
											<img src="/static/inxweb/img/coupon.png">
										</div>
									</div>
								</li>
								<li>
									<div class="clearfix">
										<div class="fl coupon-left">
											<div><span class="cou-left-num">编码：120983463236</span></div>
											<div class="c-mon-wrap"><span class="cou-money"><font>￥</font><tt class="f-fG">50</tt></span></div>
											<p class="c-666 f-fM mt10">有效期：2014-06-24~2015-02-16</p>
										</div>
										<div class="fl coupon-right">
											<img src="/static/inxweb/img/coupon.png">
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!-- 优惠券未使用结束 -->
						<!-- 优惠券已过期开始 -->
						<div class="mt20 of ml30">
							<ul class="coupon-list expired-state">
								<li>
									<div class="clearfix">
										<div class="fl coupon-left">
											<div><span class="cou-left-num">编码：120983463236</span></div>
											<div class="c-mon-wrap"><span class="cou-money"><font>￥</font><tt class="f-fG">50</tt></span></div>
											<p class="c-666 f-fM mt10">有效期：2014-06-24~2015-02-16</p>
										</div>
										<div class="fl coupon-right">
											<img src="/static/inxweb/img/coupon.png">
										</div>
									</div>
									<div class="exp-chapter"><img src="/static/inxweb/img/coupon-expired.png"></div>
								</li>
								<li>
									<div class="clearfix">
										<div class="fl coupon-left">
											<div><span class="cou-left-num">编码：120983463236</span></div>
											<div class="c-mon-wrap"><span class="cou-money"><font>￥</font><tt class="f-fG">50</tt></span></div>
											<p class="c-666 f-fM mt10">有效期：2014-06-24~2015-02-16</p>
										</div>
										<div class="fl coupon-right">
											<img src="/static/inxweb/img/coupon.png">
										</div>
									</div>
									<div class="exp-chapter"><img src="/static/inxweb/img/coupon-expired.png"></div>
								</li>
							</ul>
						</div>
						<!-- 优惠券已过期结束 -->
						<!-- 优惠券已使用开始 -->
						<div class="mt20 of ml30">
							<ul class="coupon-list expired-state">
								<li>
									<div class="clearfix">
										<div class="fl coupon-left">
											<div><span class="cou-left-num">编码：120983463236</span></div>
											<div class="c-mon-wrap"><span class="cou-money"><font>￥</font><tt class="f-fG">50</tt></span></div>
											<p class="c-666 f-fM mt10">有效期：2014-06-24~2015-02-16</p>
										</div>
										<div class="fl coupon-right">
											<img src="/static/inxweb/img/coupon.png">
										</div>
									</div>
									<div class="exp-chapter"><img src="/static/inxweb/img/cou-used.png"></div>
								</li>
								<li>
									<div class="clearfix">
										<div class="fl coupon-left">
											<div><span class="cou-left-num">编码：120983463236</span></div>
											<div class="c-mon-wrap"><span class="cou-money"><font>￥</font><tt class="f-fG">50</tt></span></div>
											<p class="c-666 f-fM mt10">有效期：2014-06-24~2015-02-16</p>
										</div>
										<div class="fl coupon-right">
											<img src="/static/inxweb/img/coupon.png">
										</div>
									</div>
									<div class="exp-chapter"><img src="/static/inxweb/img/cou-used.png"></div>
								</li>
							</ul>
						</div>
						<!-- 优惠券已使用结束 -->
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