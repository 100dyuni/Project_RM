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
		    	<h3>S/W 수량 조회</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="swm102Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<button class="btn btn-dark" type="button" onclick="swm102Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
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
				<form class="form-horizontal" name="swm102form01" id ="swm102form01" method="get" action="swm102Excel.do" accept-charset="utf-8">
					<div class="form-group">
						<div class="col-md-1 ">
							<label class="control-label">기준 날짜</label>
						</div>
						<div class="col-md-2">
							<div class="input-group date" id="purDatePicker">
						  		<input type='text' class="form-control" id="purDate" name="purDate" data-inputmask="'mask' : '9999.99.99'"/>
				                <span class="input-group-addon">
				                	<span class="glyphicon glyphicon-calendar"></span>
				                </span>
						  	</div>
						</div>
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
				<form class="form-horizontal" name="swm102form02" id ="swm102form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table " style="table-layout: fixed" id="searchswm102Table"><!-- bulk_action -->
			            	<thead>
			                	<tr class="headings center">
			                		<th width="100px">SW 종류</th>
			                		<th width="100px">라이센스</th>
			                		<th width="100px">분배수량</th>
			                		<th width="100px">구매수량</th>
			                		<th width="100px" hidden="hidden">gp</th>
			                	</tr>
			                </thead>
			                <tbody id ="swActiveAndPurCountList">
			                </tbody>
			            </table>
			            <div id="swm102PagingInfo"></div>
			            <input type="hidden" id="pagingLastNum">
					</div>
				</form>
			</div>
		</div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		
		$("#purDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		
		$("#purDate").val(getSysDate());
		
		$("#purDate").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#purDate").blur();
		    }
		});
		
		$("#swType").change(function(){
 			setSelectBox("swLicense",$("#swType").val());
 		});
		
		setSelectBox("swType","swLicence");
 		setSelectBox("swLicense","msOffice");
 	});
 		
	
	function swm102Search(){
		//var str="";
		$.ajax({
			type : "post",
			url : "swm102Search.do",
			data : {
				purDate		: $("#purDate").val(),
				swType		: document.getElementById("swTypeCheck").checked == true ? $("#swType").val() :"",
				swLicense	: document.getElementById("swLicenseCheck").checked == true ? $("#swLicense").val() :""
			},
			success : function(searchData){
				var str = "";
				//console.log(searchData);
				if(searchData.length==0){
					PNotifyAlert("info","","검색결과가 존재하지 않습니다.");
				}else{
					$.each(searchData, function(index) {
						
						if(searchData[index].gp==1){
							str += "<tr bgcolor='#EEEEEE'>";
						}else if(searchData[index].gp==2){
							str += "<tr bgcolor='#DDDDDD'>";
						}else{
							str += "<tr>";	
						}
						str += "	<td>"+ searchData[index].swTypeName +"</td>";
			    		str += "	<td>"+ searchData[index].swLicenseName +"</td>";
			    		str += "	<td>"+ searchData[index].actQty +"</td>";
			    		str += "	<td>"+ searchData[index].purQty +"</td>";
			    		str += "	<td hidden='hidden'>"+ searchData[index].gp +"</td>";
			    		str += "</tr>";
			    	});
				}
				$("#swActiveAndPurCountList").html(str);
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
		
	}
		
	function swm102Excel(){
		document.swm102form01.submit();	
	}
	
	
	
	
	
</script>