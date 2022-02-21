<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.min.js"></script>

<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>
<!-- bootstrap-daterangepicker -->
<link href="css/daterangepicker.css" rel="stylesheet">
<!-- bootstrap-datetimepicker -->
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
<script src="js/bootstrap-datetimepicker.min.js"></script>

<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!-- PNotify -->
<script src="js/pnotify.js"></script>
<link href="css/pnotify.css" rel="stylesheet">
<link href="css/pnotify.buttons.css" rel="stylesheet">
<script src="js/pnotify.buttons.js"></script>
<link href="css/pnotify.nonblock.css" rel="stylesheet">
<script src="js/pnotify.nonblock.js"></script>



<div class="">
	<div class="">
		<div class="page-title">
			<div class="title_left">
		    	<h3>부서별 S/W 자산 조회</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="swm104Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<!-- <button class="btn btn-dark" type="button" onclick="swm104Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button> -->
		            		</span>
		                </span>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="x_panel">
			<div class = "x_title">
				<h2>조회 조건</h2>
				<ul class="nav navbar-right panel_toolbox">
		    		<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		            </li>
	    		</ul>
				<div class="clearfix"></div>
			</div>
			<div class = "x_content">
				<form class="form-horizontal" name="swm104form01" id ="swm104form01" method="get" action="swm104Excel.do" accept-charset="utf-8">
					<div class="col-md-1 col-xs-10">
						<label class="control-label">조직 구분</label>
					</div>
					<div class="col-md-2 col-xs-10">
						<div class="input-group">
							<select class="select2_single form-control" tabindex="-1" id="orgFlag" name="orgFlag" >
					      	</select>
					      	<span class="input-group-btn">
			                   	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="swm104btn01" name="swm104btn01">검색</button>
			                   	<input type="hidden" id="eBtnValue">
			                </span>
			            </div>
					</div>
					
					<div class="col-md-2 col-xs-6 checkbox" >
						<label>부서 : <span id="divisionName"></span></label>
						<input type="hidden" id="highOrgCode" name="highOrgCode">
					</div>
					<div class="col-md-2 col-xs-6 checkbox">
						<label><input type="checkbox" id="teamCheck" name="teamCheck">팀 : <span id="teamName"></span></label>
						<input type="hidden" id="lowOrgCode" name="lowOrgCode">
					</div>
						  	
					<!-- <div class="col-md-1 col-xs-10 checkbox">
						<label><input type="checkbox" id="swTypeCheck" name="swTypeCheck" checked="checked">S/W 종류</label>
					</div>
					<div class="col-md-2 col-xs-10">
						<select class="select2_single form-control" tabindex="-1" required="required" id="swType" name="swType">
						</select>
					</div> -->
					
				</form>
			</div>
		</div>
		
		<div class="row">
        	<div class="col-md-6 col-xs-12">
            	<div class="x_panel" >
                	<div class="x_content">
                    	<!--아코디언  -->
	                	<div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
	                    	<div class="panel">
		                        <a class="panel-heading" role="tab" id="headingOne1" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne">
		                        	<h4 class="panel-title">MS Office<small><span id="msOfficCnt" name="msOfficCnt" class="pull-right"></span></small></h4>      	
		                        </a>
		                        <div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
		                        	<div class="panel-body">
		                        		<div class="table-responsive">
					                		<table class="table table-striped jambo_table" style="table-layout: fixed" id="msOfficTable" name="msOfficTable">
	                        					<thead>
				                          			<tr class="headings" >
					                            		<th class="column-title" width="60px">팀</th>
							                            <th class="column-title" width="100px">이름</th>
							                            <th class="column-title" width="100px">포지션</th>
							                            <th class="column-title" width="100px">SW</th>
							                            <th class="column-title" width="100px">수량</th>
							                        </tr>
	                        					</thead>
						                        <tbody id="msOfficTableDetail">
						                        </tbody>
	                      					</table>
					                      
	                    				</div>
		                          	</div>
		                        </div>
	                      </div>
	                      <div class="panel">
	                      	<a class="panel-heading collapsed" role="tab" id="headingTwo1" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1" aria-expanded="false" aria-controls="collapseTwo">
	                        	<h4 class="panel-title">한글<small><span id="hangulCnt" name="hangulCnt" class="pull-right"></span></small></h4>
	                        </a>
	                        <div id="collapseTwo1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
	                        	<div class="panel-body">
	                            	<div class="table-responsive">
					                	<table class="table table-striped jambo_table" style="table-layout: fixed" id="hangulTable" name="hangulTable" >
	                        				<thead>
				                         		<tr class="headings" >
						                        	<th class="column-title" width="60px">팀</th>
							                        <th class="column-title" width="100px">이름</th>
							                        <th class="column-title" width="100px">포지션</th>
							                        <th class="column-title" width="100px">SW</th>
							                        <th class="column-title" width="100px">수량</th>
							                    </tr>
	                        				</thead>
						                    <tbody id="hangulTableDetail">
						                    </tbody>
	                      				</table>
	                    			</div>
								</div>
	                        </div>
	                      </div>
	                      <div class="panel">
	                      	<a class="panel-heading collapsed" role="tab" id="headingThree1" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1" aria-expanded="false" aria-controls="collapseThree">
	                        	<h4 class="panel-title">Graphic<small><span id="graphicCnt" name="graphicCnt" class="pull-right"></span></small></h4>
	                        </a>
	                       	<div id="collapseThree1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
	                        	<div class="panel-body">
	                            	<div class="table-responsive">
					                	<table class="table table-striped jambo_table" style="table-layout: fixed" id="graphicTable" name="graphicTable">
	                        				<thead>
				                         		<tr class="headings">
						                        	<th class="column-title" width="60px">팀</th>
							                        <th class="column-title" width="100px">이름</th>
							                        <th class="column-title" width="100px">포지션</th>
							                        <th class="column-title" width="100px">SW</th>
							                        <th class="column-title" width="100px">수량</th>
							                    </tr>
	                        				</thead>
						                    <tbody id="graphicTableDetail">
						                    </tbody>
	                      				</table>
					                </div>
	                            </div>
	                      	</div>
	                      </div>
	                    </div>
	                    <!--아코디언  -->
	                </div>
                </div>
                
        	</div>
        	<div class="col-md-6 col-xs-12">
            	<div class="x_panel">
                	<div class="x_content">
						<!--아코디언  -->
	                	<div class="accordion" id="accordion2" role="tablist" aria-multiselectable="true">
	                    	<div class="panel">
		                        <a class="panel-heading collapsed" role="tab" id="headingOne2" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2" aria-expanded="false" aria-controls="collapseOne">
		                        	<h4 class="panel-title">Adobe<small><span id="adobeCnt" name="adobeCnt" class="pull-right"></span></small></h4>      	
		                        </a>
		                        <div id="collapseOne2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne2">
		                        	<div class="panel-body">
		                        		<div class="table-responsive">
					                		<table class="table table-striped jambo_table" style="table-layout: fixed" id="adobeTable" name="adobeTable">
	                        					<thead>
				                          			<tr class="headings">
							                        	<th class="column-title" width="60px">팀</th>
								                        <th class="column-title" width="100px">이름</th>
								                        <th class="column-title" width="100px">포지션</th>
								                        <th class="column-title" width="100px">SW</th>
								                        <th class="column-title" width="100px">수량</th>
							                        </tr>
	                        					</thead>
						                        <tbody id="adobeTableDetail">
						                        </tbody>
	                      					</table>
	                    				</div>
		                          	</div>
		                        </div>
	                      </div>
	                      <div class="panel">
	                      	<a class="panel-heading collapsed" role="tab" id="headingTwo2" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo">
	                        	<h4 class="panel-title">Cad<small><span id="cadCnt" name="cadCnt" class="pull-right"></span></small></h4>
	                        </a>
	                        <div id="collapseTwo2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo2">
	                        	<div class="panel-body">
		                            <div class="table-responsive">
					                	<table class="table table-striped jambo_table" style="table-layout: fixed" id="cadTable" name="cadTable" >
	                        				<thead>
				                         		<tr class="headings" >
						                        	<th class="column-title" width="60px">팀</th>
							                        <th class="column-title" width="100px">이름</th>
							                        <th class="column-title" width="100px">포지션</th>
							                        <th class="column-title" width="100px">SW</th>
							                        <th class="column-title" width="100px">수량</th>
							                    </tr>
	                        				</thead>
						                    <tbody id="cadTableDetail">
						                    </tbody>
	                      				</table>
	                    			</div>
								</div>
	                        </div>
	                      </div>
	                      <div class="panel">
	                      	<a class="panel-heading collapsed" role="tab" id="headingThree3" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree2" aria-expanded="false" aria-controls="collapseThree">
	                        	<h4 class="panel-title">기타<small><span id="etcSWCnt" name="etcSWCnt" class="pull-right"></span></small></h4>
	                        </a>
	                       	<div id="collapseThree2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree2">
	                        	<div class="panel-body">
		                            <div class="table-responsive">
					                	<table class="table table-striped jambo_table" style="table-layout: fixed" id="etcTable" name="etcTable">
	                        				<thead>
				                         		<tr class="headings">
						                        	<th class="column-title" width="60px">팀</th>
							                        <th class="column-title" width="100px">이름</th>
							                        <th class="column-title" width="100px">포지션</th>
							                        <th class="column-title" width="100px">SW</th>
							                        <th class="column-title" width="100px">수량</th>
							                    </tr>
	                        				</thead>
						                    <tbody id="etcTableDetail">
						                    </tbody>
	                      				</table>
	                    			</div>
	                            </div>
	                      	</div>
	                      </div>
	                    </div>
	                    <!--아코디언  -->                	

	            	</div>
                </div>
        	</div>
        </div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		var usrEmpCode = ${sessionScope.usrID};
		var usrDepCode = ${sessionScope.usrDepCode};
		
		setSelectBox("orgFlag","orgFlag");
		
		if(usrDepCode != "50000059"){
			setUsrOrgInfo(usrEmpCode);
			$("#orgFlag").prop("disabled",true);	
		}
		
		if("${param.highOrgCode}" !=""){
			setTimeout(function(){
				$("#orgFlag").val("${param.orgFlag}");
				$("#highOrgCode").val("${param.highOrgCode}");
				$("#divisionName").html("${param.divisionName}");
				swm104Search();
 			},100)
			
		}
 	});
 		
	function popModalChek(){
		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		$("#orgListModal").modal();
 	}
	
	function swm104Search(){
		
		if($("#highOrgCode").val() ==""){
			PNotifyAlert("error","부서를 선택해 주시기 바랍니다.","");
			return false;
		}
		
		$.ajax({
			type : "post",
			url : "searchSwm104DepSwData.do",
			async : true,
			data : {
				orgFlag	: $("#orgFlag").val(),
				highOrgCode	: $("#highOrgCode").val(),
				lowOrgCode	: document.getElementById("teamCheck").checked == true ? $("#lowOrgCode").val() :""
			},
			success : function(searchData){
				var msStr = "";
				var hangulStr = "";
				var grapgicStr = "";
				var adobeStr = "";
				var cadStr = "";
				var ectStr = "";
				
				var msOfficCnt = 0;
				var hangulCnt = 0;
				var graphicCnt = 0;
				var adobeCnt = 0;
				var cadCnt = 0;
				var etcSWCnt = 0;
				
				console.log(searchData);
				if(searchData.length==0){
					PNotifyAlert("info","","검색결과가 존재하지 않습니다.");
				}else{
					$.each(searchData, function(index) {
						
						if(searchData[index].swType =="msOffice"){
				    		msStr += "<tr>";
				    		msStr += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    		msStr += "	<td>"+ searchData[index].empName +"</td>";
				    		msStr += "	<td>"+ searchData[index].position +"</td>";
				    		msStr += "	<td>"+ searchData[index].swLicenseName +"</td>";
				    		msStr += "	<td>"+ searchData[index].qty +"</td>";
				    		msStr += "</tr>";
				    		
				    		msOfficCnt += searchData[index].qty;
				    	}
				    	
				    	if(searchData[index].swType =="hangul"){
				    		hangulStr += "<tr>";
				    		hangulStr += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    		hangulStr += "	<td>"+ searchData[index].empName +"</td>";
				    		hangulStr += "	<td>"+ searchData[index].position +"</td>";
				    		hangulStr += "	<td>"+ searchData[index].swLicenseName +"</td>";
				    		hangulStr += "	<td>"+ searchData[index].qty +"</td>";
				    		hangulStr += "</tr>";
				    		
				    		hangulCnt += searchData[index].qty;
				    	}

				    	if(searchData[index].swType =="graphic"){
				    		grapgicStr += "<tr>";
				    		grapgicStr += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    		grapgicStr += "	<td>"+ searchData[index].empName +"</td>";
				    		grapgicStr += "	<td>"+ searchData[index].position +"</td>";
				    		grapgicStr += "	<td>"+ searchData[index].swLicenseName +"</td>";
				    		grapgicStr += "	<td>"+ searchData[index].qty +"</td>";
				    		grapgicStr += "</tr>";
				    		
				    		graphicCnt += searchData[index].qty;
				    	}

				    	if(searchData[index].swType =="adobe"){
				    		adobeStr += "<tr>";
				    		adobeStr += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    		adobeStr += "	<td>"+ searchData[index].empName +"</td>";
				    		adobeStr += "	<td>"+ searchData[index].position +"</td>";
				    		adobeStr += "	<td>"+ searchData[index].swLicenseName +"</td>";
				    		adobeStr += "	<td>"+ searchData[index].qty +"</td>";
				    		adobeStr += "</tr>";
				    		
				    		adobeCnt += searchData[index].qty;
				    	}

				    	if(searchData[index].swType =="cad"){
				    		cadStr += "<tr>";
				    		cadStr += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    		cadStr += "	<td>"+ searchData[index].empName +"</td>";
				    		cadStr += "	<td>"+ searchData[index].position +"</td>";
				    		cadStr += "	<td>"+ searchData[index].swLicenseName +"</td>";
				    		cadStr += "	<td>"+ searchData[index].qty +"</td>";
				    		cadStr += "</tr>";
				    		
				    		cadCnt += searchData[index].qty;
				    	}

				    	if(searchData[index].swType =="swEtc"){
				    		ectStr += "<tr>";
				    		ectStr += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    		ectStr += "	<td>"+ searchData[index].empName +"</td>";
				    		ectStr += "	<td>"+ searchData[index].position +"</td>";
				    		ectStr += "	<td>"+ searchData[index].swLicenseName +"</td>";
				    		ectStr += "	<td>"+ searchData[index].qty +"</td>";
				    		ectStr += "</tr>";
				    		
				    		etcSWCnt += searchData[index].qty;
				    	}
				    	
			    	});
				}
				$("#msOfficTableDetail").html(msStr);
				$("#hangulTableDetail").html(hangulStr);
				$("#graphicTableDetail").html(grapgicStr);
				$("#adobeTableDetail").html(adobeStr);
				$("#cadTableDetail").html(cadStr);
				$("#etcTableDetail").html(ectStr);
				
				$("#msOfficCnt").html(msOfficCnt);
				$("#hangulCnt").html(hangulCnt);
				$("#graphicCnt").html(graphicCnt);
				$("#adobeCnt").html(adobeCnt);
				$("#cadCnt").html(cadCnt);
				$("#etcSWCnt").html(etcSWCnt);
				
				
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
	}
		
	function setUsrOrgInfo(getEmpCode){
		$.ajax({
			type: "post",
			url: "getUsrOrgInfo.do",
			data: { 
					empCode : getEmpCode
			},
			success: function(data){
				$("#highOrgCode").val(data[0].highOrgCode);
				$("#divisionName").html(data[0].highOrgName);
				$("#lowOrgCode").val(data[0].lowOrgCode);
				$("#teamName").html(data[0].lowOrgName);
				$("#orgFlag").val(data[0].orgFlag);
				swm104Search();
			}
		});
	}
	
	function swm104Excel(){
		document.swm104form01.submit();	
	}
	
	
</script>