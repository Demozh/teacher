<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctximg}/static/admin/js/highChart/highcharts.js"></script>
<script type="text/javascript" src="${ctximg}/static/admin/js/highChart/highcharts-3d.js"></script>
<script type="text/javascript">
$(function() {
	var obj = document.getElementById("nowYear");
	var date = new Date();
	for (var i = 0; i < 5; i++) {
		var opt = document.createElement("option");
		opt.value = date.getFullYear() - i;
		opt.innerHTML = (date.getFullYear() - i)+" 年";;
		obj.appendChild(opt);
	}
	if('${year}'!=null){
		$("#nowYear").val('${year}');
	}
	if('${month}'!=null){
		$("#nowMonth").val('${month}');
	}
	drawCartogram();
});

function drawCartogram() {
	var strs = new Array();
	strs = '${chart}'.split("|");
	var dateTime = "[" + strs[0] + "]";
	var orderNum = "[" + strs[1] + "]";
	var orderSuccessNum = "[" + strs[2] + "]";
	var orderInitNum = "[" + strs[3] + "]";
	var orderClosedNum = "[" + strs[4] + "]";
	
	$('#container').highcharts({
        title: {
            text: '学员注册走势图',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
        	categories : eval("(" + dateTime + ")")
        },
        /*yAxis: {
            title: {
                text: '人数'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }],
            min:0
        },*/
        yAxis: [{ // left y axis
            title: {
                text: null
            },
            labels: {
                align: 'left',
                x: 3,
                y: 16,
                format: '{value:.,0f}'
            },
            showFirstLabel: false,
            min:0
        }, { // right y axis
            linkedTo: 0,
            gridLineWidth: 0,
            opposite: true,
            title: {
                text: null
            },
            labels: {
                align: 'right',
                x: -3,
                y: 16,
                format: '{value:.,0f}'
            },
            showFirstLabel: false  ,
            min:0
        }],
        tooltip: {
            valueSuffix: '条'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
        	name : '订单数',
			data : eval("(" + orderNum + ")")
        },{
        	name : '已支付订单数',
			data : eval("(" + orderSuccessNum + ")")
        },{
        	name : '未支付订单数',
			data : eval("(" + orderInitNum + ")")
        },{
        	name : '已取消订单数',
			data : eval("(" + orderClosedNum + ")")
        }]
    });
}
</script>
</head>
<body>
<form action="${ctx }/admin/statistics/order" method="post">
		<div>
			<span><font>时间：</font></span> <span>
				<select style="width: 120px;" id="nowYear" name="year"></select>
				<select style="width: 90px;" id="nowMonth" name="month">
                    <option value="">月份</option>
                    <option value="1">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
                </select>
				</span>
				<input type="submit" class="btn btn-danger" value="查询" />
		</div>
		<div class="commonWrap">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="commonTab01">
				<tbody >
				<tr align="center">
					<td>
						<div id="container" style="max-width: 85%;margin: auto;height: 260px;"></div>
					</td>
				</tr>
				</tbody>
			</table>
		</div><!-- /commonWrap -->
	</form>
</body>
</html>