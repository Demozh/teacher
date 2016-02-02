<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>


<div id="container" style="max-width: 85%;margin: auto;height: 260px;"></div>
<script type="text/javascript">
//每日用户数统计图
$(function(){
	var startDate="${startDate}";
	var endDate="${endDate}";
	var type="${type}";
	$("#type").val(type);
	$("#startDate").val(startDate);
	$("#endDate").val(endDate);
	
	var showDate='${showDate}';
	var dailyUserNumber="${dailyUserNumber}";
	
	$('#container').highcharts({
        title: {
            text: '每日学员数',
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
            valueSuffix: '人'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
        	name : '每日学员数',
			data : eval("(" + dailyUserNumber + ")")
        }]
    });
})
</script>
