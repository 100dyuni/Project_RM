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
    	    <h3>이동내역 등록</h3>
        </div>
        <div class="title_right">
        	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
            	<div class="input-group">
                	<span class="input-group-btn">
                		<span>
                			<button class="btn btn-dark" type="button" onclick="initHwm002()"><span class="fa fa-file-o">&nbsp;&nbsp;</span>신규</button>
                    		<button class="btn btn-dark" type="button" onclick="saveHwm002()"><span class="fa fa fa-save">&nbsp;&nbsp;</span>저장</button>
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
				<button class="btn btn-dark" type="button" id="hwm002btn01" onclick="popModalChek()"><i class="fa fa-search"></i>&nbsp;&nbsp;자산 &nbsp;검색 </button>			
			</div> 
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<form class="form-horizontal" name="hwm002Form1" id="hwm002Form1">
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
					    <button type="reset" class="btn btn-primary" id="resetBtn01" ></button>
				    </div>
				</div>
						  
			</form> 
		</div>  
	</div>
	<div class="clearfix"></div>
	<div class="x_panel">			
		<div class = "x_title">
			<div class="title_left">
				<h2>이동내역</h2>
			</div>
			<div class="col-md-5 form-group pull-right">
				<button type="button" class="btn btn-dark" onclick="popModalChek()" id="hwm002btn02"><i class="fa fa-search"></i>&nbsp;&nbsp;목적지 검색</button>			
			</div> 
			<div class="clearfix"></div>
			
		</div>
		<div class = "x_content">
			<form class="form-horizontal form-label-left input_mask" name="hwm002Form2" id="hwm002Form2">
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">이동 위치 </label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<select class="select2_single form-control" tabindex="-1" required="required" id="arrLCodeType" name="arrLCodeType">
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label"> </label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<input type="text" class="form-control" id="arrLCode1Name" name="arrLCode1Name" readonly="readonly"><!--부서명  -->
					</div>
				</div>
					
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label"> </label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<input type="text" class="form-control" id="arrLCode2Name" name="arrLCode2Name" readonly="readonly"><!--이름  -->
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">이동 날짜</label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="input-group date" id="arrDatePicker">
					  		<input type='text' class="form-control" id="arrDate" name="arrDate"/>
			                <span class="input-group-addon">
			                	<span class="glyphicon glyphicon-calendar"></span>
			                </span>
					  	</div>
					 </div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">메 모</label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<textarea rows="4" class="form-control" id="Note" name="Note"></textarea>
				 	</div>
				</div>
				
				<!--히든값  -->
				<div class="form-group" hidden="hidden">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">히든값</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="arrLCode1" name="arrLCode1"><!--부서코드  -->
				    	<br>
				    	<input type="text" class="form-control" id="arrLCode2" name="arrLCode2"><!--사번  -->
				    	<br>
				    	<input type="text" id="eBtnValue" name="eBtnValue">
				    </div>
				    <button type="reset" class="btn btn-primary" id="resetBtn02" ></button>
				</div>
				
				
			</form>
		</div>
	</div>
</div>



