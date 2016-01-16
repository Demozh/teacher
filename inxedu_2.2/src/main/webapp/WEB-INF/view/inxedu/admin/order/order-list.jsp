<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理列表</title>
<script type="text/javascript" src="${ctx}/static/common/jquery-1.11.1.min.js"></script>

<script src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-1.10.4.custom.js?v=${v}"></script>
<script src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery.ui.datepicker-zh-CN.js?v=${v}"></script>
<script type="text/javascript" src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-timepicker-addon.js?v=${v}"></script>
<script type="text/javascript" src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-timepicker-zh-CN.js?v=${v}"></script>

<script type="text/javascript" src="${ctx}/static/admin/order/order.js"></script>
</head>
<body>
	<div class="pad20">
		<form action="${ctx}/admin/order/showorderlist" method="post" id="searchForm">
			<input type="hidden" id="pageCurrentPage" name="page.currentPage" value="1" />
			关键字:
			<input placeholder="订单号/邮箱/手机号" name="queryOrder.keyWord" value="${queryOrder.keyWord}" />
			支付类型
			<select name="queryOrder.payType" id="payType">
				<option value="">--全部--</option>
				<option value="ALIPAY"  ${queryOrder.payType=='ALIPAY'?'selected':''}>支付宝</option>
				<option value="FREE" ${queryOrder.payType=='FREE'?'selected':''}>赠送</option>
			</select>
			状态
			<select name="queryOrder.states" id="states">
				<option value="">请选择</option>
				<option value="SUCCESS"  ${queryOrder.states=='SUCCESS'?'selected':''}>已支付</option>
				<option value="INIT" ${queryOrder.states=='INIT'?'selected':''}>未支付</option>
				<option value="CANCEL" ${queryOrder.states=='CANCEL'?'selected':''}>已取消</option>
			</select>
			下单时间:
			<input placeholder="开始下单时间" name="queryOrder.beginCreateTime"
				value="<fmt:formatDate value="${queryOrder.beginCreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" id="beginCreateTime" type="text"
				readonly="readonly" style="width: 128px;"/>
			-
			<input placeholder="结束下单时间" id="endCreateTime" name="queryOrder.endCreateTime"
				value="<fmt:formatDate value="${queryOrder.endCreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" readonly="readonly" style="width: 128px;"/>
			支付时间:
			<input placeholder="开始支付时间" id="beginPayTime" name="queryOrder.beginPayTime"
				value="<fmt:formatDate value="${queryOrder.beginPayTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" readonly="readonly" style="width: 128px;"/>
			-
			<input placeholder="结束支付时间" id="endPayTime" name="queryOrder.endPayTime"
				value="<fmt:formatDate value="${queryOrder.endPayTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" readonly="readonly" style="width: 128px;"/>
			<a title="查询订单" onclick="javascript:$('#searchForm').submit();" class="button tooltip" href="javascript:void(0)">
				<span class="ui-icon ui-icon-search"></span>
				查询订单
			</a>
			<a title="清空" onclick="javascript:$('#searchForm input:text').val('');$('#payType').val('');$('#states').val('');" class="button tooltip" href="javascript:void(0)">
				<span class="ui-icon ui-icon-cancel"></span>
				清空
			</a>
		</form>
		<table cellspacing="0" cellpadding="0" border="0" class="fullwidth">
			<thead>
				<tr>
					<td align="center">订单号</td>
					<td align="center">学员邮箱</td>
					<td align="center">学员手机</td>
					<td align="center">金额</td>
					<td align="center">创建时间</td>
					<td align="center">状态</td>
					<td align="center">支付时间</td>
					<td align="center">到期时间</td>
					<td align="center" width="230">描述</td>
					<td align="center">开通人</td>
					<td align="center">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="order">
					<tr class="odd">
						<td align="center">${order.orderNo}</td>
						<td align="center">${order.email}</td>
						<td align="center">${order.mobile}</td>
						<td align="center">${order.sumMoney}</td>
						<td align="center">
							<fmt:formatDate value="${order.createTime}" pattern="yyyy/MM/dd" />
						</td>
						<td align="center">
							<c:if test="${order.states=='INIT'}">
								<font color="#e33b00">未支付</font>
							</c:if>
							<c:if test="${order.states=='SUCCESS'}">
								<font color="#00e33b">已支付</font>
							</c:if>
							<c:if test="${order.states=='CANCEL'}">已取消</c:if>
							<c:if test="${order.states=='CLOSED'}">
								<font color="orange">已关闭</font>
							</c:if>
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${order.payTime!=null}">
									<fmt:formatDate value="${order.payTime}" pattern="yyyy/MM/dd" />
								</c:when>
								<c:otherwise>--</c:otherwise>
							</c:choose>
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${order.expireTime!=null}">
									<span><fmt:formatDate value="${order.expireTime}" pattern="yyyy-MM-dd HH:mm" /></span>
									<span style="display:none;">
										<input type="text" value='<fmt:formatDate value="${order.expireTime}" pattern="yyyy-MM-dd HH:mm" />' class="expireTime" style="width: 101px;"/>
										<a onclick="clickStopTIme(this,${order.orderId})" href="javascript:void(0)">提交</a>
										<a onclick="clickStopTImequxiao(this)" href="javascript:void(0)">取消</a>
									</span>
								</c:when>
								<c:otherwise>--</c:otherwise>
							</c:choose>
						</td>
						<td align="center">${order.describe}</td>
						<td align="center">
							<c:choose>
								<c:when test="${order.loginName!=null}">${order.loginName}</c:when>
								<c:otherwise>--</c:otherwise>
							</c:choose>
						</td>
						<td align="center">
							<samp id="auditing${order.orderId}">
								<c:if test="${order.states=='INIT'}">
									<a href="javascript:void(0)" onclick="auditing('${order.orderNo}',this)" class="button tooltip">开通</a>
								</c:if>
							</samp>
							<samp id="initcancel${order.orderId}">
								<c:if test="${order.states=='INIT'}">
									<a href="javascript:void(0)" onclick="cancelOrRegain('CANCEL',${order.orderId},'${order.orderNo}',this)" class="button tooltip">取消</a>
								</c:if>
								<c:if test="${order.states=='CANCEL'}">
									<a href="javascript:void(0)" onclick="cancelOrRegain('INIT',${order.orderId},'${order.orderNo}',this)" class="button tooltip">恢复</a>
								</c:if>
							</samp>
							<c:if test="${order.states=='SUCCESS'}">
								<a href="javascript:void(0)" onclick="delayCourse(this)" class="button tooltip">延期</a>
								<a href="javascript:void(0)" onclick="closeOrder(${order.orderId})" class="button tooltip">关闭</a>
							</c:if>
							<c:if test="${order.states=='CLOSED'}">
								--
							</c:if>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="/WEB-INF/view/common/admin_page.jsp" />
	</div>
</body>
</html>