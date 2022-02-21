<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery.min.js"></script>

<script src="js/moment.min.js"></script>

<div class="">
	<div class="">
		<div class="page-title">
			<div class="title_left">
		    	<h3>조직관리</h3>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
        	<div class="col-md-4 col-xs-12">
            	<div class="x_panel" >
	            	<div class = "x_title">
	            		<div class="title_left">
							<h2>상위조직</h2>
						</div>
						<div class="title_right">
							<div class="col-md-5 form-group pull-right">
								<button type="button" class="btn btn-dark" onclick="searchHighOrg()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
								<button type="button" class="btn btn-dark" onclick="saveHighOrg()"><i class="fa fa-save">&nbsp;&nbsp;저장</i></button>
							</div>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
            	
                	<div class="x_content">
                		<form id="highOrgForm" name="highOrgForm" class="form-horizontal" enctype="multipart/form-data" method="post">
                			<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-12 control-label">조직 구분</label>
							    <div class="col-md-8 col-sm-8 col-xs-12">
							    	<select class="form-control" id="orgFlag" name="orgFlag">
							    	
							    	</select>
							    </div>
							</div>
                			<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-12 control-label">부서 코드</label>
							    <div class="col-md-8 col-sm-8 col-xs-12">
							    	<input type="text" class="form-control" id="highOrgCode" name="highOrgCode">
							    </div>
							</div>
							<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-12 control-label">부서명</label>
							    <div class="col-md-8 col-sm-8 col-xs-12">
							    	<input type="text" class="form-control" id="highOrgName" name="highOrgName">
							    </div>
							</div>
							<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-6 control-label">사용유무</label>
							    <div class="col-md-3 col-sm-3 col-xs-6">
							    	<!-- <input type="text" class="form-control" id="useYN" name="useYN"> -->
							    	<select class="form-control" id="hUseYN" name="hUseYN">
							    	
							    	</select>
							    </div>
							    <label class="col-md-2 col-sm-2 col-xs-6 control-label">순서</label>
							    <div class="col-md-3 col-sm-3 col-xs-6">
							    	<input type="text" class="form-control" id="hOrderCount" name="hOrderCount">
							    </div>
							</div>
                		</form>
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th class="column-title" width="40px">코드</th>
			                            <th class="column-title" width="50px">부서명 </th>
			                            <th class="column-title" width="40px">순서</th>
	                            		<th class="column-title" width="40px">사융유무</th>
			                        </tr>
	                          	</thead>
		                        <tbody id="highOrgList">
		                
		                        </tbody>
	                      </table>
	                    </div>
	                </div>
                </div>
                
        	</div>
        	<div class="col-md-5 col-xs-12">
            	<div class="x_panel">
            		<div class = "x_title">
	            		<div class="title_left">
							<h2>하위 조직</h2>
						</div>
						<div class="title_right">
							<div class="col-md-4 form-group pull-right">
							<!-- <div class="col-md-6 form-group pull-right"> -->
								<button type="button" class="btn btn-dark" onclick="lowOrgInit()"><i class="fa fa-file-o">&nbsp;&nbsp;신규</i></button>
								<!-- <button type="button" class="btn btn-dark" onclick="findOrgInfo()"><i class="fa fa-search">&nbsp;&nbsp;검색</i></button> -->
								<button type="button" class="btn btn-dark" onclick="saveLowOrg()"><i class="fa fa-save">&nbsp;&nbsp;저장</i></button>
							</div>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
                	<div class="x_content">
	                	<form id="lowOrgForm" name="lowOrgForm" class="form-horizontal" enctype="multipart/form-data" method="post">
	                		<div class="hidden">
	                		<!-- <div class="form-group"> -->
	                			<label class="col-md-3 col-sm-3 col-xs-12 control-label">상위 조직</label>
							    <div class="col-md-8 col-sm-8 col-xs-12">
							    	<input type="text" class="form-control" id="highCodeHidden" name="highCodeHidden">
							    	<input type="text" class="form-control" id="highCodeOrgHidden" name="highCodeOrgHidden">
							    </div>
	                		</div>
                			<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-12 control-label">조직 코드</label>
							    <div class="col-md-8 col-sm-8 col-xs-12">
							    	<input type="text" class="form-control" id="lowOrgCode" name="lowOrgCode">
							    </div>
							    <br>
							    <br>
							    <label class="col-md-3 col-sm-3 col-xs-12 control-label">팀 명</label>
							    <div class="col-md-8 col-sm-8 col-xs-12">
							    	<input type="text" class="form-control" id="lowOrgName" name="lowOrgName">
							    </div>
							    
							</div>
							<div class="clearfix"></div>
							<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-6 control-label">사용유무</label>
							    <div class="col-md-3 col-sm-3 col-xs-6">
							    	<!-- <input type="text" class="form-control" id="useYN" name="useYN"> -->
							    	<select class="form-control" id="lUseYN" name="lUseYN">
							    	
							    	</select>
							    </div>
							    <label class="col-md-2 col-sm-2 col-xs-6 control-label">순서</label>
							    <div class="col-md-3 col-sm-3 col-xs-6">
							    	<input type="text" class="form-control" id="lOrderCount" name="lOrderCount">
							    </div>
							</div>
						</form>
                		
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th class="column-title" width="40px">상위 조직</th>
	                            		<th class="column-title" width="40px">코드</th>
			                            <th class="column-title" width="50px">팀 명 </th>
	                            		<th class="column-title" width="40px">순서</th>
	                            		<th class="column-title" width="40px">사융유무</th>
			                        </tr>
	                          	</thead>
		                        <tbody id="lowOrgList">
		                         		
		                         	
		                         	
		                        </tbody>
	                      </table>
	                    </div>
                		
	                </div>
                </div>
                
        	</div>
        	<div class="col-md-3 col-xs-12">
            	<div class="x_panel" >
	            	<div class = "x_title">
	            		<div class="title_left">
							<h2>구성원</h2>
						</div>
						
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
            	
                	<div class="x_content">
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th class="column-title" width="50px">조직</th>
			                            <th class="column-title" width="40px">이름 </th>
			                            <th class="column-title" width="40px">직책 </th>
			                        </tr>
	                          	</thead>
		                        <tbody id="orgMemberList">
		                
		                        </tbody>
	                      </table>
	                    </div>
	                </div>
                </div>
                
        	</div>
        </div>
		
	</div>
