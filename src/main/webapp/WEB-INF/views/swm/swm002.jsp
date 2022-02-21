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
    	    <h3>S/W 라이센스 분배</h3>
        </div>
        <div class="title_right">
        	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
            	<div class="input-group">
                	<span class="input-group-btn">
                		<span>
                			<button class="btn btn-dark" type="button" onclick="initSwm002()"><span class="fa fa-file-o">&nbsp;&nbsp;</span>신규</button>
                    		<button class="btn btn-dark" type="button" onclick="saveSwm002()"><span class="fa fa fa-save">&nbsp;&nbsp;</span>저장</button>
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
			<!-- <div class="col-md-2 form-group pull-right">
				<button class="btn btn-dark" type="button" id="swm002btn01" onclick="popModalChek()"><i class="fa fa-search"></i>&nbsp;&nbsp;사원 &nbsp;검색 </button>			
			</div>  -->
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<form class="form-horizontal" name="swm002Form1" id="swm002Form1">
				<div class="form-group">
					<label class="col-md-1 col-sm-1 col-xs-3 control-label">구분</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				        <div class="input-group">
	                       	<select class="select2_single form-control" tabindex="-1" required="required" id="LCodeType" name="LCodeType" >
					      	</select>
					      	<span class="input-group-btn">
	                           	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="swm002btn01" name="swm002btn01">검색</button>
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
				    	<input type="hidden" class="form-control"id="swRegSeq" name="swRegSeq">
				    </div>
				    
				</div>
				
				<div class="form-group">
					<label class="col-md-1 col-sm-1 col-xs-3 control-label">메모</label>
				    <div class="col-md-8 col-sm-8 col-xs-9">
				    	<input type="text" class="form-control" id="Note" name="Note">
				    </div>
				</div>
				<!-- <div class="form-group">
					<label class="col-md-1 col-sm-1 col-xs-3 control-label">사번</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="hidden" id="swRegSeq" name="swRegSeq">
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
				    	<input type="hidden" class="form-control" id="divisionCode" name="divisionCode" readonly="readonly">
				    </div>
				    <label class="col-md-1 col-sm-1 col-xs-3 control-label">팀명</label>
				    <div class="col-md-2 col-sm-2 col-xs-8">
				    	<input type="text" class="form-control" id="teamName" name="teamName" readonly="readonly">
				    	<input type="hidden" class="form-control" id="teamCode" name="teamCode" readonly="readonly">
				    </div>
				    <label class="col-md-1 col-sm-1 col-xs-3 control-label">메모</label>
				    <div class="col-md-4 col-sm-4 col-xs-8">
				    	<input type="text" class="form-control" id="Note" name="Note">
				    </div>
				</div> -->
				
				
				
				
				
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
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="x_panel" >
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
				            		<th class="column-title" width="60px" hidden="hidden">SW종류C</th>
							        <th class="column-title" width="100px">SW종류</th>
							        <th class="column-title" width="100px" hidden="hidden">LicenseC</th>
							        <th class="column-title" width="100px">License</th>
							        <th class="column-title" width="60px">수량</th>
							        <th class="column-title" width="60px"></th>
							        <th class="column-title" width="60px" hidden="hidden">sSeq</th>
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
			<div class="x_panel" >
				<div class="x_title">
					<div class="title_left">
                		<h2>SW 추가</h2>
                	</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<form class="form-horizontal form-label-left input_mask" name="swm002Form2" id="swm002Form2">
						<div class="form-group">
							<label class="col-md-12 col-sm-12 col-xs-12">S/W 종류</label>
						</div>
						<div class="form-group">
							<select class="select2_single form-control" tabindex="-1" required="required" id="swType" name="swType">
							</select>
						</div>
						<div class="form-group">
							<label class="col-md-12 col-sm-12 col-xs-12">S/W License</label>
						</div>
						<div class="form-group">
							<select class="select2_single form-control" tabindex="-1" required="required" id="swLicense" name="swLicense">
							</select>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label class="col-md-12 col-sm-12 col-xs-12">S/W 사용 수량</label>
						</div>
						<div class="form-group pull-right">
							<h2><span id="swActiveCnt"></span></h2>
						</div>
						
						<div class="form-group">
							<label class="col-md-12 col-sm-12 col-xs-12">S/W 구매 수량</label>
						</div>
						<div class="form-group pull-right">
							<h2><span id="swTotCnt"></span></h2>
						</div>
						
						
						<br>
						<div class="clearfix"></div>
						<div class="form-group">
							<input type="hidden" id="hiddenSSeq">
						</div>
						<div class="ln_solid"></div>
						<div class="form-group">
							<label class="col-md-12 col-sm-12 col-xs-12">SW 분배</label>
						</div>
                     	<div class="form-group">
	                        <div class="col-md-12 col-sm-12 col-xs-12 input-group">
	                        	<input type="text" class="form-control" id="addSWQty">
								<span class="input-group-btn">
								    <button class="btn btn-dark" type="button" onclick="addSWList()"><i class="fa fa-plus"></i></button>
								</span>
	                        </div>
                      	</div>
                      	
					</form>
					
				</div>
			</div>
		</div>
		
	</div>
	
