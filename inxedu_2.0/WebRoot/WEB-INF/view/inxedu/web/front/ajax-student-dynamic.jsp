<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<c:forEach var="order" items="${orderList }">
	<li>
		<div class="u-face">
			<c:if test="${empty order.picImg}">
				<img src="/static/inxweb/img/avatar-boy.gif" width="50" height="50" alt="">
			</c:if>
			<c:if test="${!empty order.picImg}">
				<img src="<%=staticImage%>${order.picImg }" width="50" height="50" alt="">
			</c:if>
		</div>
		<section class="hLh30 txtOf">
			<span class="c-ccc fr">${order.createTimeFormat }</span>
			<span class="c-333 fsize16 fl"><c:if test="${empty order.userName}">${order.email}</c:if> <c:if test="${!empty order.userName}">${order.userName}</c:if>
			</span> 
		</section>
		<section class="hLh20 txtOf">
			<span class="c-999">购买了</span> <span class="c-master">“${order.courseName }”</span>
		</section>
	</li> 
</c:forEach>
