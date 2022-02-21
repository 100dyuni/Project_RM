<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- PNotify -->
<script src="js/pnotify.js"></script>
<link href="css/pnotify.css" rel="stylesheet">
<link href="css/pnotify.buttons.css" rel="stylesheet">
<script src="js/pnotify.buttons.js"></script>
<link href="css/pnotify.nonblock.css" rel="stylesheet">
<script src="js/pnotify.nonblock.js"></script>

<div class="">
	<div class="page-title">
		<div class="title_left">
    	    <h3>자산 분배 현황</h3>
        </div>
        <div class="title_right">
        	<div class=" col-xs-6 col-sm-3 col-md-3 col-lg-2 form-group pull-right">
            	<div class="input-group">
                	<span class="input-group-btn">
                		<span>
                			<button class="btn btn-dark" type="button" onclick="phoneDirectoryModal()"><span class="fa fa-phone">&nbsp;&nbsp;</span>문의 번호</button>
                    	</span>
                    </span>
                </div>
            </div>
        </div>
	</div>
</div>
	
<div class="clearfix"></div>
<div class="">
	<div class="x_panel">
		<div class = "x_title">
			<div class="title_left">
				<h2>사원정보</h2>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<form class="form-horizontal" name="main002Form1" id="main002Form1">
				<div class="form-group">
					<label class="col-md-1 col-sm-1 col-xs-3 control-label">사번</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="empCode" name="empCode" readonly="readonly">
				    </div>
				    <label class="col-md-1 col-sm-1 col-xs-3 control-label">이름</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="empName" name="empName" readonly="readonly">
				    </div>
				    <label class="col-md-1 col-sm-1 col-xs-3 control-label">직급</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="empRank" name="empRank" readonly="readonly">
				    </div>
				</div>
				
				<div class="form-group">
					<label class="col-md-1 col-sm-1 col-xs-3 control-label">부서명</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="divisionName" name="divisionName" readonly="readonly">
				    </div>
				    <label class="col-md-1 col-sm-1 col-xs-3 control-label">팀명</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="teamName" name="teamName" readonly="readonly">
				    </div>
				</div>
				
				<!--히든값  -->
				<div class="form-group" hidden="hidden"><!--hidden="hidden"  -->
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">히든값</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" id="eBtnValue" name="eBtnValue">
				    </div>
				    <button type="reset" class="btn btn-primary" id="resetBtn01" ></button>
				</div>		
				  
			</form> 
		</div>  
	</div>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-md-8 col-sm-8 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<div class="title_left">
                		<h2>HW</h2>
                	</div>
                	<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
				<div class="x_content">
					<div class="table-responsive" >
						<table class="table table-striped jambo_table" style="table-layout: fixed" id="HWListTable" name="HWListTable" >
	                    	<thead>
				            	<tr class="headings" >
						        	<th class="column-title" width="40px" hidden="hidden">rSeq</th>
							        <th class="column-title" width="50px">구분 </th>
							        <th class="column-title" width="60px">제조사</th>
							        <th class="column-title" width="100px">모델명</th>
							        <th class="column-title" width="100px">제조년월</th>
							        <th class="column-title" width="160px">식별번호</th>
							        <th class="column-title" width="100px">현위치</th>
							    </tr>
	                        </thead>
						    <tbody id="usrHWList">
						    </tbody>
	                    </table>
					</div>
				</div>
				
			</div>
		</div>
	
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel"  >
				<div class="x_title">
					<div class="title_left">
                		<h2>SW</h2>
                	</div>
                	<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
				<div class="x_content">
					<div class="table-responsive">
						<table class="table table-striped jambo_table" style="table-layout: fixed" id="monListTable" name="monListTable" >
	                    	<thead>
				            	<tr class="headings" >
				            		<th class="column-title" width="60px" hidden="hidden">SW종류C</th>
							        <th class="column-title" width="60px">SW종류</th>
							        <th class="column-title" width="100px" hidden="hidden">LicenseC</th>
							        <th class="column-title" width="100px">License</th>
							    </tr>
	                        </thead>
						    <tbody id="usrSWLicenseList">
						    </tbody>
	                    </table>
					</div>
				
				</div>
				
			</div>
		</div>
		
	</div>
	
</div>



<script type="text/javascript">

 	$(document).ready(function(){
 		var usrId = ${sessionScope.usrID};
 		getEmpInfo(usrId);
 		getHwInfoOfEmp(usrId);
 		getSwInfoOfEmp(usrId);
 		getIpAddress();
 	});
 	
 	function getEmpInfo(empCode){
 		$.ajax({
 			type: "post",
 			url: "getEmpInfo.do",
 			data: "empCode="+empCode,
 			success: function(data){
 				$("#divisionName").val(data.highOrgName);
 				$("#teamName").val(data.lowOrgName);
 				$("#empRank").val(data.rankName);
 				$("#empName").val(data.empName);
 				$("#empCode").val(empCode);
 			}
 		});
 	}
 	
 	function getHwInfoOfEmp(empCode){
 		$.ajax({
 			type: "post",
 			url: "getHwInfoOfEmp.do",
 			data: "empCode="+empCode,
 			success: function(data){
 				var str = "";
 				if(data.length==0){
 					PNotifyAlert("error","검색결과가 존재하지 않습니다.","");
 				}else{
 					$.each(data, function(index) {
 						str += "<tr>";
 						str += "	<td hidden='true'>" + ( data[index].rSeq) + "</td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].ItemType) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].Manufac ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].ModelName ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].productDate ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].IdentiCode ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].LCode1Name ) + "</span></td>";
 			    		str += "</tr>"
 			    	});
 				}
 				$("#usrHWList").html(str);
 			}
 		});
 	}
	
 	function getSwInfoOfEmp(empCode){
 		$.ajax({
 			type: "post",
 			url: "getSwInfoOfEmp.do",
 			data: "empCode="+empCode,
 			success: function(data){
 				var str = "";
 				if(data.length>0){
 					$.each(data, function(index) {
 	 					str += "<tr>";
 	 			 		str += "	<td hidden='hidden'>"+ data[index].swType +"</td>"; 	 
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].swTypeName +" </span> </td>";
 	 					str += "	<td hidden='hidden'>"+ data[index].swLicense +"</td>";
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].swLicenseName +" </span> </td>";
 	 					str += "</tr>";
 	 			    });
 	 			}
	 			$("#usrSWLicenseList").html(str);
 			}
 		});
 	}
 	
 	function phoneDirectoryModal(){
 		$("#phoneDirectory").modal();
 	}
 	function getIpAddress(){
 		console.log(request.getRemoteAddr());
 	}
</script>