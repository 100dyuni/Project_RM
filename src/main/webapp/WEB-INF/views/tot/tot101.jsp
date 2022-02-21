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
    	    <h3>사용자 분배 현황</h3>
        </div>
        <div class="title_right">
			<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		    	<div class="input-group ">
		        	<span class="input-group-btn">
		            	<span>
		            		<!-- <button class="btn btn-dark" type="button" onclick="tot101Init()"><i class="fa fa-save">&nbsp;&nbsp;초기화</i></button> -->
		            		<button class="btn btn-dark" type="button" onclick="tot101Resignation()"><i class="fa fa-save">&nbsp;&nbsp;퇴사 처리</i></button>
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
				<h2>사용자 정보</h2>
			</div>
			
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<form class="form-horizontal" name="tot101Form1" id="tot101Form1">
				<div class="form-group">
					<label class="col-md-1 col-sm-1 col-xs-3 control-label">구분</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				        <div class="input-group">
	                       	<select class="select2_single form-control" tabindex="-1" required="required" id="LCodeType" name="LCodeType" >
					      	</select>
					      	<span class="input-group-btn">
	                           	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="tot101btn01" name="tot101btn01">검색</button>
	                        </span>
	                    </div>
				    </div>
				    
				    <label class="col-md-1 col-sm-1 col-xs-3 control-label">부서명</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="divisionName" name="divisionName" readonly="readonly">
				    	<input type="hidden" class="form-control" id="divisionCode" name="divisionCode" readonly="readonly">
				    	<input type="hidden" class="form-control" id="teamName" name="teamName" readonly="readonly">
				    	<input type="hidden" class="form-control" id="teamCode" name="teamCode" readonly="readonly">
				    
				    </div>
				    
				    <label class="col-md-1 col-sm-1 col-xs-3 control-label">이름</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="empName" name="empName" readonly="readonly">
				    	<input type="hidden" class="form-control" id="empCode" name="empCode" readonly="readonly">
				    </div>
				    
				</div>
				
				<!--히든값  -->
				<div class="form-group" hidden="hidden"><!--hidden="hidden"  -->
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">히든값</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" id="eBtnValue" name="eBtnValue">
				    </div>
				</div>		
				  
			</form> 
		</div>  
	</div>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-md-6 col-sm-6 col-xs-12">
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
							        <th class="column-title" width="160px">현위치</th>
							        <th class="column-title" width="60px" hidden="hidden">lCodeType</th>
							        <th class="column-title" width="60px" hidden="hidden">LCode1</th>
							        <th class="column-title" width="60px" hidden="hidden">ItemTypeCode</th>
							        <th class="column-title" width="60px" hidden="hidden">ManufacCode</th>
							    </tr>
	                        </thead>
						    <tbody id="usrHWList">
						    </tbody>
	                    </table>
					</div>
					
					
					
				</div>
				
			</div>
		</div>
	
		<div class="col-md-4 col-sm-4 col-xs-8">
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
						<table class="table table-striped jambo_table" style="table-layout: fixed" id="SWListTable" name="SWListTable" >
	                    	<thead>
				            	<tr class="headings" >
				            		<th class="column-title" width="80px">SW종류</th>
							        <th class="column-title" width="100px">License</th>
							        <th class="column-title" width="60px">수량</th>
							    </tr>
	                        </thead>
						    <tbody id="usrSWLicenseList">
						    </tbody>
	                    </table>
					</div>
					
                    
				</div>
				
			</div>
		</div>
		
		<div class="col-md-2 col-sm-2 col-xs-4">
			<div class="x_panel"  >
				<div class="x_title">
					<div class="title_left">
                		<h2>메모</h2>
                	</div>
                	<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
				<div class="x_content">
					<div class="form-group">
						<label class="col-md-12 col-sm-12 col-xs-12">HW메모</label>
					</div>
                    <div class="form-group">
	                	<div class="col-md-12 col-sm-12 col-xs-12 input-group">
	                        <textarea class="form-control" id="HWNote" name="HWNote" rows="3" style=" resize: none;" ></textarea>
						</div>
                    </div>
                    <div class="form-group">
						<label class="col-md-12 col-sm-12 col-xs-12">SW메모</label>
					</div>
					<div class="form-group">
	                	<div class="col-md-12 col-sm-12 col-xs-12 input-group">
	                        <textarea class="form-control" id="SWNote" name="SWNote" rows="3" style=" resize: none;" ></textarea>
						</div>
                    </div>
					
				</div>
				
			</div>
		</div>
		
		
	</div>
	
