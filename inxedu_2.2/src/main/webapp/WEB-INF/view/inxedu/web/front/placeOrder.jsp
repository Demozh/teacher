<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<script>
	var theme_color = '${theme_color}';
	$(function() {
		placeholderFun()//placeholder的兼容方法；
	})
</script>
</head> 
<body>
	<div id="aCoursesList" class="bg-fa of">
		<div class="container">
			<section class="path-wrap txtOf hLh30"> 
				<a class="c-999 fsize14" title="" href="http://127.0.0.1">首页</a>
				 \<span class="c-333 fsize14">购物车</span> 
			</section>
			<article class="mt30">
				<div class="order-step-bg-2 order-step"></div>
				<div class="mt30">
					<header class=""><span class="fsize24 c-333">确认课程</span></header>
					<dl class="c-order-list of">
						<dd>
							<ul class="c-o-head clearfix of">
								<li class="c-head-li-16"><span>2015-06-25 09:36</span></li>
								<li class="c-head-li-80"><span>订单号：14012215325266252</span></li>
							</ul>
							<ul class="c-o-tbody clearfix of">
								<li class="c-head-li-16"><div class="c-o-t-img"><img src="http://127.0.0.1/images/upload/course/20150915/1442295379715.jpg" Xsrc="/static/inxweb/img/pic/1.jpg" class="img-responsive"></div></li>
								<li class="c-head-li-36">
									<div class="mt10">
										<h6 class="unFw c-666"> 搜索引索优化技术</h6>
										<div class="mt10 u-order-desc">
											<p class="c-999 txtOf"> 学完后学生可以运用seo策略和技术，独立操作网站seo优化，包括前期网站诊断</p>
										</div>
									</div>
								</li>
								<li>
									<div class="c-t-wz"><span class="c-666">讲师：廖凡 李晓东</span></div>
								</li>
								<li>
									<div class="c-t-wz"><span class="c-666">￥88.00</span></div>
								</li>
								<li>
									<div class="c-t-wz"><a href="javascript:;" class="c-666">取消</a></div>
								</li>
							</ul>
						</dd>
						<dd>
							<ul class="c-o-head clearfix of">
								<li class="c-head-li-16"><span>2015-06-25 09:36</span></li>
								<li class="c-head-li-80"><span>订单号：14012215325266252</span></li>
							</ul>
							<ul class="c-o-tbody clearfix of">
								<li class="c-head-li-16"><div class="c-o-t-img"><img src="http://127.0.0.1/images/upload/course/20150915/1442295379715.jpg" Xsrc="/static/inxweb/img/pic/1.jpg" class="img-responsive"></div></li>
								<li class="c-head-li-36">
									<div class="mt10">
										<h6 class="unFw c-666"> 搜索引索优化技术</h6>
										<div class="mt10 u-order-desc">
											<p class="c-999 txtOf"> 学完后学生可以运用seo策略和技术，独立操作网站seo优化，包括前期网站诊断</p>
										</div>
									</div>
								</li>
								<li>
									<div class="c-t-wz"><span class="c-666">讲师：廖凡 李晓东</span></div>
								</li>
								<li>
									<div class="c-t-wz"><span class="c-666">￥88.00</span></div>
								</li>
								<li>
									<div class="c-t-wz"><a href="javascript:;" class="c-666">取消</a></div>
								</li>
							</ul>
						</dd>
						<dd>
							<ul class="c-o-head clearfix of">
								<li class="c-head-li-16"><span>2015-06-25 09:36</span></li>
								<li class="c-head-li-80"><span class="ml20">订单号：14012215325266252</span></li>
							</ul>
							<ul class="c-o-tbody clearfix of">
								<li class="c-head-li-16"><div class="c-o-t-img"><img src="http://127.0.0.1/images/upload/course/20150915/1442295379715.jpg" Xsrc="http://127.0.0.1/images/upload/course/20150915/1442295379715.jpg" class="img-responsive"></div></li>
								<li class="c-head-li-36">
									<div class="mt10">
										<h6 class="unFw c-666"> 搜索引索优化技术</h6>
										<div class="mt10 u-order-desc">
											<p class="c-999 txtOf"> 学完后学生可以运用seo策略和技术，独立操作网站seo优化，包括前期网站诊断</p>
										</div>
									</div>
								</li>
								<li>
									<div class="c-t-wz"><span class="c-666">讲师：廖凡 李晓东</span></div>
								</li>
								<li>
									<div class="c-t-wz"><span class="c-666">￥88.00</span></div>
								</li>
								<li>
									<div class="c-t-wz"><a href="javascript:;" class="c-666">取消</a></div>
								</li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="mt30">
					<header class=""><span class="fsize24 c-333">支付方式</span></header>
					<div class="c-pay-method">
						<div class="of">
							<header class="c-p-title">课程卡</header>
							<div class="clearfix">
								<div class="c-p-left">
									<div class="c-couse-card">
										<p>课程卡余额：<span class="c-master fsize24 f-fG">￥67.50</span></p>
										<p class="mt20">您的可用余额不足，<span class="c-master fsize16">立即充值，</span>或使用其它方式支付!</p>
									</div>
								</div>
								<div class="c-p-right">
									<img src="/static/inxweb/img/coucard.png">
								</div>
							</div>
						</div>
						<div  class="of">
							<header class="c-p-title">网上银行</header>
							<div class="buyB_payPlat"> 
								<ul class="clearfix"> 
									<li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="CEB-NET"> <img src="/static/inxweb/img/buy/bank_ZGGDYH.png" alt="广大银行"></label></li>
								    <li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="ICBC-NET"><img src="/static/inxweb/img/buy/bank_ZGGSYH.png" alt="中国工商银行"></label></li> 
								    <li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="CCB-NET"><img src="/static/inxweb/img/buy/bank_ZGJSYH.png" alt="中国建设银行"></label></li> 
								    <li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="ABC-NET"><img src="/static/inxweb/img/buy/bank_ZGNYYH.png" alt="中国农业银行"></label></li> 
								    <li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="CMBCHINA-NET"><img src="/static/inxweb/img/buy/bank_ZSYH.png" alt="招商银行"></label></li> 
								    <li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="BOC-NET"><img src="/static/inxweb/img/buy/bank_ZGYH.png" alt="中国银行"></label></li> 
								    <li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="BOCO-NET"><img src="/static/inxweb/img/buy/bank_JTYH.png" alt="中国交通银行"></label></li> 
								    <li><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="POST-NET"><img src="/static/inxweb/img/buy/bank_ZGYZCXYH.png" alt="中国邮政储蓄银行"></label></li> 
								    <li class="buyB_payPlatNone"><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="CIB-NET"><img src="/static/inxweb/img/buy/bank_XYYH.png" alt="兴业银行"></label></li> 
								    <li class="buyB_payPlatNone"><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="CMBC-NET"><img src="/static/inxweb/img/buy/bank_ZGMSYH.png" alt="中国民生银行"></label></li> 
								    <li class="buyB_payPlatNone"><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="ECITIC-NET"><img src="/static/inxweb/img/buy/bank_ZXYH.png" alt="中兴银行"></label></li> 
								    <li class="buyB_payPlatNone"><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="PAB-NET"><img src="/static/inxweb/img/buy/bank_PAYH.png" alt="平安银行"></label></li> 
								    <li class="buyB_payPlatNone"><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="SDB-NET"><img src="/static/inxweb/img/buy/bank_SZFZYH.png" alt="深圳发展银行"></label></li> 
								    <li class="buyB_payPlatNone"><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="SHB-NET"><img src="/static/inxweb/img/buy/bank_SHYH.png" alt="上海银行"></label></li> 
								    <li class="buyB_payPlatNone"><label><input type="radio" onclick="checkbank('YEEPAY')" name="defaultbank" value="BJRCB-NET"><img src="/static/inxweb/img/buy/bank_BJNSYH.png" alt="北京农商银行"></label></li> 
								 </ul> 
							</div>
						</div>
						<div  class="of">
							<header class="c-p-title">第三方支付</header>
							<div class="buyB_payPlat"> 
								<ul class="clearfix"> 
									<li> <label> <input type="radio" onclick="checkbank('ALIPAY')" checked="checked" name="alipay" value=""> <img alt="支付宝" src="/static/inxweb/img/buy/buyB_pay_kuaiqian3.jpg"> </label> </li>
									<li><label> <input type="radio" onclick="checkbank('WEIXIN')" name="weixin" value=""> <img alt="微信" src="/static/inxweb/img/buy/buyB_pay_wx.jpg"> </label> </li>
								 </ul> 
							</div>
						</div>
					</div>
				</div>
				<div class="mt30">
					<header class=""><span class="fsize24 c-333">结算信息</span></header>
					<div class="c-pay-method c-p-m">
						<div>
							<div class="fl ml20">
								<p class="fsize14 c-666">使用代金券可以抵消部分金额哦</p>
								<div class="mt20 coupon-box clearfix">
									<input class="buyText01 fl" type="text" onclick="inputcode()" onkeyup="inputcode()" name="" placeholder="请输入优惠券编码">
									<a class="buyCoupon_add2 fl" href="javascript:addcode('')">添加</a>
								</div>
							</div>
							<div class="fr tar">
								<p class="fsize12 c-333">订单总价<span class="c-master f-fG fsize16">￥2724.01</span>  - 优惠金额 <span class="c-master f-fG fsize16"> ￥0.00</span> = <span class="c-master f-fG fsize16">￥2724.01</span>优惠类型：<span class="c-master">无</span></p>
								<p class="fsize24 c-333 mt20 hLh30">订单支付金额：<span class="c-master fsize36 f-fG">￥2724.01</span></p>
							</div>
							<div class="clear"></div>
						</div>
						<div class="tar mt40">
							<a href="" class="order-btn">提交订单</a>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/inxweb/js/swiper-2.1.0.js"></script>
	<script type="text/javascript" src="${ctx}/static/inxweb/front/index.js"></script>
	<%-- <script type="text/javascript" src="${ctx}/static/inxweb/front/index_theme_color.js"></script><!-- 换肤 --> --%>
	
</body>
</html>