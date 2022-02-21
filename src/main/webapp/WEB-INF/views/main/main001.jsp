<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="js/jquery.min.js"></script>
    
<div class="row tile_count">
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
    	<span class="count_top"><i class="fa fa-user"></i>사용가능한 HW 수량</span>
        <div class="count" id="hwTotCount" name="hwTotCount"></div>
        <span class="count_bottom" id="hwTotInfo" name="hwTotInfo"></span>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
    	<span class="count_top"><i class="fa fa-power-off"></i> PC 수량</span>
        <div class="count" id="pcTotCount" name="pcTotCount"></div>
        <span class="count_bottom">상태값 : <i class="green">정상 </i> <!-- <i class="red">폐기대상 분실</i> --></span>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-desktop"></i> 모니터 수량</span>
        <div class="count" id="monTotCount" name="monTotCount"></div>
        <span class="count_bottom">상태값 : <i class="green">정상 </i> <!-- <i class="red">폐기대상 분실</i> --></span>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-power-off"></i> PC 여분수량</span>
        <div class="count" id="sparePc" name="sparePc"></div>
        <span class="count_bottom">5층 서버실, 14층 창고 기준</span>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-desktop"></i> 모니터 여분수량</span>
        <div class="count" id="spareMon" name="spareMon"></div>
        <span class="count_bottom">5층 서버실, 14층 창고 기준</span>
    </div>
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
    	<span class="count_top"><i class="fa fa-cogs"></i> 관리 페이지</span><br>
    	<a href="com001.do"><span>코드 관리</span></a>&nbsp;&nbsp;
    	<a href="com002.do"><span>매장 관리</span></a><br>
    	<a href="com003.do"><span>조직 관리</span></a>&nbsp;&nbsp;
    	<a><span id="phDirec">문의 관리</span></a><br>
    </div>
</div>
	
<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12">
    	<div class="x_panel">
        	<div class="x_title">
            	<h2>HW 최근 이동내역<small>최근 5건</small></h2>
                <ul class="nav navbar-right panel_toolbox">
	                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
	            </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
            	<div id="recentHwMovingHistory"></div>
            </div>
    	</div>
	</div>

    <div class="col-md-4 col-sm-4 col-xs-12">
    	<div class="x_panel tile fixed_height_320 overflow_hidden">
        	<div class="x_title">
            	<h2>PC 연식별 분포도<small>상태값 정상</small></h2>
                <ul class="nav navbar-right panel_toolbox">
	            	<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                </li>
                </ul>
            	<div class="clearfix"></div>
           	</div>
            <div class="x_content">
            	<table class="" style="width:100%">
                	<tr>
                    	<th style="width:37%;">
                        	<p> 생산년도 : 분포율(%)</p>
                      	</th>
                      	<th>
	                    	<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
	                        	<p class="">제조년</p>
	                        </div>
	                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
	                        	<p class="">수량</p>
	                        </div>
                      	</th>
                    </tr>
                    <tr>
                    	<td>
                        	<canvas height="140" width="140" style="margin: 15px 10px 10px 0" id="pcDonutChart"></canvas>
                      	</td>
                      	<td>
	                    	<table class="tile_info">
	                        	<tr>
	                            	<td>
	                              		<p><i class="fa fa-square blue"></i><span id="pcTop1"></span></p>
	                            	</td>
	                            	<td><span id="pcTop1Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square green"></i><span id="pcTop2"></span></p>
		                            </td>
	                            	<td><span id="pcTop2Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square red"></i><span id="pcTop3"></span></p>
		                            </td>
		                            <td><span id="pcTop3Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square purple"></i><span id="pcTop4"></span></p>
		                            </td>
		                            <td><span id="pcTop4Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square aero"></i><span id="pcTop5"></span></p>
		                            </td>
		                            <td><span id="pcTop5Cnt"></span></td>
	                          	</tr>
	                          	
	                        </table>
                      	</td>
                    </tr>
            	</table>
            </div>
    	</div>
    </div>
    
    <div class="col-md-4 col-sm-4 col-xs-12">
    	<div class="x_panel tile fixed_height_320 overflow_hidden">
        	<div class="x_title">
            	<h2>모니터 연식별 분포도<small>상태값 정상</small></h2>
                <ul class="nav navbar-right panel_toolbox">
	            	<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                </li>
                </ul>
            	<div class="clearfix"></div>
           	</div>
            <div class="x_content">
            	<table class="" style="width:100%">
                	<tr>
                    	<th style="width:37%;">
                        	<p> 생산년도 : 분포율(%)</p>
                      	</th>
                      	<th>
	                    	<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
	                        	<p class="">제조년</p>
	                        </div>
	                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
	                        	<p class="">수량</p>
	                        </div>
                      	</th>
                    </tr>
                    <tr>
                    	<td>
                        	<canvas height="140" width="140" style="margin: 15px 10px 10px 0" id="monDonutChart"></canvas>
                      	</td>
                      	<td>
	                    	<table class="tile_info">
	                        	<tr>
	                            	<td>
	                              		<p><i class="fa fa-square blue"></i><span id="monTop1"></span></p>
	                            	</td>
	                            	<td><span id="monTop1Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square green"></i><span id="monTop2"></span></p>
		                            </td>
	                            	<td><span id="monTop2Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square red "></i><span id="monTop3"></span></p>
		                            </td>
		                            <td><span id="monTop3Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square purple"></i><span id="monTop4"></span></p>
		                            </td>
		                            <td><span id="monTop4Cnt"></span></td>
	                          	</tr>
	                          	<tr>
		                            <td>
		                              <p><i class="fa fa-square aero"></i><span id="monTop5"></span></p>
		                            </td>
		                            <td><span id="monTop5Cnt"></span></td>
	                          	</tr>
	                          	
	                        </table>
                      	</td>
                    </tr>
            	</table>
            </div>
    	</div>
    </div>
