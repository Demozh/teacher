<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<script type="text/javascript">
$(function(){
	scPos();
	sideNav();
	goTopFun2()
})
$(window).resize(function() {scPos();});
function scPos() {
	var winW = $(window).height();
	$("#s-car-box-middle").css({"height" : winW-110 + "px","overflow-y" : "auto","overflow-x" : "hidden"});
}
function sideNav(){
	var browserRedirect = function() {
		var sUserAgent = navigator.userAgent.toLowerCase();
		var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
		var bIsMidp = sUserAgent.match(/midp/i) == "midp";
		var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
		var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
		var bIsAndroid = sUserAgent.match(/android/i) == "android";
		var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
		var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
		if (bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
			return false;
		} else {
			var vBtn=$("#v-nav-first"),
				naxBox=$(".r-fixed-wrap");
				vBtn2=$("#v-nav-close"),
			vBtn.click(function(e) {
				if(!vBtn.hasClass("vBtnCurr")){
					naxBox.stop().animate({"right" : "0"}, 400);
					vBtn.addClass("vBtnCurr");
					$("html").addClass("onScroll");
				}else{
					ccrFun();
				};
				stopFunc(e);
			});
			vBtn2.click(function(e) {
				ccrFun();
				stopFunc(e);
			})
			$(document).click(function() {
				ccrFun();
			});
			function ccrFun() {
				naxBox.stop().animate({"right" : "-279px"}, 400);
				vBtn.removeClass("vBtnCurr");
				$("html").removeClass("onScroll");
			};
			function stopFunc(e) {
				 document.all ? event.cancelBubble = true : e.stopPropagation();
			} 

		}
	}
}
function goTopFun2() {
    var _gt = $("#goTopBtn2");
    _gt.bind("click", function() {
        $("html,body").animate({"scrollTop" : 0}, 500);
    })
    var goTop = function() {
        var sTop = $(document).scrollTop();
        (sTop > 120) ? _gt.fadeIn(50) : _gt.fadeOut(50);
    }
    $(window).bind("scroll" , goTop);
}
</script>
<footer id="footer">
	<section class="container">
		<div class="">
			<h4 class="hLh30">
				<span class="fsize18 f-fM c-999">友情链接</span>
			</h4>
			<ul class="of flink-list">
				<c:forEach items="${navigatemap.FRIENDLINK}" var="friendLinkNavigate">
					<li><a href="${friendLinkNavigate.url}" title="${friendLinkNavigate.name}" <c:if test="${friendLinkNavigate.newPage==0}">target="_blank"</c:if>>${friendLinkNavigate.name}</a></li>
				</c:forEach>
			</ul>
			<div class="clear"></div>
		</div>
		<div class="b-foot">
			<section class="fl col-7">
				<section class="mr20">
					<section class="b-f-link">
						<c:forEach items="${navigatemap.TAB}" var="indexNavigate" varStatus="index">
							<a href="${indexNavigate.url}" title="${indexNavigate.name}" <c:if test="${indexNavigate.newPage==0}">target="_blank"</c:if>>${indexNavigate.name}</a>|
								</c:forEach>
						<span>服务热线：${websitemap.web.phone}</span> <span>Email：${websitemap.web.email}</span>
					</section>
					<section class="b-f-link mt10">
						<span>${websitemap.web.copyright}</span>
					</section>
				</section>
			</section>
			<aside class="fl col-3 tac mt15">
				<section class="gf-tx">
					<span><img src="${ctx}/static/inxweb/img/wx-icon.png" alt=""></span>
					<div class="gf-tx-ewm">
						<c:forEach var="image" items="${websiteImages.type_11}" varStatus="status">
						<c:if test="${status.count==1 }">
						<img src="<%=staticImage%>${image.imagesUrl}" alt="">
						</c:if>
					</c:forEach>
					</div>
				</section>
				<section class="gf-tx">
					<span><img src="${ctx}/static/inxweb/img/wb-icon.png" alt=""></span>
					<div class="gf-tx-ewm">
					<c:forEach var="image" items="${websiteImages.type_11}" varStatus="status">
						<c:if test="${status.count==2 }">
						<img src="<%=staticImage%>${image.imagesUrl}" alt="">
						</c:if>
					</c:forEach>
					</div>
				</section>
			</aside>
			<div class="clear"></div>
		</div>
	</section>
</footer>
<div class="r-fixed-wrap">
	<div class="pr r-fix-box">
		<ul class="r-fixed-ul">
			<li id="goTopBtn" >
				<a href="javascript: void(0)" title="返回顶部" class="bg-orange">
					<em class="r-f-icon-3">&nbsp;</em><span>返回顶部</span>
				</a>
			</li>
		</ul>

	</div>
</div>
<!--手机端回到顶部 开始-->
 <div class="m-go-top-box">
	<ul class="r-fixed-ul">
		<li id="goTopBtn2" class="">
			<a href="javascript: void(0)" title="返回顶部" class="bg-orange">
				<em class="r-f-icon-3">&nbsp;</em><span>返回顶部</span>
			</a>
		</li>
	</ul>
</div> 
<!--手机端回到顶部 开始-->