</div>


<script type="text/javascript">

$(document).ready(function(){
	searchHighOrg();
	setSelectBox("hUseYN","activeFlag");
	setSelectBox("lUseYN","activeFlag");
	setSelectBox("orgFlag","orgFlag");
	
	$("#highOrgList").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();
		var highOrgCode = td.eq(0).text();
		var highOrgName = td.eq(1).text();
		var hOrderCount = td.eq(2).text();
		var hUseYN = td.eq(3).text();
		var orgFlag = $("#orgFlag").val();
		
		$("#highOrgCode").val(highOrgCode);
		$("#highOrgName").val(highOrgName);
		$("#hUseYN").val(hUseYN);
		$("#hOrderCount").val(hOrderCount);
		
		searchLowOrg(highOrgCode,orgFlag);
		searchOrgMemberList(highOrgCode,orgFlag);
	});
	
	$("#lowOrgList").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();
		
		var highCode = td.eq(0).text();
		var lowCode = td.eq(1).text();
		var lowCodeName = td.eq(2).text();
		var orderCount = td.eq(3).text();
		var useYN = td.eq(4).text();
		
		$("#lowOrgCode").val(lowCode);
		$("#lowOrgName").val(lowCodeName);
		//$("#useYN").val(useYN).attr("selected","selected");
		$("#lUseYN").val(useYN);
		$("#lOrderCount").val(orderCount);
		
	});
	
	$("#orgFlag").change(function(){
		$("#highOrgCode").val("");
		$("#highOrgName").val("");
		$("#hOrderCount").val("");
		$("#hUseYN").val("Y");
		$("#highCodeHidden").val("");
		$("#highCodeOrgHidden").val("");
		
		searchHighOrg();
		$("#orgMemberList").html("");
		
	})
	
});

function saveHighOrg(){
	
	if($("#highOrgCode").val()==""){
		alert("[상위 조직]를 입력해 주시기 바랍니다.");
		return false;
	}
	if($("#highOrgName").val()==""){
		alert("[상위 조직명]을 입력해 주시기 바랍니다.");
		return false;
	}
	
	$.ajax({
		type: "post",
		url: "saveHighOrg.do",
		data: $("form[name=highOrgForm]").serializeArray(),
		success: function(data){
			if(data=="S"){
				alert("[상위조직] 저장이 완료되었습니다.");
				$("#highOrgCode").val("");
				$("#highOrgName").val("");
				$("#hOrderCount").val("");
				searchHighOrg();
			}
		}
	});
	
}