</div>



<script type="text/javascript">

 	$(document).ready(function(){
 		
 		initSwm002();
 		
 		$("#swType").change(function(){
 			setSelectBox("swLicense",$("#swType").val());
 			setTimeout(function(){
 				getSWLicenseInfo($("#swType").val(), $("#swLicense").val());			
 			},100)
		});
 		
 		$("#swLicense").change(function(){
 			getSWLicenseInfo($("#swType").val(), $("#swLicense").val());
 		})
 		
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
 	
 	function initSwm002(){
 		setSelectBox("swType","swLicence");
 		setSelectBox("swLicense","msOffice");
 		setSelectBox("LCodeType","orgFlag");
 		
 		getSWLicenseInfo("msOffice", "2016Pro");
 		
 		$("#divisionName").val("");
 		$("#divisionCode").val("");
 		$("#teamName").val("");
 		$("#teamCode").val("");
 		$("#empName").val("");
 		$("#empCode").val("");
 		$("#swRegSeq").val("");
 		$("#Note").val("");
 		$("#addSWQty").val("1");
 	}
  	
 	function saveSwm002(){
 		var saveFlg = true;
 		
 		if($("#empCode").val()==""){
  			PNotifyAlert("error","해당 사원을 선택해 주시기 바랍니다.","");
  			saveFlg = false;
  		}
 		
 		if($("#usrSWLicenseList tr").length ==0){
 			PNotifyAlert("error","SW List를 작성해 주시기 바랍니다.","");
 			saveFlg = false;
 		}
 		
 		if(saveFlg == false){
 			return false;
 		} 
 		
 		$.ajax({
 			type : "post",
 			url : "usrSWHeadInfoSave.do",
 			dataType : "text",
 			data : bindHeadData(),
 			async : true,
 			success : function(rsult){
 				if(rsult != "E"){
					$("#swRegSeq").val(rsult);
					
					var jsonData = JSON.stringify(bindDetailData());
			 		jQuery.ajaxSettings.traditional = true;
			 		
			 		$.ajax({
			 			type : "post",
			 			url : "usrSWDetailInfoSave.do",
			 			data : {"jsonData" : jsonData},
			 			dataType : "text",
			 			async : true,
			 			success : function(rsult){
			 				if(rsult != "E"){
								PNotifyAlert('info','저장이 완료되었습니다.','');
								
								getSWLicenseInfo($("#swType").val(),$("#swLicense").val());
								$("#addSWQty").val("1");
								
							}else{
			 					PNotifyAlert('error','저장이 실패하였습니다.','');
			 				}
			 			},
			 			error : function(request, error){
			 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 				alert("저장에 실패하였습니다.");
			 			}
			 			
			 		})
					
				}else{
 					PNotifyAlert('error','저장이 실패하였습니다.','');
 				}
 			},
 			error : function(request, error){
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				alert("저장에 실패하였습니다.");
 			}
 		});
 		/* 
 		var jsonData = JSON.stringify(bindData());
 		jQuery.ajaxSettings.traditional = true;
 		
 		$.ajax({
 			type : "post",
 			url : "usrSWListRegister1.do",
 			data : {"jsonData" : jsonData},
 			dataType : "text",
 			async : true,
 			success : function(rsult){
 				if(rsult != "E"){
					PNotifyAlert('info','저장이 완료되었습니다.','');
				}else{
 					PNotifyAlert('error','저장이 실패하였습니다.','');
 				}
 			},
 			error : function(request, error){
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				alert("저장에 실패하였습니다.");
 			}
 			
 		}) */
 		
 	}
 	
 	
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
 	
 	function addSWList(){
 		var selectSWType = $("#swType").val();
 		var selectSWTypeName = $("#swType option:selected").text();
 		
 		var selectSWLicense = $("#swLicense").val();
 		var selectSWLicenseName = $("#swLicense option:selected").text();
		
 		if($("#swTotCnt").html() =="0"){
 			PNotifyAlert("error","SW 구매수량을 확인해 주세요.","");
 			return false;
		}
 		
 		if(!checkSWLicenseFlg(selectSWTypeName,selectSWLicenseName)){
 			PNotifyAlert("error","이미 등록된 SW입니다.","");
 			return false;
 		}
 		
 		var SWTableHtml = "";
 		SWTableHtml = $("#usrSWLicenseList").html();
 		
 		var str = "";
 		
 		str += "<tr>";
 		str += "	<td hidden='hidden'>"+ selectSWType +"</td>"; 	 
		str += "	<td> <span style='font-size: 20'> "+ selectSWTypeName +" </span> </td>";
		str += "	<td hidden='hidden'>"+ selectSWLicense +"</td>";
		str += "	<td> <span style='font-size: 20'> "+ selectSWLicenseName +" </span> </td>";
		str += "	<td> <span style='font-size: 20'> "+ $("#addSWQty").val() +" </span> </td>";
		str += "	<td>"	
		str += "		<button class='btn btn-dark' onclick='delUsrSwList(this)' style='margin-bottom: 0px; margin-right: 0px;'>삭제</button>";
		str += "	</td>"
		str += "	<td hidden='hidden'>"+$("#hiddenSSeq").val()+"</td>"
		str += "</tr>";
		
		SWTableHtml += str;
		
		$("#usrSWLicenseList").html(SWTableHtml);
		$("#addSWQty").val("1");
 		
 	}
 	 	 	
 	function checkSWLicenseFlg(SWType,SWLicense){
 		var rows = $("#usrSWLicenseList tr");
		var checkFlg = true;
		for(i=0; i<$(rows).length;i++){
			var tSWType	   = $(rows[i]).children().eq(1).text();
			var tSWLicense = $(rows[i]).children().eq(3).text();
			
			if((SWType.trim() == tSWType.trim()) && (SWLicense.trim() == tSWLicense.trim()) ){//&& (useYn =='Y')
				checkFlg=false;
			}
			
		}
		return checkFlg;
	}
 	
 	function popModalChek(){
 		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		if(eObject.id=="swm002btn01"){
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
 				var getNote = "";
 				var getSwRegSeq ="";
 				if(data.length>0){
 					$.each(data, function(index) {
 	 					str += "<tr>";
 	 			 		str += "	<td hidden='hidden'>"+ data[index].swType +"</td>"; 	 
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].swTypeName +" </span> </td>";
 	 					str += "	<td hidden='hidden'>"+ data[index].swLicense +"</td>";
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].swLicenseName +" </span> </td>";
 	 					str += "	<td> <span style='font-size: 20'> "+ data[index].qty +" </span> </td>";
 	 					str += "	<td>"	
 	 					str += "		<button class='btn btn-dark' onclick='delUsrSwList(this)' style='margin-bottom: 0px; margin-right: 0px;'>삭제</button>";
 	 					str += "	</td>"
 	 					str += "	<td hidden='hidden'>"+data[index].sSeq+"</td>"
 	 					str += "</tr>";
 	 			    });
 	 				getNote = data[0].Note;
 	 				getSwRegSeq= data[0].swRegSeq;
 				}
	 			
 				$("#Note").val(getNote);
 				$("#swRegSeq").val(getSwRegSeq);
 				$("#usrSWLicenseList").html(str);
 			}
 		});
 	}
 	
 	function bindHeadData(){
 		var formData = $("form[name=swm002Form1]").serializeArray();
 		console.log(formData);
 		return formData;
 	}
 	
 	function bindDetailData(){
 		var rows = $("#usrSWLicenseList tr");
 		var reqSWList = [];
 		for(i=0; i<$(rows).length;i++){
 			var data = {
 				swRegSeq   : $("#swRegSeq").val(),
				SwListsSeq : $(rows[i]).children().eq(6).text().trim(),
				SwQty 	   : $(rows[i]).children().eq(4).text().trim(),
				swType	   : $(rows[i]).children().eq(0).text().trim(),
				swLicense  : $(rows[i]).children().eq(2).text().trim()
			};
			reqSWList.push(data);
		}
 		
 		return reqSWList;
 	}
 	
 	function delUsrSwList(obj){
 		var tr = $(obj).parent().parent();
 		tr.remove();
 	}

</script>