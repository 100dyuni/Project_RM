<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery.min.js"></script>

<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>
<!-- bootstrap-daterangepicker -->
<link href="css/daterangepicker.css" rel="stylesheet">
<!-- bootstrap-datetimepicker -->
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
<script src="js/bootstrap-datetimepicker.min.js"></script>

<div class="">
	<div class="">
		<div class="page-title">
			<div class="title_left">
		    	<h3>코드관리</h3>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
        	<div class="col-md-4 col-xs-12">
            	<div class="x_panel" >
	            	<div class = "x_title">
	            		<div class="title_left">
							<h2>코드분류 상위</h2>
						</div>
						<div class="title_right">
							<div class="col-md-5 form-group pull-right">
								<button type="button" class="btn btn-dark" onclick="highCodeSearch()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
								<button type="button" class="btn btn-dark" onclick="highCodeSave()"><i class="fa fa-save">&nbsp;&nbsp;저장</i></button>
							</div>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
            	
                	<div class="x_content">
                		<form id="highCodeForm" name="highCodeForm" class="form-horizontal" enctype="multipart/form-data" method="post">
                			<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">상위 코드</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="highcode" name="highCode">
							    </div>
							</div>
							<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">상위 코드명</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="highCodeName" name="highCodeName">
							    </div>
							</div>
                		</form>
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th class="column-title" width="40px">코드</th>
			                            <th class="column-title" width="50px">코드명 </th>
			                        </tr>
	                          	</thead>
		                        <tbody id="highCodeList">
		                
		                        </tbody>
	                      </table>
	                    </div>
	                </div>
                </div>
                
        	</div>
        	<div class="col-md-8 col-xs-12">
            	<div class="x_panel">
            		<div class = "x_title">
	            		<div class="title_left">
							<h2>코드분류 하위</h2>
						</div>
						<div class="title_right">
							<div class="col-md-3 form-group pull-right">
								<button type="button" class="btn btn-dark" onclick="lowCodeInit()"><i class="fa fa-file-o">&nbsp;&nbsp;신규</i></button>
								<button type="button" class="btn btn-dark" onclick="lowCodeSave()"><i class="fa fa-save">&nbsp;&nbsp;저장</i></button>
							</div>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
                	<div class="x_content">
	                	<form id="lowCodeForm" name="lowCodeForm" class="form-horizontal" enctype="multipart/form-data" method="post">
	                		<div class="hidden">
	                			<label class="col-md-4 col-sm-4 col-xs-10 control-label">상위 코드</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="highCodeHidden" name="highCodeHidden">
							    </div>
	                		</div>
                			<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">하위 코드</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="lowCode" name="lowCode">
							    </div>
							    <br>
							    <br>
							    <label class="col-md-4 col-sm-4 col-xs-10 control-label">하위 코드명</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="lowCodeName" name="lowCodeName">
							    </div>
							    
							</div>
							<div class="clearfix"></div>
							<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">사용유무</label>
							    <div class="col-md-2 col-sm-2 col-xs-12">
							    	<!-- <input type="text" class="form-control" id="useYN" name="useYN"> -->
							    	<select class="form-control" id="useYN" name="useYN">
							    	
							    	</select>
							    </div>
							    <label class="col-md-1 col-sm-1 col-xs-10 control-label">순서</label>
							    <div class="col-md-2 col-sm-2 col-xs-12">
							    	<input type="text" class="form-control" id="orderCount" name="orderCount">
							    </div>
							</div>
						</form>
                		
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th class="column-title" width="40px">상위 코드</th>
	                            		<th class="column-title" width="40px">코드</th>
			                            <th class="column-title" width="50px">코드명 </th>
	                            		<th class="column-title" width="40px">순서</th>
	                            		<th class="column-title" width="40px">사융유무</th>
			                        </tr>
	                          	</thead>
		                        <tbody id="lowCodeList">
		                         		
		                         	
		                         	
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
	highCodeSearch();
	setSelectBox("useYN","activeFlag");
	
	$("#highCodeList").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();
		var highCode = td.eq(0).text();
		lowCodeSearch(highCode);
	});
	
	$("#lowCodeList").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();
		
		var highCode = td.eq(0).text();
		var lowCode = td.eq(1).text();
		var lowCodeName = td.eq(2).text();
		var orderCount = td.eq(3).text();
		var useYN = td.eq(4).text();
		
		$("#lowCode").val(lowCode);
		$("#lowCodeName").val(lowCodeName);
		//$("#useYN").val(useYN).attr("selected","selected");
		$("#useYN").val(useYN);
		$("#orderCount").val(orderCount);
		
	});
	
	
});