</div>

<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="x_panel">
        	<div class="x_title">
            	<h2>퇴사자 확인</h2>
            	<ul class="nav navbar-right panel_toolbox">
	            	<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
            	<div class="dashboard-widget-content">
                	<ul class="list-unstyled timeline widget">
                    	<span id ="retiredEmpList"></span>
                    </ul>
                </div>
        	</div>
    	</div>
	</div>
	
	
	<div class="col-md-4 col-sm-4 col-xs-12">
		
	</div>
	<div class="col-md-4 col-sm-4 col-xs-12">
		
	</div>
	
</div>
<!-- <div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div clss="x_title">
				<h2>그래프를 그려보장</h2>
				<div class="filter">
					<div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                    	<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                        <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                	</div>
				</div>
			<div class="clearfix"></div>
			</div>
		</div>
		<div class="x_content">
			<div class="col-md-9 col-sm-12 col-xs-12">
            	<div class="demo-container" style="height:280px">
                	<div id="chart_plot_02" class="demo-placeholder"></div>
                </div>
			</div>
		</div>
	</div>
</div> -->
	
<script type="text/javascript">

$(document).ready(function(){
	hwTotCount();
	hwSpareCount();
	recentHwMoveHistory();
	mainHwYearSearch("pc");
	mainHwYearSearch("mon");
	searchRetiredEmpList_main001();
	
	$("#phDirec").click(function(){
		phDirecModal();
	});
})

function empCount(){
	$.ajax({
		type : "post",
		url : "mainEmpCount.do",
		success : function(data){
			$("#empCount").html(data[0].empCount);	
		}
	})
}

function hwTotCount(){
	var hwTotCount = 0;
	var hwList="";
	
	$.ajax({
		type : "post",
		url : "mainHwTotCount.do",
		async : true,
		success : function(data){
			$.each(data, function(index) {
				if(data[index].ItemType =="PC"){
					$("#pcTotCount").html(data[index].gCount);
				}else if(data[index].ItemType =="Mon"){
					$("#monTotCount").html(data[index].gCount);
				}
				hwTotCount += data[index].gCount;
			})
			$("#hwTotCount").html(hwTotCount);
			
			$.ajax({
				type: "post",
				url: "createSelectBox.do",
				data: "highCode=hwItem",
				async : true,
				success: function(hwItem){
			    	$.each(hwItem, function(hwIndex) {
			    		hwList += hwItem[hwIndex].lowCodeName + " ";
			    	});
			    	$("#hwTotInfo").html(hwList);
				}
			});
			
		}
	})
}

function hwSpareCount(){
	
	$("#sparePc").html(0);
	$("#spareMon").html(0);
	
	$.ajax({
		type : "post",
		url : "mainHwSpareCount.do",
		success : function(data){
			$.each(data, function(index) {
				if(data[index].ItemType =="PC"){
					$("#sparePc").html(data[index].gCount);
				}else if(data[index].ItemType =="Mon"){
					$("#spareMon").html(data[index].gCount);
				}
			})
			
		}
	})
}

function recentHwMoveHistory(){
	var str="";
	$.ajax({
		type : "post",
		url : "recentHwMoveHistory.do",
		success : function(data){
			$.each(data, function(index) {
				
				str += "<article class='media event'> ";
				str += "	<a class='pull-left date'> ";
				str += "		<p class='month'>"+data[index].arrMonth+"</p>";
				str += "		<p class='day'>"+data[index].arrDay+"</p>";
				str += "	</a>";
				str += "	<div class='media-body'>";
				str += "		<a class='title'>"+ data[index].ItemType+"</a> ";
				str += "		<p> 출발 : ["+data[index].startLCode1Name+"] "+ data[index].startLCode2Name + "</p>";
				str += "		<p>도착 : ["+data[index].arrLCode1Name+"] "+ data[index].arrLCode2Name +"</p>";
				str += "	</div>";
				str += "</article>"; 
				
				
			})
			
			$("#recentHwMovingHistory").html(str);
			
		}
	})
}

