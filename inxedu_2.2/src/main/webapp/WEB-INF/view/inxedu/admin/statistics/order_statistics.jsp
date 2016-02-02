<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<div id="container" style="max-width: 85%;margin: auto;height: 260px;"></div>
<script type="text/javascript">
//订单统计图
$(function(){
	var startDate="${startDate}";
	var endDate="${endDate}";
	var type="${type}";
	$("#startDate").val(startDate);
	$("#endDate").val(endDate);
	$("#type").val(type);
	
    var showDate='${showDate}';
    var orderNum="${orderNum}";//订单数量
    var orderSuccessNum="${orderSuccessNum}";//支付成功的订单数量
    var orderInitNum="${orderInitNum}";//未支付成功的订单数量
    var orderClosedNum="${orderClosedNum}";//已取消支付的订单数量
    $('#container').highcharts({
        title: {
            text: '订单数量',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
        	categories : eval("(" + showDate + ")"),
        	labels: {
        		rotation:rotationVal
            }
        },
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
	        	name : '订单数量',
				data : eval("(" + orderNum + ")")
	        },{
	        	name : '已支付订单数量',
	        	data : eval("("+orderSuccessNum+")")
	        },{
	        	name : '未支付订单数量',
	        	data : eval("("+orderInitNum+")")
	        },{
	        	name : '已取消订单数量',
	        	data : eval("("+orderClosedNum+")")
	        }]
	    });
})
</script>