function searchHighOrg(){
	$.ajax({
			type: "post",
			url: "searchHighOrg.do",
			data: $("form[name=highOrgForm]").serializeArray(),
			success: function(data){
				var str = "";
		    	$.each(data, function(index) {
					str += "<tr>";
					str += "<td>" + ( data[index].highOrgCode) + "</th>";
		    		str += "<td>" + ( data[index].highOrgName ) + "</td>";
		    		str += "<td>" + ( data[index].hOrderCount ) + "</td>";
		    		str += "<td>" + ( data[index].hUseYN) + "</th>";
		    		str += "</tr>"
		    	});
				$("#highOrgList").html(str);
				$("#lowOrgList").html("");	
				lowOrgInit();
			}
		});
}

function searchLowOrg(highOrgCode,orgFlag){
	$.ajax({
		type: "post",
		url: "searchLowOrg.do",
		data:  "highOrgCode="+highOrgCode+"&orgFlag="+orgFlag,
		success: function(data){
			var str = "";
	    	$.each(data, function(index){
				str += "<tr>";
				str += "<td>" + ( data[index].highOrgCode) + "</th>";
	    		str += "<td>" + ( data[index].lowOrgCode ) + "</td>";
				str += "<td>" + ( data[index].lowOrgName) + "</th>";
	    		str += "<td>" + ( data[index].lOrderCount ) + "</td>";
	    		str += "<td>" + ( data[index].lUseYN ) + "</td>";
	    		str += "</tr>";
	    	});
			$("#lowOrgList").html(str);	
			$("#highCodeHidden").val(highOrgCode);
			$("#highCodeOrgHidden").val(orgFlag);
			lowOrgInit();
		}
	});
}

function lowOrgInit(){
	$("#lowOrgCode").val("");
	$("#lowOrgName").val("");
	$("#lUseYN").val("Y");
	$("#lOrderCount").val("");
}

function saveLowOrg(){
	if($("#highCodeHidden").val()==""){
		alert("[상위 코드]를 선택해 주시기 바랍니다.");
		return false;
	}
	if($("#lowOrgCode").val()==""){
		alert("[하위 코드]를 입력해 주시기 바랍니다.");
		return false;
	}
	if($("#lowOrgName").val()==""){
		alert("[하위 코드명]을 입력해 주시기 바랍니다.");
		return false;
	}
	if($("#lOrderCount").val()==""){
		alert("[순서]를 입력해 주시기 바랍니다.");
		return false;
	}
	
	$.ajax({
		type: "post",
		url: "saveLowOrg.do",
		data: lowOrgBindData(),
		success: function(data){
			if(data=="S"){
				alert("하위조직 저장이 완료되었습니다.");
				searchLowOrg($("#highCodeHidden").val(),$("#highCodeOrgHidden").val());
				lowOrgInit();
			}
		}
	});
	
}



function lowOrgBindData(){
	var lowOrgData = $("form[name=lowOrgForm]").serializeArray();
	var highCode = {name : "highOrgCode", value : $("#highCodeHidden").val()};
	var orgFlag = {name : "orgFlag", value : $("#highCodeOrgHidden").val()};
	lowOrgData.push(highCode);
	lowOrgData.push(orgFlag);
	return lowOrgData;
}

function findOrgInfo(){
	$("#teamListModal").modal();
}

function searchOrgMemberList(){
	$.ajax({
		type: "post",
		url: "searchOrgMemberList.do",
		data: $("form[name=highOrgForm]").serializeArray(),
		success: function(data){
			var str = "";
	    	$.each(data, function(index) {
				str += "<tr>";
				str += "<td>" + ( data[index].lowOrgName) + "</th>";
	    		str += "<td>" + ( data[index].empName ) + "</td>";
	    		str += "<td>" + ( data[index].rankName ) + "</td>";
	    		str += "</tr>"
	    	});
			$("#orgMemberList").html(str);	
		}
	});
}


</script>