function mainHwYearSearch(ItemType){
	
	var labelArray = new Array();
	var dataArray = new Array();
	var arrayIndenx = 0;
	
	var etcYear = "";
	var etcCnt = 0;
	var etcTot = 0;
		
	$.ajax({
		type : "post",
		url : "mainHwYearSearch.do",
		data : "ItemType="+ItemType,
		success : function(data){
			
			/* $.each(data, function(index) {
				if(index<4){
					labelArray[arrayIndenx] = data[index].years+"연차";
					dataArray[arrayIndenx] = data[index].tc;
					arrayIndenx ++;
					$("#"+ItemType+"Top"+arrayIndenx).html(data[index].years+"연차");
					$("#"+ItemType+"Top"+arrayIndenx+"Per").html(((data[index].tc/data[index].totCount)*100).toFixed(0)+" %");
					
				}else{
					etcYear += data[index].years+ "/";
					etcCnt  += data[index].tc;
					etcTot  = data[index].totCount;
				}
			})
			
			labelArray[arrayIndenx] = etcYear+"연차";
			dataArray[arrayIndenx] = etcCnt;
			
			$("#"+ItemType+"Top"+(arrayIndenx+1)).html(etcYear+"연차");
			$("#"+ItemType+"Top"+(arrayIndenx+1)+"Per").html(((etcCnt/etcTot)*100).toFixed(0)+" %");
			
			donutChartDrawing(labelArray,dataArray,ItemType); */
			
			//((data[index].tc/data[index].totCount)*100).toFixed(0)+" %"
			$.each(data, function(index) {
				if(index<4){
					labelArray[arrayIndenx] = data[index].years;
					dataArray[arrayIndenx] = ((data[index].tc/data[index].totCount)*100).toFixed(0);
					arrayIndenx ++;
					$("#"+ItemType+"Top"+arrayIndenx).html(data[index].years);
					$("#"+ItemType+"Top"+arrayIndenx+"Cnt").html(data[index].tc);
					
				}else{
					etcYear = "기타";
					etcCnt  += data[index].tc;
					etcTot  = data[index].totCount;
				}
			})
			
			labelArray[arrayIndenx] = etcYear;
			dataArray[arrayIndenx] = ((etcCnt/etcTot)*100).toFixed(0);
			//((etcCnt/etcTot)*100).toFixed(0)+" %"
			
			$("#"+ItemType+"Top"+(arrayIndenx+1)).html(etcYear);
			$("#"+ItemType+"Top"+(arrayIndenx+1)+"Cnt").html(etcCnt);
			
			donutChartDrawing(labelArray,dataArray,ItemType);
		}
	})
}

function donutChartDrawing(labelArray,dataArray,ItemType){
	var a={
		type:"doughnut",
		tooltipFillColor:"rgba(51, 51, 51, 0.55)",
		data:{
			  labels:[labelArray[4],labelArray[3],labelArray[2],labelArray[1],labelArray[0]],
			  datasets:[{data:[dataArray[4],dataArray[3],dataArray[2],dataArray[1],dataArray[0]],
						backgroundColor:["#BDC3C7","#9B59B6","#E74C3C","#26B99A","#3498DB"],
			  	   		hoverBackgroundColor:["#CFD4D8","#B370CF","#E95E4F","#36CAAB","#49A9EA"]}]
		},
		options:{legend:!1,
				 responsive:!1}
	};

	$("#"+ItemType+"DonutChart").each(function(){
		var b=$(this);
		new Chart(b,a)
	})
}

function searchRetiredEmpList_main001(){
	
	$.ajax({
		type: "post",
		url: "searchRetiredEmpList.do",
		success: function(data){
			var str = "";
	    	$.each(data, function(index) {
				str += "<li>"
	    		str += "	<div class='block'>"
	    		str += "		<div class='block_content'>"
	    		str += "			<h2 class='title'>"
	    		str += "    			<a>"+ data[index].LCode1Name +"</a>"
	    		str += "			</h2>"
	    		str += "			<p class='excerpt'>"+ data[index].LCode2Name +"</p>"
	    		str += "		</div>"
	    		str += "	</div>"
	    		str += "</li>"
	    	});
			$("#retiredEmpList").html(str);	
		}
	});
}

function phDirecModal(){
	$("#phoneDirectoryRegister").modal();
}

</script>