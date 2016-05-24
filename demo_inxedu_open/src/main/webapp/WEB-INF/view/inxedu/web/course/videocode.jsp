<%@ page contentType="text/html;charset=UTF-8" language="java"	pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<c:choose>
	<c:when test="${videotype=='IFRAME'}"> <%-- SWF/56视频/IFRAME--%>
		<!-- 错误类型的 先用iframe承接 -->
		<iframe id="playervideoiframe" src="${videourl}" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>
		<script>
			$(function(){
				var width = $("#playervideoiframe").width();
				var height=$("#playervideoiframe").height();
				$("#playervideoiframe").attr("src","${videourl}&width=100%&height="+height);
			});
		</script>
	</c:when>
	<c:when test="${videotype=='CC'}"> <%-- cc视频 --%>
        <script src='http://p.bokecc.com/player?vid=${videourl}&siteid=${ccwebsitemap.cc.ccappID}&autoStart=true&width=100%&height=100%&playerid=51A2AD3118ACAD37&playertype=1' type='text/javascript'></script>
	</c:when>
	<c:when test="${videotype=='inxeduCloud'}"> <%-- 因酷云--%>
		<div id="videoareaname" style="width: 100%;height: 100%"></div>
		<script>
			var vodparam = "${videourl}";
			cloudsdk.initplay("videoareaname",{"src":vodparam,"id":"cloudsdk","isautosize":"0"});
			var html =  $("video").parent().html();
			$("video").remove();
			$("#videoareaname").html(html);
		</script>
	</c:when>
	<c:otherwise>
		<!-- 错误类型的 先用iframe承接 -->
		<iframe src="${videourl}" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>
	</c:otherwise>
</c:choose>
