<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<script>
	var theme_color = '${theme_color}';
</script>
</head> 
<body>
	<div id="aCoursesList" class="bg-fa of">
		<div class="container">
			<section class="path-wrap txtOf hLh30"> 
				<a class="c-999 fsize14" title="" href="http://127.0.0.1">首页</a>
				 \<a class="c-999 fsize14" title="" href="http://127.0.0.1">购物车</a>
				 \<span class="c-333 fsize14">支付成功</span> 
			</section>
			<div class="mt20">
				<header class=""><span class="fsize24 c-333">支付成功</span></header>
				<div class="c-pay-method c-p-m">
					<div class="tac pr">
						<em class="icon80"></em><span class="c-333 f-fH pay-font">支付成功！</span>
						<div class="c-order-num"><p class="c-666 fsize16 f-fM">订单编号：<span class="c-333 fsize18">14527500072887</span></p></div>
					</div>
					<div class="mt30 pl20">
						<header class="c-p-title">您的支付信息</header>
						<div class="mt30 clearfix of">
							<div class="fl">
								<ul class="order-list-item ml20">
									<li class="o-l-fir"><em class="icon14 c-o-icon mt5"></em><span class="fsize14 c-999 f-fM ml5 vam">付款金额：<tt class="c-master f-fG fsize30">￥2724.01</tt></span></li>
									<li><em class="icon14 c-o-icon mt5"></em><span class="fsize14 c-999 f-fM  ml5 vam">支付方式：<tt class="c-333 f-fM">in-xedu 课程卡  </tt></span></li>
									<li><em class="icon14 c-o-icon mt5"></em><span class="fsize14 c-999 f-fM  ml5 vam">支付日期：<tt class="c-333 f-fM">2016-01-18 15:05  </tt></span></li>
									<li><em class="icon14 c-o-icon mt5"></em><span class="fsize14 c-999 f-fM  ml5 vam">所购课程：<tt class="c-333 f-fM">《C4D零基础》 《HTML5入门学习》《Java精品课程》 </tt></span></li>
								</ul>
							</div>
							<div class="fr mr30">
								<div class="mt10"><a href="" class="ret-btn"><em class="icon20"></em><tt>返回首页</tt></a></div>
								<div class="mt30"><a href="" class="ret-btn lea-cou-btn"><em class="icon20"></em><tt>学习课程</tt></a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/inxweb/js/swiper-2.1.0.js"></script>
	<script type="text/javascript" src="${ctx}/static/inxweb/front/index.js"></script>
	
</body>
</html>