</div>



<script type="text/javascript">

 	$(document).ready(function(){
 		
 		setSelectBox("LCodeType","orgFlag");
 		
 		$("#searchEMP").on("hide.bs.modal", function (e) {
 			if($("#empCode").val()!=""){
 				getEmpInfo($("#empCode").val());
 				getHwInfoOfEmp($("#empCode").val());
 				getSwInfoOfEmp($("#empCode").val());	
 			}
			
		}); 
 		
 		$("#searchTarget").on("hide.bs.modal", function (e) {
 			if($("#empCode").val()!=""){
 				//getEmpInfo($("#empCode").val());
 				getHwInfoOfEmp($("#empCode").val());
 				getSwInfoOfEmp($("#empCode").val());	
 			}
			
		}); 
 		
 		
 	});
 	
  	
 	
 	
 	function getSWLicenseInfo(swType,swLicense){
 		$.ajax({
 			type: "post",
 			url: "getSWLicenseInfo.do",
 			data: "swType="+swType+"&swLicense="+swLicense,
 			success: function(data){
 				if(data !=""){
 					$("#swActiveCnt").html(data.actCout);
 					$("#swTotCnt").html(data.totQty);
 	 				$("#hiddenSSeq").val(data.sSeq);
 				}else{
 					$("#swActiveCnt").html(0);
 					$("#swTotCnt").html(0);
 	 				$("#hiddenSSeq").val("");
 				}
 				
 			}
 		});
 	}
 	
 	function popModalChek(){
 		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		if(eObject.id=="tot101btn01"){
 			if(($("#LCodeType").val()=="HQ") || ($("#LCodeType").val()=="REG") || ($("#LCodeType").val()=="FAC") ){
 				$("#searchEMP").modal();
 			}else if($("#LCodeType").val()=="AGEN"){
 				$("#searchTarget").modal();
 			}
 			
 			
 			
 		}
 		
 		
 	}
 	
 	function getEmpInfo(empCode){
 		$.ajax({
 			type: "post",
 			url: "getEmpInfo.do",
 			data: "empCode="+empCode,
 			success: function(data){
 				$("#divisionName").val(data.highOrgName);
 				$("#divisionCode").val(data.highOrgCode);
 				$("#teamName").val(data.lowOrgName);
 				$("#teamCode").val(data.lowOrgCode);
 				$("#LCodeType").val(data.orgFlag);
 				
 				
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
 				var getNote = "";
 				if(data.length==0){
 					PNotifyAlert("error","검색결과가 존재하지 않습니다.","");
 				}else{
 					$.each(data, function(index) {
 						str += "<tr style='height: 51px'>";
 						str += "	<td hidden='true'>" + ( data[index].rSeq) + "</td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].ItemType) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].Manufac ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].ModelName ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].productDate ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].IdentiCode ) + "</span></td>";
 			    		str += "	<td> <span style='font-size: 20'> " + ( data[index].LCode1Name ) + "</span></td>";
 			    		str += "	<td hidden='true'>" + ( data[index].LCodeType ) + "</span></td>";
 			    		str += "	<td hidden='true'>" + ( data[index].LCode1 ) + "</span></td>";
 			    		str += "	<td hidden='true'>" + ( data[index].ItemTypeCode ) + "</span></td>";
 			    		str += "	<td hidden='true'>" + ( data[index].ManufacCode ) + "</span></td>";
 			    		str += "</tr>"
 			    		//getNote += data[index].Note +"\n"
 			    		if((data[index].Note !="")){
 			    			getNote += data[index].IdentiCode + " : " + data[index].Note  +"\n";	
 			    		}
 			    	});
 				}
 				$("#HWNote").val(getNote);
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
 				var getNote = "";
 				if(data.length>0){
 					$.each(data, function(index) {
 	 					str += "<tr>";
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].swTypeName +" </span> </td>";
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].swLicenseName +" </span> </td>";
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].qty +" </span> </td>";
 	 					str += "</tr>";
 	 			    });
 	 				getNote = data[0].Note;
 	 			}
	 			
 				$("#SWNote").val(getNote);
 				$("#usrSWLicenseList").html(str);
 			}
 		});
 	}
 	
 	function tot101Resignation(){
 		if($("#empCode").val() ==""){
 			PNotifyAlert("error","선택된 사용자가 존재하지 않습니다.","");
 			return ;
 		}
 		
 		if(confirm("해당사용자의 퇴사처리를 진행하시겠습니까?\nHW공석처리, SW사용안함.")){
 			retiredHwProcess();
 			retiredSwProcess();
 			
 			setTimeout(function(){
 				tot101Init();
 			},100)
 		}
 		
 		
 	}
 	
 	function retiredHwProcess(){
 		var tr = $("#usrHWList tr");
 		var resultFlg = "S";
 		
 		if($(tr).length > 0 ){
 			for(i=0; i<$(tr).length;i++){
 				
 				//var lastUser = getSysDate() + " 마지막 사용자 : ["+ $("#divisionName").val() + "]" +$("#empName").val();
 				var lastUser = "["+ getSysDate() +"] 마지막 사용자 : "+$("#divisionName").val()+"_"+ $("#empName").val();

 				var LCodeFlag = "";
 				var LCodeValue = $(tr[i]).children().eq(7).text().trim();
 				
 				if(LCodeValue=="com"){
 					LCodeFlag = "empty";
 				}else if(LCodeValue=="fac"){
 					LCodeFlag = "fEmpty";
 				}else if(LCodeValue=="reg"){
 					LCodeFlag = "rEmpty";
 				}else{
 					LCodeFlag =LCodeValue;
 				}
 				
 				$.ajax({
 		 			type : "post",
 		 			url : "resourceMoveHistory.do",
 		 			dataType : "text",
 		 			data : {
 		 				rSeq : $(tr[i]).children().eq(0).text().trim(),
 		 				IdentiCode : $(tr[i]).children().eq(5).text().trim(),
 		 				ModelName : $(tr[i]).children().eq(3).text().trim(),
 		 				ProductDate :  $(tr[i]).children().eq(4).text().trim(),
 		 				startLCode1 : $(tr[i]).children().eq(8).text().trim(),
 		 				startLCode1Name : $(tr[i]).children().eq(6).text().trim(),
 		 				startLCode2 : $("#empCode").val(),
 		 				startLCode2Name : $("#empName").val(),
 		 				ItemType : $(tr[i]).children().eq(9).text().trim(),
 		 				arrLCodeType : LCodeFlag,
 		 				arrLCode1 : $(tr[i]).children().eq(8).text().trim(),
 		 				arrLCode1Name : $(tr[i]).children().eq(6).text().trim(),
 		 				arrLCode2 : $(tr[i]).children().eq(8).text().trim(),
 		 				arrLCode2Name : "",
 		 				arrDate : getSysDate(),
 		 				Note : lastUser
 		 			},
 		 			success : function(rsult){
 		 				if(rsult != "E"){
 		 					resultFlg = "S";
 		 				}else{
 		 					resultFlg = "E";
 		 				}
 		 			},
 		 			error : function(request, error){
 		 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		 				alert("저장에 실패하였습니다.");
 		 			}
 		 		});
 				
 			}
 			
 			if(resultFlg=="S"){
 				PNotifyAlert('info','HW 공석처리가 완료되었습니다.','');
 			}else{
 				PNotifyAlert('error','HW 공석처리가 실패하였습니다.','');
 			}
 		}
 		
 	}
 	
 	function retiredSwProcess(){
 		var empCodeList =[];
 		empCodeList.push($("#empCode").val());
 		
 		$.ajax({
			type : "post",
			url : "retiredEmpSwUpdate.do",
			data : {"empCodeList" : empCodeList},
			traditional : true,
			async : true,
			success : function(data){
				if(data != "E"){
					PNotifyAlert('info','SW 내역저장이 완료되었습니다.','');
				}else{
					PNotifyAlert('error','SW 내역저장에 실패하였습니다.','');
				}
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
				alert("저장에 실패하였습니다.");
			}
		})
 	}

 	function tot101Init(){
 		$("#LCodeType").val("HQ");
 		$("#empName").val("");
 		$("#empCode").val("");
 		$("#divisionName").val("");
 		$("#divisionCode").val("");
 		$("#teamName").val("");
 		$("#teamCode").val("");
 		$("#usrHWList").html("");
 		$("#usrSWLicenseList").html("");
 		$("#SWNote").val("");
 		$("#HWNote").val("");
 	}
 	
</script>