<script type="text/javascript">

 	$(document).ready(function(){
 		
 		$("#arrDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"  
 		});
 		
 		
 		$("#arrDate").keyup(function(event){
 			if((event.keyCode == 13)&&($("#arrDate").val().length == 8)){
 				this.blur();
 			}
 		})
 		
 		$("#IdentiCode").keyup(function(event){
 			if((event.keyCode == 13)){
 				searchProductInfo();
 			}
 		})
 		
 		$("#arrLCodeType").change(function(){
 			$("#Note").val("");
 		});
 		
 		$("#arrDate").val(getSysDate());
 		
 		setSelectBox("arrLCodeType","lCode");

 		if(("${thw10.identiCode}" !="")&&("${thw10.rSeq}"!="")){
 			getProductInfo();
 		}
 		
 		$("#searchEMP").on("hide.bs.modal", function (e) {
 			if($("#arrLCode2").val()!=""){
 				getEmpInfo($("#arrLCode2").val());
 			}
			
		}); 
 		
 	});
 	
 	
 	function popModalChek(){
 		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		
 		if(eObject.id=="hwm002btn01"){
 			$("#searchProduct").modal();
 		}else if (eObject.id =="hwm002btn02"){
 			
 			if(($("#arrLCodeType").val()=="com")||($("#arrLCodeType").val()=="fac")||($("#arrLCodeType").val()=="reg")){
 				$("#searchEMP").modal();
 	 		}else if($("#arrLCodeType").val()=="agen"){
 	 			$("#searchTarget").modal();
 	 		}else if($("#arrLCodeType").val()=="etc"){
 	 			$("#searchEtc").modal();
 	 		}else if($("#arrLCodeType").val()=="fetc"){
 	 			$("#searchEtc").modal();
 	 		}else if($("#arrLCodeType").val()=="empty"){
 	 			emptyProcess();
 	 		}else if($("#arrLCodeType").val()=="fEmpty"){
 	 			emptyProcess();
 	 		}else if($("#arrLCodeType").val()=="rEmpty"){
 	 			emptyProcess();
 	 		}else if(($("#arrLCodeType").val()=="div")||($("#arrLCodeType").val()=="fDiv")){
 	 			$("#orgListModal").modal();
 	 		}
 			
 		}
 	}
 	
 	
 	function initHwm002(){
 		$("#resetBtn01").click();
		$("#resetBtn02").click();
		$("#IdentiCode").prop("readonly", false);
		$("#arrDate").val(getSysDate());
 	}
 	
 	function saveHwm002(){
 		var saveFlg = true;
 		
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
 		
 		if(saveFlg == false){
 			return false;
 		}
 		
 		$.ajax({
 			type : "post",
 			url : "resourceMoveHistory.do",
 			dataType : "text",
 			data : bindData(),
 			success : function(rsult){
 				if(rsult != "E"){
					alert("저장이 완료되었습니다.");
					//PNotifyAlert('info','저장이 완료되었습니다.','');
					//initHwm002();
					location.href="hwm101DetailSearch.do?rSeq="+$("#rSeq").val()+"&IdentiCode="+$("#IdentiCode").val();
						
 				}else{
 					PNotifyAlert('error','저장이 실패하였습니다.','');
 				}
 			},
 			error : function(request, error){
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				alert("저장에 실패하였습니다.");
 			}
 		});
 		
 		
 		
 	}
 	
 	function bindData(){
 		var mainData = $("form[name=hwm002Form1]").serializeArray();
 	 	var movingData = $("form[name=hwm002Form2]").serializeArray();
 	 	
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
 					//alert("검색결과가 존재하지 않습니다.");
 					PNotifyAlert("error","검색결과가 존재하지 않습니다.","");
 				}else if(productInfo.length>1) {
 					PNotifyAlert("error","검색건수가 2건 이상입니다.<br>"
 	 									+"[제품 검색] 기능을 이용해 주세요.","");
 					/* alert("검색건수가 2건 이상입니다.<br>"
 						+"[제품 검색] 기능을 이용해 주세요."); */
 				}else{
 					//console.log(searchProduct);
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
 	
 	function emptyProcess(){
 		if(confirm("퇴사 및 공석 처리를 진행하겠습니까?")){
 			var LCodeFlag = "";	
			//var lastUser = getSysDate() + " 마지막 사용자 : ["+$("#startLCode1Name").val()+ "]" + $("#startLCode2Name").val();
			var lastUser = "["+ getSysDate() +"] 마지막 사용자 : "+$("#startLCode1Name").val()+"_"+ $("#startLCode2Name").val();

			$("#Note").val(lastUser);
				
			$("#arrLCode1Name").val($("#startLCode1Name").val());
			$("#arrLCode1").val($("#startLCode1").val());
				
			$("#arrLCode2Name").val("");
			$("#arrLCode2").val($("#startLCode1").val());
				
		/* 	if($("#arrLCodeType").val()=="com"){
				LCodeFlag = "empty";
			}else if($("#arrLCodeType").val()=="fac"){
				LCodeFlag = "fEmpty";
			}else if($("#arrLCodeType").val()=="reg"){
				LCodeFlag = "rEmpty";
			}else{
				LCodeFlag = $("#arrLCodeType").val();
			}
				
			$("#arrLCodeType").val(LCodeFlag); */
		}
 	}
 	
 	function getEmpInfo(empCode){
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

</script>