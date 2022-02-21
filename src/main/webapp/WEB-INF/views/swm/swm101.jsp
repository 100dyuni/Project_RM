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
		    	<h3>S/W 구매내역 조회</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="swm101Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<button class="btn btn-dark" type="button" onclick="swm101Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
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
				<form class="form-horizontal" name="swm101form01" id ="swm101form01" method="get" action="swm101Excel.do" accept-charset="utf-8">
					<div class="form-group">
						<div class="col-md-1 checkbox">
							<label><input type="checkbox" id="purNumCheck" name="purNumCheck">품의 번호</label>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="purNum" name ="purNum">
						</div>
						<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="purDateCheck" name="purDateCheck">구매일자</label>
						</div>
						<div class="col-md-2">
							<div class="input-group date" id="purDateFromPicker">
						  		<input type='text' class="form-control" id="purDateFrom" name="purDateFrom" data-inputmask="'mask' : '9999.99.99'"/>
				                <span class="input-group-addon">
				                	<span class="glyphicon glyphicon-calendar"></span>
				                </span>
						  	</div>
						</div>
						<div class="col-md-2">
						  	<div class="input-group date" id="purDateToPicker">
						  		<input type='text' class="form-control" id="purDateTo" name="purDateTo" data-inputmask="'mask' : '9999.99.99'"/>
				                <span class="input-group-addon">
				                  	<span class="glyphicon glyphicon-calendar"></span>
				                </span>
						  	</div>
						</div>
					</div>
					<div class="form-group">
						
						<label class="col-md-1 checkbox">
							<label><input type="checkbox" id="swTypeCheck" name="swTypeCheck">S/W 종류</label>
						</label>
						<div class="col-md-2 ">
							<select class="select2_single form-control" tabindex="-1" required="required" id="swType" name="swType">
							</select>
						</div>
						<label class="col-md-1 checkbox">
							<label><input type="checkbox" id="swLicenseCheck" name="swLicenseCheck">라이센스</label>
						</label>
						<div class="col-md-2 ">
							<select class="select2_single form-control" tabindex="-1" required="required" id="swLicense" name="swLicense">
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="x_panel">
			<div class = "x_content">
				<form class="form-horizontal" name="swm101form02" id ="swm101form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table " style="table-layout: fixed" id="searchswm101Table"><!-- bulk_action -->
			            	<thead>
			                	<tr class="headings center">
			                		<th hidden="true">sSeq</th>
			                		<th width="160px">품의 번호</th>
			                		<th width="100px">구매 일자</th>
			                		<th width="100px">SW 종류</th>
			                		<th width="100px">라이센스</th>
			                		<th width="100px">구매수량</th>
			                		<th width="100px">시작날짜</th>
			                		<th width="100px">종료날짜</th>
			                		<th width="200px">메모</th>
			                	</tr>
			                </thead>
			                <tbody id ="swPurchaseHistoryList">
			                </tbody>
			            </table>
			            <div id="swm101PagingInfo"></div>
			            <input type="hidden" id="pagingLastNum">
					</div>
				</form>
			</div>
		</div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		
		$("#purDateFromPicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		$("#purDateToPicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		
		$("#purDateFrom").val(getLastYear());
		$("#purDateTo").val(getSysDate());
		
		$("#purDateFrom").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#purDateFrom").blur();
		    }
		});
		
		$("#purDateTo").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#purDateTo").blur();
		    }
		});
		
		$("#swType").change(function(){
 			setSelectBox("swLicense",$("#swType").val());
 		});
		
		setSelectBox("swType","swLicence");
 		setSelectBox("swLicense","msOffice");
 	});
 		
	
	function swm101Search(){
		var str="";
		$.ajax({
			type : "post",
			url : "swm101Search.do",
			data : {
				purNum 		: document.getElementById("purNumCheck").checked == true ? $("#purNum").val() :"",
				purDateFrom : document.getElementById("purDateCheck").checked == true ? $("#purDateFrom").val() :"",
				purDateTo 	: document.getElementById("purDateCheck").checked == true ? $("#purDateTo").val() :"",
				swType		: document.getElementById("swTypeCheck").checked == true ? $("#swType").val() :"",
				swLicense	: document.getElementById("swLicenseCheck").checked == true ? $("#swLicense").val() :""
			},
			success : function(searchData){
				var str = "";
				console.log(searchData);
				if(searchData.length==0){
					PNotifyAlert("info","","검색결과가 존재하지 않습니다.");
				}else{
					$.each(searchData, function(index) {
			    		str += "<tr>";
			    		str += "	<td hidden='true'>"+ searchData[index].sSeq +"</td>";
			    		str += "	<td>"+ searchData[index].purNum +"</td>";
			    		str += "	<td>"+ searchData[index].purDate +"</td>";
			    		str += "	<td>"+ searchData[index].swType +"</td>";
			    		str += "	<td>"+ searchData[index].swLicense +"</td>";
			    		str += "	<td>"+ searchData[index].purQty +"</td>";
			    		str += "	<td>"+ searchData[index].startDate +"</td>";
			    		str += "	<td>"+ searchData[index].endDate +"</td>";
			    		str += "	<td>"+ searchData[index].Note +"</td>";
			    		str += "</tr>";
			    	});
				}
				$("#swPurchaseHistoryList").html(str);
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
		
	}
		
	function swm101Excel(){
		document.swm101form01.submit();	
	}
	
	
	
	
	
</script>