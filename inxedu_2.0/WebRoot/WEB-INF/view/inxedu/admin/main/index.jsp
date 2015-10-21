<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" http-equiv="Content-Type" />
<title>后台管理系统 - 因酷在线教育软件 - 在线教育整体解决方案提供商</title>
<script type="text/javascript" src="${ctximg}/static/admin/js/highChart/highcharts.js"></script>
<script type="text/javascript" src="${ctximg}/static/admin/js/highChart/highcharts-3d.js"></script>
<script type="text/javascript" language="javascript">
$(function() {
	//活跃度 15天
	drawCartogramLogin(15);
});

//活跃度按天数
function drawCartogramLogin(days) {
    var dateTime = '';
    var studentNum =  "" ;
    $.ajax({
        url:baselocation +"/admin/statistics/web/detailajax",
        type:"post",
        data:{"days":days,"type":"LOGIN_NUM"},
        dataType:"json",
        async:false,
        success:function(result){
            if(result.success){
                dateTime=result.entity;
                studentNum= "["+result.message+"]" ;
            }else{
                alert("请求错误!");
            }
        }
    })
    $('#container').highcharts({
	        title: {
	            text: '最近'+days+'天活跃学员',
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
                text: null
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
	            valueSuffix: '人'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        series: [{
	        	name : '活跃人数',
				data : eval("(" + studentNum + ")")
	        }]
	    });
}

//今天登录人数
function logintoday(){
 $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '今天活跃人数'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: 0,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: ''
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: '今天活跃人数: <b>{point.y} 人</b>'
        },
        series: [{
            name: 'Population',
            data: [
                ['活跃人数', ${todayloginnum}]
            ],
            dataLabels: {
                enabled: true,
                rotation: -360,
                color: '#FFFFFF',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });

}
//今天登录人数 ==/
</script>
</head>
<body style="background: none;">
	<div class="rMain" style="margin-top: 8px">
		<h1>
			欢迎你,
			<span>超级管理员</span>
			!
		</h1>
		<p>点击快捷入口即可管理操作！</p>

		<div class="pad20">
			<!-- Big buttons -->
			<ul class="dash">
				<li>
					<a class="tooltip" title="新增课程" href="${ctx}/admin/cou/toAddCourse">
						<img alt="" src="${ctx}/static/admin/assets/icons/4_48x48.png">
						<span>新增课程</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/article/initcreate" target="content" title="新增文章" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/8_48x48.png" alt="" />
						<span>新增文章</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/article/showlist" target="content" title="文章列表" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/7_48x48.png" alt="" />
						<span>文章列表</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/sysuser/userlist" title="管理用户" target="content" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/16_48x48.png" alt="" />
						<span>管理用户</span>
					</a>
				</li>
				<li>
					<a href="${ctx}/admin/website/imagesPage" title="媒体图片管理" class="tooltip">
						<img src="${ctx}/static/admin/assets/icons/20_48x48.png" alt="" />
						<span>媒体图片管理</span>
					</a>
				</li>
			</ul>
			<!-- End of Big buttons -->
		</div>
		
		<fieldset>
			<legend>
				<span>网站统计</span>
				&gt;
				<span>学员活跃度走势</span>
			</legend>
			<div class="mt20">
				<div class="commonWrap">
					<div>
						<div class="mt20">
							<div class="commonWrap">
								<table cellspacing="0" cellpadding="0" border="0" width="100%" class="commonTab01">
									<caption><span><input type="button" onclick="logintoday()" value="今天" class="btn btn-y ml10">
										<input type="button" onclick="drawCartogramLogin(7)" value="最近7天" class="btn btn-y ml10">
										 <input type="button" onclick="drawCartogramLogin(30)" value="最近30天" class="btn btn-y ml10">
										</span>
									</caption>
									<tbody >
									<tr align="center">
										<td>
											<div id="container" style="max-width: 85%;margin: auto;height: 260px;"></div>
										</td>
									</tr>
									</tbody>
								</table>
							</div><!-- /commonWrap -->
						</div>
						<div class="page_head">
							<h4></h4>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
</body>
</html>