function highCodeSearch(){
	$.ajax({
			type: "post",
			url: "highCodeSearch.do",
			data: $("form[name=highCodeForm]").serializeArray(),
			success: function(data){
				var str = "";
		    	$.each(data, function(index) {
					str += "<tr>";
					str += "<td>" + ( data[index].highCode) + "</th>";
		    		str += "<td>" + ( data[index].highCodeName ) + "</td>";
		    		str += "</tr>"
		    	});
				$("#highCodeList").html(str);	
			}
		});
}

function lowCodeSearch(highCode){
	$.ajax({
		type: "post",
		url: "lowCodeSearch.do",
		data:  "highCode="+highCode,
		success: function(data){
			var str = "";
	    	$.each(data, function(index) {
				str += "<tr>";
				str += "<td>" + ( data[index].highCode) + "</th>";
	    		str += "<td>" + ( data[index].lowCode ) + "</td>";
				str += "<td>" + ( data[index].lowCodeName) + "</th>";
	    		str += "<td>" + ( data[index].orderCount ) + "</td>";
	    		str += "<td>" + ( data[index].useYN ) + "</td>";
	    		str += "</tr>";
	    	});
			$("#lowCodeList").html(str);	
			$("#highCodeHidden").val(highCode);
			lowCodeInit();
		}
	});
}

function highCodeSave(){
	
	if($("#highCode").val()==""){
		alert("[상위 코드]를 입력해 주시기 바랍니다.");
		return false;
	}
	if($("#highCodeName").val()==""){
		alert("[상위 코드명]을 입력해 주시기 바랍니다.");
		return false;
	}
	
	$.ajax({
		type: "post",
		url: "insertHighCode.do",
		data: $("form[name=highCodeForm]").serializeArray(),
		success: function(data){
			if(data=="S"){
				alert("상위코드 저장이 완료되었습니다.");
				$("#highCode").val("");
				$("#highCodeName").val("");
				highCodeSearch();
			}
		}
	});
	
}

function lowCodeInit(){
	$("#lowCode").val("");
	$("#lowCodeName").val("");
	$("#useYN").val("Y");
	$("#orderCount").val("");
}

function lowCodeSave(){
	if($("#highCodeHidden").val()==""){
		alert("[상위 코드]를 선택해 주시기 바랍니다.");
		return false;
	}
	if($("#lowCode").val()==""){
		alert("[하위 코드]를 입력해 주시기 바랍니다.");
		return false;
	}
	if($("#lowCodeName").val()==""){
		alert("[하위 코드명]을 입력해 주시기 바랍니다.");
		return false;
	}
	if($("#orderCount").val()==""){
		alert("[순서]를 입력해 주시기 바랍니다.");
		return false;
	}
	
	$.ajax({
		type: "post",
		url: "saveLowCode.do",
		data: lowCodeBindData(),
		success: function(data){
			if(data=="S"){
				alert("하위코드 저장이 완료되었습니다.");
				lowCodeSearch($("#highCodeHidden").val());
				lowCodeInit();
			}
		}
	});
	
}



function lowCodeBindData(){
	var lowCodeData = $("form[name=lowCodeForm]").serializeArray();
	var highCode = {name : "highCode", value : $("#highCodeHidden").val()};
	lowCodeData.push(highCode);
	return lowCodeData;
}



</script>
