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
    	    <h3>소프트웨어 등록</h3>
        </div>
        <div class="title_right">
        	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
            	<div class="input-group">
                	<span class="input-group-btn">
                		<span>
                			<button class="btn btn-dark" type="button" onclick="initSwm004()"><span class="fa fa-file-o">&nbsp;&nbsp;</span>신규</button>
                    		<button class="btn btn-dark" type="button" onclick="saveSwm004()"><span class="fa fa fa-save">&nbsp;&nbsp;</span>저장</button>
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
				<h2>자산정보</h2>
			</div>
				<!-- <div class=" col-xs-3 col-sm-2 col-md-1 col-lg-0 form-group pull-right"> -->
			<div class="col-md-5 form-group pull-right">
				<button class="btn btn-dark" type="button" id="swm004btn01" onclick="popModalChek()"><i class="fa fa-search"></i>&nbsp;&nbsp;자산 &nbsp;검색 </button>			
			</div> 
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<form class="form-horizontal" name="swm004Form1" id="swm004Form1">
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">식별번호</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="IdentiCode" name="IdentiCode" >
				    </div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">모델명</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="ModelName" name="ModelName" readonly="readonly">
				    </div>
				</div>
				  
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">제조년월</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="ProductDate" name="ProductDate" readonly="readonly">
				    </div>
				</div>
				
				<div class="form-group">
				    <label class="col-md-3 col-sm-3 col-xs-10 control-label">현재 위치 </label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="startLCode1Name" name="startLCode1Name" readonly="readonly"><!-- 해당 웁서이름  -->
				    	<br>
				    	<input type="text" class="form-control" id="startLCode2Name" name="startLCode2Name" readonly="readonly"><!-- 사원 이름 -->
				    </div>
				</div>
				
				<!--히든값  -->
				<div class="form-group" hidden="hidden">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">히든</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" id="rSeq" name="rSeq">
				    	<input type="text" class="form-control" id="ItemType" name="ItemType"><!--종류값  -->
					    <br>
					    <input type="text" class="form-control" id="startLCode1" name="startLCode1"><!--해당사원 부서코드  -->
					    <br>
					    <input type="text" class="form-control" id="startLCode2" name="startLCode2"><!--사원코드  -->
					    <input type="text" id="eBtnValue" name="eBtnValue">
					    <button type="reset" class="btn btn-primary" id="resetBtn01" ></button>
				    </div>
				</div>
						  
			</form> 
		</div>  
	</div>
	<div class="clearfix"></div>
	<div class="row">
		
		<div class="col-md-8 col-sm-8 col-xs-8">
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
		
		<div class="col-md-4 col-sm-4 col-xs-4">
			<div class="x_panel" >
				<div class="x_title">
					<div class="title_left">
                		<h2>SW 추가</h2>
                	</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<form class="form-horizontal form-label-left input_mask" name="swm003Form2" id="swm003Form2">
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
	                        	<input type="text" class="form-control" id="addSWQty" readonly ="readonly">
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
 		initswm004();
 		$("#swType").change(function(){
 			setSelectBox("swLicense",$("#swType").val());
 			setTimeout(function(){
 				getSWLicenseInfo($("#swType").val(), $("#swLicense").val());			
 			},100)
		});
 		
 		$("#swLicense").change(function(){
 			getSWLicenseInfo($("#swType").val(), $("#swLicense").val());
 		})
 		
 	});
 	
 	
 	function popModalChek(){
 		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		console.log(eObject.id);
 		console.log($("#eBtnValue").val());
 		
 		if(eObject.id=="swm004btn01"){
 			$("#searchProduct").modal();
 		}
 	}
 	
 	
 	function initswm004(){
 		$("#resetBtn01").click();
 		setSelectBox("swType","swLicence");
 		setSelectBox("swLicense","msOffice");
 		getSWLicenseInfo("msOffice", "2016Pro");
 		$("#addSWQty").val("1");
 		
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
 	
 	function saveswm004(){
 		var saveFlg = true;
 		/* 
 		if($("#ModelName").val()==""){
 			//alert("제품 선택을 해주시기 바랍니다.");
 			PNotifyAlert("error","제품 선택을 해주시기 바랍니다.","");
 			saveFlg = false;
 		}
 		
 		if($("#arrLCode1Name").val()==""){
 			//alert("목적지를 선택해 주시기 바랍니다.");
 			PNotifyAlert("error","목적지를 선택해 주시기 바랍니다.","");
 			saveFlg = false;
 		}
 		
 		if($("#arrDate").val() < getSysDate() ){
 			PNotifyAlert("error","이동 날짜를 확인해 주시기 바랍니다.","");
 			saveFlg = false;	
 		}
 		 */
 		if(saveFlg == false){
 			return false;
 		}
 		
 	/* 	$.ajax({
 			type : "post",
 			url : "resourceMoveHistory.do",
 			dataType : "text",
 			data : bindData(),
 			success : function(rsult){
 				if(rsult != "E"){
					alert("저장이 완료되었습니다.");
					location.href="hwm101DetailSearch.do?rSeq="+$("#rSeq").val()+"&IdentiCode="+$("#IdentiCode").val();
						
 				}else{
 					PNotifyAlert('error','저장이 실패하였습니다.','');
 				}
 			},
 			error : function(request, error){
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				alert("저장에 실패하였습니다.");
 			}
 		}); */
 		
 		
 		
 	}
 	
 	function bindData(){
 		var mainData = $("form[name=swm004Form1]").serializeArray();
 	 	var movingData = $("form[name=swm004Form2]").serializeArray();
 	 	
 	 	$.merge(mainData,movingData);
 	 	//console.log(mainData);
 	 	return mainData;
 	 	
 	}
 	
 	function searchProductInfo(){
 		$.ajax({
 			type: "post",
 			url: "searchProductInfo.do",
 			data: "searchProduct="+$("#IdentiCode").val(),
 			success: function(productInfo){
 				if(productInfo.length==0){
 					PNotifyAlert("error","검색결과가 존재하지 않습니다.","");
 				}else if(productInfo.length>1) {
 					PNotifyAlert("error","검색건수가 2건 이상입니다.<br>"
 	 									+"[제품 검색] 기능을 이용해 주세요.","");
 				}else{
 					
 					$("#ModelName").val(productInfo[0].modelName);
 					$("#ProductDate").val(productInfo[0].productDate);
 					$("#ItemType").val(productInfo[0].itemType);
 					$("#rSeq").val(productInfo[0].rSeq)
 					
 					$("#startLCode1Name").val(productInfo[0].lcode1Name);
 					$("#startLCode1").val(productInfo[0].lcode1);
 					$("#startLCode2Name").val(productInfo[0].lcode2Name);
 					$("#startLCode2").val(productInfo[0].lcode2);
 					
 					$("#IdentiCode").prop("readonly", true);
 					$("#resetBtn02").click();
 				}
 			}
 		});
 	}
 	
 	function getProductInfo(){
 		$.ajax({
 			type: "post",
 			url: "getProductInfo.do",
 			data: "rSeq=${thw10.rSeq}&IdentiCode=${thw10.identiCode}",
 			success: function(productInfo){
 				//console.log(productInfo);
 				$("#IdentiCode").val(productInfo[0].identiCode);
 				$("#ModelName").val(productInfo[0].modelName);
 				$("#ProductDate").val(productInfo[0].productDate);
 				$("#ItemType").val(productInfo[0].itemType);
 				$("#rSeq").val(productInfo[0].rSeq);
 				
 				$("#startLCode1Name").val(productInfo[0].lcode1Name);
 				$("#startLCode1").val(productInfo[0].lcode1);
 				$("#startLCode2Name").val(productInfo[0].lcode2Name);
 				$("#startLCode2").val(productInfo[0].lcode2);
 				
 				$("#IdentiCode").prop("readonly", true);
 		 	}
 		});
 	}
 	
 	/* function emptyProcess(){
 		if(confirm("퇴사 및 공석 처리를 진행하겠습니까?")){
 			var LCodeFlag = "";	
			var lastUser = "["+ getSysDate() +"] 마지막 사용자 : "+$("#startLCode1Name").val()+"_"+ $("#startLCode2Name").val();

			$("#Note").val(lastUser);
				
			$("#arrLCode1Name").val($("#startLCode1Name").val());
			$("#arrLCode1").val($("#startLCode1").val());
				
			$("#arrLCode2Name").val("");
			$("#arrLCode2").val($("#startLCode1").val());
		}
 	} */
 	
 	/* function getEmpInfo(empCode){
 		$.ajax({
 			type: "post",
 			url: "getEmpInfo.do",
 			data: "empCode="+empCode,
 			success: function(data){
 				$("#arrLCode1Name").val(data.highOrgName);
 				$("#arrLCode1").val(data.highOrgCode);
 				//$("#arrLCodeType").val(data.orgFlag);
 				if(data.orgFlag == "HQ"){
 					$("#arrLCodeType").val("com");
 				}else if(data.orgFlag == "REG"){
 					$("#arrLCodeType").val("reg");
 				}else if(data.orgFlag == "FAC"){
 					$("#arrLCodeType").val("fac");
 				}else if(data.orgFlag == "AGEN"){
 					$("#arrLCodeType").val("agen");
 				}
 			}
 		});
 	}
 */
</script>