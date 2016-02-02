<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<head>
<title>我的订单</title>
<script type="text/javascript">
$(function(){
	cCardFun();
})
 function cCardFun(){
		$(".c-caed-body>tr>td>em").each(function() {
			var _this = $(this),
			    _cont = _this.siblings(".c-csrd-m-wrap");
			_this.click(function() {
				if(_cont.is(":hidden")){
					_cont.show();
					_btn.addClass("cou-arrow-up");
				}else{
					_cont.hide();
					_btn.removeClass("cou-arrow-up");
				}
			});
		
	})
}
</script>
</head>
<body>
	<article class="col-7 fl">
		<div class="u-r-cont">
			<section>
				<div>
					<section class="c-infor-tabTitle c-tab-title">
						<a href="javascript: void(0)" title="Wo的订单" style="cursor: default;">Wo的学习</a>
						<a href="" title="已完成" class="current">课程卡管理</a>
					</section>
				</div>
					<section > 
						<div class=" p-cou-card-pad"> 
							<section class="mt40 pb20 line2"> 
								<h4 class="hLh30"> 
									<span class="c-333 fsize14 fbold">有新课程卡？</span> 
									<a class="ml20 jihu-btn" title="马上激活" id="activateCardCourse" href="javascript:void(0)">马上激活</a>
								</h4> 
							</section> 
							<section class="mt15"> 
								<h5 class="c-333 fsize14 fbold">课程卡有什么用途？</h5> 
								 <p class="c-666 mt5">使用课程卡激活后可以去学习与课程卡金额相应的课程。</p> 
							</section> 
							<section class="mt30 mb30"> 
								<h5 class="c-333 fsize14 line2 pb10 fbold">我的课程卡列表</h5> 
								<!-- pc端开始 -->
								<table width="100%" cellspacing="0" cellpadding="0" border="0" class="u-c-card tab-integral mt10 p-card-table"> 
									<thead> 
										<tr> 
											<th>编号</th> 
											<th>卡号</th> 
											<th>卡密码</th> 
											<th width="28%">关联课程</th> 
											<th>使用时间</th> 
											<th>卡状态</th> 
										</tr> 
									</thead> 
									<tbody class="tac"> 
										<tr> 
											<td>2095</td> 
											<td>10220011884（课程卡）</td> 
											<td>4041873205</td> 
											<td>经济师中级,</td> 
											<td> 2015/10/31 23:03</td> 
											<td>已使用</td> 
										</tr> 
										<tr> 
											<td>49</td> 
											<td>10220011884（课程卡）</td> 
											<td>2853799747</td> 
											<td>0基础最佳iOS实战开发,spring深度解析,网页设计高级课程,IOS基础课程,</td> 
											<td> 2015/09/21 15:57</td> 
											<td>已使用</td> 
										</tr> 
									</tbody> 
								</table> 
								<!-- pc端结束 -->
								<!-- 移动端开始 -->
								<table width="100%" cellspacing="0" cellpadding="0" border="0" class="u-c-card tab-integral mt10 m-card-table"> 
									<thead> 
										<tr> 
											<th>编号</th> 
											<th style="width: 60%;">卡号</th> 
											<th>卡状态</th> 
										</tr> 
									</thead> 
									<tbody class="tac c-caed-body"> 
										<tr> 
											<td class="pr">2095<em class="cou-arrow-down c-arrow"></em>
												<div class="c-csrd-m-wrap undis">
													<div class="c-card-more">
														<ul>
															<li class="clearfix"><div class="c-c-more-cleft">卡密码：</div><div class="c-c-more-cright">11111111111</div></li>
															<li class="clearfix"><div class="c-c-more-cleft">关联课程：</div><div class="c-c-more-cright">0基础最佳iOS实战开发,spring深度解析,网页设计高级课程,IOS基础课程,</div></li>
															<li class="clearfix"><div class="c-c-more-cleft">使用时间：</div><div class="c-c-more-cright">2015/09/21 15:57</div></li>
														</ul>
														<div class="yk-DT-arrow"><em>◆</em><span>◆</span></div>
													</div>
												</div>
											</td> 
											<td style="width: 60%;">10220011884（课程卡）</td> 
											<td>已使用</td> 
										</tr> 
										<tr> 
											<td class="pr">2095<em class="cou-arrow-down c-arrow"></em>
												<div class="c-csrd-m-wrap undis">
													<div class="c-card-more">
														<ul>
															<li class="clearfix"><div class="c-c-more-cleft">卡密码：</div><div class="c-c-more-cright">11111111111</div></li>
															<li class="clearfix"><div class="c-c-more-cleft">关联课程：</div><div class="c-c-more-cright">0基础最佳iOS实战开发,spring深度解析,网页设计高级课程,IOS基础课程,</div></li>
															<li class="clearfix"><div class="c-c-more-cleft">使用时间：</div><div class="c-c-more-cright">2015/09/21 15:57</div></li>
														</ul>
														<div class="yk-DT-arrow"><em>◆</em><span>◆</span></div>
													</div>
												</div>
											</td> 
											<td>10220011884（课程卡）</td> 
											<td>已使用</td> 
										</tr> 
									</tbody> 
								</table> 
								<!--移动端结束  -->
							</section> 
						</div> 
					</section>
						<%-- <!-- 公共分页 开始 -->
						<jsp:include page="/WEB-INF/view/common/front_page.jsp" />
						<!-- 公共分页 结束 -->
						<form action="${ctx}/uc/order/myOrderList/${state}" method="post" id="searchForm">
							<input type="hidden" name="page.currentPage" value="1" id="pageCurrentPage" />
						</form> --%>
			</section>
			<!-- /我的课程 -->
		</div>
	</article>
	<!-- /右侧内容区 结束 -->
</body>
</html>