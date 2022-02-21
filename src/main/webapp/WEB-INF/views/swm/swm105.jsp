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
		    	<h3>S/W 별 분포 현황</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="swm105Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<button class="btn btn-dark" type="button" onclick="swm105Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
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
				<form class="form-horizontal" name="swm105form01" id ="swm105form01" method="get" action="swm105Excel.do" accept-charset="utf-8">
					<div class="form-group">
						<label class="col-md-1 checkbox">
							<label>S/W 종류</label>
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
				<form class="form-horizontal" name="swm105form02" id ="swm105form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table " style="table-layout: fixed" id="searchswm105Table"><!-- bulk_action -->
			            	<thead>
			                	<tr class="headings center">
			                		<th width="100px">SW 종류</th>
			                		<th width="100px">라이센스</th>
			                		<th width="100px">부서</th>
			                		<th width="100px">팀</th>
			                		<th width="100px">사번</th>
			                		<th width="100px">이름</th>
			                		<th width="100px">수량</th>
			                		<th width="100px" hidden="hidden">gp</th>
			                	</tr>
			                </thead>
			                <tbody id ="swActiveAndPurCountList">
			                </tbody>
			            </table>
			            <div id="swm105PagingInfo"></div>
			            <input type="hidden" id="pagingLastNum">
					</div>
				</form>
			</div>
		</div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		
		$("#swType").change(function(){
 			setSelectBox("swLicense",$("#swType").val());
 		});
		
		setSelectBox("swType","swLicence");
 		setSelectBox("swLicense","msOffice");
 	});
 		
	
	function swm105Search(){
		$.ajax({
			type : "post",
			url : "swm105Search.do",
			data : {
				swType		: $("#swType").val(),
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
						str += "	<td>"+ searchData[index].swTypeName +"</td>";
			    		str += "	<td>"+ searchData[index].swLicenseName +"</td>";
						str += "	<td>"+ searchData[index].LCode1Name +"</td>";
			    		str += "	<td>"+ searchData[index].lowOrgName +"</td>";
			    		str += "	<td>"+ searchData[index].LCode2 +"</td>";
			    		str += "	<td>"+ searchData[index].LCode2Name +"</td>";
			    		str += "	<td>"+ searchData[index].qty +"</td>";
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
		
	function swm105Excel(){
		document.swm105form01.submit();	
	}
	
	
	
	
	
</script>