<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<div id="container" style="max-width: 85%;margin: auto;height: 260px;"></div>
<script type="text/javascript">
//营收额统计图
$(function(){
	//开始时间
	var startDate="${startDate}";
	//结束时间
	var endDate="${endDate}";
	//统计图类型4注册统计图
	var type="${type}";
	$("#type").val(type);
	$("#startDate").val(startDate);
	$("#endDate").val(endDate);
	
	var showDate='${showDate}';
	//统计图显示数据
	var income="${income}";
	$('#container').highcharts({
        title: {
            text: '营收额',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
        	categories : eval("("+showDate+")"),
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
            valueSuffix: '元'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
        	name : '营收额',
			data : eval("(" + income + ")")
        }]
    });
})
</script>