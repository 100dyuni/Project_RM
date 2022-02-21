<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/jquery.min.js"></script>

<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>
<!-- bootstrap-daterangepicker -->
<link href="css/daterangepicker.css" rel="stylesheet">
<!-- bootstrap-datetimepicker -->
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
<script src="js/bootstrap-datetimepicker.min.js"></script>
<!-- imagePreView -->
<link href="css/imgPreview.css" rel="stylesheet">   
<script src="js/imgPreview.js"></script>   

<!-- PNotify -->
<script src="js/pnotify.js"></script>
<link href="css/pnotify.css" rel="stylesheet">
<link href="css/pnotify.buttons.css" rel="stylesheet">
<script src="js/pnotify.buttons.js"></script>
<link href="css/pnotify.nonblock.css" rel="stylesheet">
<script src="js/pnotify.nonblock.js"></script>


<div class="page-title">
	<div class="title_left">
    	<h3><span id="hwm001Title"></span></h3>
    </div>
    <div class="title_right">
    	<div class="col-xs-13 col-sm-7 col-md-5 col-lg-4 form-group pull-right">
    	<!-- <div class="col-xs-13 col-sm-8 col-md-7 col-lg-5 form-group pull-right"> -->
        	<div class="input-group">
            	<span class="input-group-btn" >
            		<span>
	            		<button class="btn btn-dark" type="button" id="btnNew"><span class="fa fa-file-o">&nbsp;&nbsp;</span>신규</button>
		                <button class="btn btn-dark" type="button" id="btnSave"><span class="fa fa fa-save">&nbsp;&nbsp;</span>저장</button>
            		</span>
            		<span id="hwm001ButtonPage02">
            		    <button class="btn btn-dark" type="button" id="btnMove"><span class="fa fa-exchange">&nbsp;&nbsp;</span>이동</button>
	                    <button class="btn btn-dark" type="button" id="btnEmpty"><span class="fa fa-inbox">&nbsp;&nbsp;</span>공석</button>
            		</span>
            		
                	
                </span>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<div class="col-md-6 col-xs-12 row">
	<div class="x_panel">
		<div class = "x_title">
	    	<h2>기본정보<small>구분 / 식별번호 / 모델명 / 라벨</small></h2>
	    	<ul class="nav navbar-right panel_toolbox"></ul>

			<div class="clearfix"></div>
	    </div>
		<div class = "x_content">
	    	<form id="hwm001Basic" name="hwm001Basic" class="form-horizontal" enctype="multipart/form-data" method="post">
		    	<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">구분</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<select class="select2_single form-control" tabindex="-1" required="required" id="ItemType" name="ItemType">	
				      	</select>
				    </div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">식별번호</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="hidden" class="form-control" id="rSeq" name="rSeq"><!--시컨스 나중에 히든처리  -->
				    	<input type="text" class="form-control" id="IdentiCode" name="IdentiCode">
				    </div>
				</div>
				<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">제조사</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<select class="select2_single form-control" tabindex="-1" id="Manufac" name="Manufac">							
							</select>
						</div>
				</div> 
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">모델명</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="ModelName" name ="ModelName">
				    </div>
				</div>
				  
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">제조년월</label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="input-group date" id="PDatePicker">
					  		<input type='text' class="form-control" id="productDate" name="productDate" data-inputmask="'mask' : '9999.99.99'" />
			                <span class="input-group-addon">
			                	<span class="glyphicon glyphicon-calendar"></span>
			                </span>
					  	</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">상태</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<select class="select2_single form-control" tabindex="-1" id="ItemStatus" name ="ItemStatus">
				      		<!-- <option value="01">정상</option>
				      		<option value="02">불량</option>
				      		<option value="03">폐기대상</option>
				      		<option value="04" hidden="hidden">폐기완료</option> -->
				      	</select>
				    </div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">이미지 업로드</label>
		     		<div class="col-md-5 col-sm-5 col-xs-12">
		     			<div class="input-group" id="imgUpload" >
							<input type='text' class="form-control" id="fileName" name="fileName" readonly="readonly" onclick="imgUpClcik()"/>
					       	<span class="input-group-addon">
					           	<label class="glyphicon glyphicon-camera">
									<input id="uploadFile" name ="uploadFile" type="file"style="width: 0px;height: 0px;overflow: hidden;">
								</label>
					        </span>
						</div>
						<div class="pull-right">
							<button type="button" class="btn btn-primary" id="preViewModal" onclick="checkImgMoal()">이미지 확인</button>
							<input type="hidden" id ="ImgUUID" >
						</div>
						<!-- <div>
							<div class="imagePreview" id="imagePre"></div>
						</div> -->
			     	</div>
				</div>
				<div hidden="true">
					<button type="reset" class="btn btn-primary" id="resetBtn01" ></button>
				</div>
			</form> 
		</div>  
	</div>
	<div class="clearfix"></div>
	<div class="x_panel">			
		<div class = "x_title">
	    	<h2>위치</h2>
	    	<ul class="nav navbar-right panel_toolbox">
	    		<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	            </li>
	    	</ul>
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<br/>
			<form id="hwm001Location" name="hwm001Location" class="form-horizontal form-label-left input_mask">
				<div class="form-group">
				    <label class="col-md-3 col-sm-3 col-xs-10 control-label">위치 </label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				        <div class="input-group">
	                       	<select class="select2_single form-control" tabindex="-1" required="required" id="LCodeType" name="LCodeType" >
						      	<!-- <option value="com">본사</option>
						      	<option value="agen">대리점 및 쇼룸</option>
						      	<option value="fac">항간공장</option>
						      	<option value="etc">기타</option> -->
					      	</select>
					      	<span class="input-group-btn">
	                           	<button type="button" class="btn btn-primary" onclick="popModalChek()" id="hwm001btn01" name="hwm001btn01">검색</button>
	                        </span>
	                    </div>
				    </div>
				</div>
				<div class="form-group">
				    <label class="col-md-3 col-sm-3 col-xs-10 control-label"> </label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
						<input type="text" class="form-control" id="LCode1Name" name="LCode1Name" readonly="readonly">
						<input type="hidden" class="form-control" id="LCode1" name="LCode1">
					</div>
				</div>
					
				<div class="form-group">
				    <label class="col-md-3 col-sm-3 col-xs-10 control-label"> </label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
						<input type="text" class="form-control" id="LCode2Name" name="LCode2Name" readonly="readonly">
						<input type="hidden" class="form-control" id="LCode2" name="LCode2" >
					</div>
				</div>	
				<div class="clearfix"></div>
				<!--hidden  -->
				<div hidden="true">
					<button type="reset" class="btn btn-primary" id="resetBtn02"></button>
					<input type="hidden" id="eBtnValue">
				</div>
			</form>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6 col-xs-12">
		<div class="x_panel">			
			<div class = "x_title">
		    	<h2>구매정보</h2>
		    	<ul class="nav navbar-right panel_toolbox">
		    		<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		            </li>
		    	</ul>
				<div class="clearfix"></div>
	   		</div>
			<div class = "x_content">
				<br/>
				<form id="hwm001PurInfo" name="hwm001PurInfo" class="form-horizontal form-label-left input_mask">
					<div class="form-group">
					  	<label class="col-md-3 col-sm-3 col-xs-10 control-label">구매일</label>
					  	<div class="col-md-5 col-sm-5 col-xs-12">
					  		<div class="input-group date" id="purDatePicker">
					  			<input type='text' class="form-control" id="purDate" name="purDate" data-inputmask="'mask' : '9999.99.99'"/>
			                    <span class="input-group-addon">
			                    	<span class="glyphicon glyphicon-calendar"></span>
			                    </span>
					  		</div>
					 	</div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 col-sm-3 col-xs-10 control-label">구매 품의 번호</label>
					    <div class="col-md-5 col-sm-5 col-xs-12">
					      <input type="text" class="form-control" id="purNum" name="purNum">
					    </div>
					</div>
					
					<div class="clearfix"></div>
					<div hidden="true">
						<button type="reset" class="btn btn-primary" id="resetBtn03"></button>
					</div>
				</form>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="x_panel">
			<div class = "x_title">
		    	<h2>기타정보</h2>
		    	<ul class="nav navbar-right panel_toolbox">
		    		<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		            </li>
		    	</ul>
				<div class="clearfix"></div>
	   		</div>
	   		<div class = "x_content">
		   		<br/>
				<form id="hwm001Etc" name="hwm001Etc" class="form-horizontal form-label-left input_mask" >
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">PC User</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" id="PcName" name="PcName">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">MAC Address</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" id="macAdd" name="macAdd">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">IP</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" id="IpAddress" name="IpAddress">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">OS</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" id="OperSys" name="OperSys">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">램</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" id="Ram" name="Ram">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">그래픽카드</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" id="GrapCard" name="GrapCard">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">모니터인치</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" id="Inch" name="Inch">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">메모</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<textarea rows="4" class="form-control" id="Note" name="Note"></textarea>
						</div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 col-sm-3 col-xs-10 control-label">입력일자</label>
					    <div class="col-md-5 col-sm-5 col-xs-12">
					      <input type="text" class="form-control" id="inputDate" name="inputDate" readonly="readonly">
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 col-sm-3 col-xs-10 control-label">마지막 수정 일자</label>
					    <div class="col-md-5 col-sm-5 col-xs-12">
					      <input type="text" class="form-control" id="updateDate" name="updateDate" readonly="readonly">
					    </div>
					</div>
					<div hidden="true">
						<button type="reset" class="btn btn-primary" id="resetBtn04"></button>
					</div>
				</form>
	   		</div>
	   	</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){
 		$("#uploadFile").on("change",handleImgFileSelect);
 		
 		setSelectBox("Manufac","hwManufac");
 		setSelectBox("ItemType","hwItem");
 		setSelectBox("ItemStatus","hwStatus");
 		setSelectBox("LCodeType","lCode");
 		
 		$("#PDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
 		
 		$("#purDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"  
 		});
 		
 		$("#productDate").keyup(function(event){
 			if((event.keyCode == 13)&&($("#productDate").val().length == 8)){
 				this.blur();
 			}
 		})
		
 		$("#purDate").keyup(function(event){
 			if((event.keyCode == 13)&&($("#purDate").val().length == 8)){
 				this.blur();
 			}
 		})
 		
 		$("#LCodeType").change(function(){
 			if(($("#LCodeType").val() == "empty") || ($("#LCodeType").val() == "fEmpty") || ($("#LCodeType").val() == "rEmpty")){
 				$("#LCodeType").val("com");
 				PNotifyAlert("error","[공석] 기능을 사용해주세요.","");
 			}
		})
 		
		$("#ItemStatus").change(function(){
 			if($("#ItemStatus").val()=="05"){
 				$("#ItemStatus").val("01");
 				PNotifyAlert("error","[폐기] 제품을 등록할 수 없습니다.","");
 			}
 		})
 		
 		$("#btnNew").on("click",initHwm001);
 		$("#btnSave").on("click",saveHwm001);
 		$("#btnMove").on("click",moveResource);
 		$("#btnEmpty").on("click",noOwnerResource);
 		$("#preViewModal").hide();
 		
 		if(("${thw10.identiCode}" !="")&&("${thw10.rSeq}"!="")){
 			searchHwResource("${thw10.rSeq}","${thw10.identiCode}");
 			$("#Manufac").prop("readonly", true);
 			$("#ModelName").prop("readonly", true);
 			$("#LCodeType").prop("readonly", true);
 			$("#IdentiCode").prop("readonly", true);
 			$("#productDate").prop("readonly", true);
 			
 			/* $("#ItemType").on("click",function(){
 				this.blur();
 				return false;
 			}); */
 			$("#LCodeType").on("click",function(){
 				PNotifyAlert("error","위치변경시 [이동등록]페이지에서 등록 바랍니다.","");
 				this.blur();
 				return false;
 			});
 			
 			$("#hwm001Title").html("HW상세 내역");
 			
 			$("#hwm001ButtonPage02").show();
 			//$("#hwm001ButtonPage01").hide();
 			
 		}else{
 			$("#hwm001ButtonPage02").hide();
 			//$("#hwm001ButtonPage01").show();
 			
 			$("#hwm001Title").html("HW자산 등록");
 			
 		}
 		

 	});
 	
 	function handleImgFileSelect(e){
 		var files = e.target.files;
 		var filesArr = Array.prototype.slice.call(files);
 		if(filesArr[0].type.match("image.*")){
 			var reader = new FileReader();
 			reader.onload = function(e){
 					$("#fileName").val(filesArr[0].name);
 					$("#ImgUUID").val("");
 			}
 			reader.readAsDataURL(filesArr[0]); 	
 		}
 	}
 	
 	function imgUpClcik(){
 		$('input[type="file"]').click();
 	}
 	
 	function popModalChek(){
 		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		if("${thw10.rSeq}"!=""){
 			//alert("위치변경시 [이동등록]페이지에서 등록 바랍니다.");
 			PNotifyAlert("error","위치변경시 [이동등록]페이지에서 등록 바랍니다.","");
 			return false;
 		}
 		
 		if(($("#LCodeType").val()=="com")||($("#LCodeType").val()=="fac")||($("#LCodeType").val()=="reg")){
 			$("#searchEMP").modal();
 		}else if($("#LCodeType").val()=="agen"){
 			$("#searchTarget").modal();
 		}else if($("#LCodeType").val()=="etc"){
 			$("#searchEtc").modal();
 		}else if($("#LCodeType").val()=="fetc"){
 			$("#searchEtc").modal();
 		}else if (($("#LCodeType").val()=="empty") ||($("#LCodeType").val()=="fEmpty")||($("#LCodeType").val()=="rEmpty")){
 			//alert("공석처리를 할 수 없습니다.");
			PNotifyAlert("error","공석처리를 할 수 없습니다.","");
 			return false;
 		}
 	}
 	
 	function checkImgMoal(){
 		$("#checkImg").modal();
 	}
 	
 	function initHwm001(){
 		
 		$("#resetBtn01").click();
		$("#resetBtn02").click();
		$("#resetBtn03").click();
		$("#resetBtn04").click();
		//$("#imagePre").css("background-image", "");
		$("#inputDate").val(getSysDate());
		/* 히든값으로 되어잇는건 리셋머튼으로 리셋이 안됨*/
		$("#rSeq").val("");
		$("#ImgUUID").val("");
		$("#LCode1").val("");
		$("#LCode2").val("");
 	}
 	
 	function searchHwResource(rSeq,IdentiCode){
 		$.ajax({
 			type : "post",
 			url : "searchHwResource.do",
 			data : "rSeq="+rSeq+"&IdentiCode="+IdentiCode,
 			success : function(hwData){
 				console.log(hwData);
 				$("#ItemType").val(hwData.itemType);
 				$("#rSeq").val(hwData.rSeq);
 				$("#IdentiCode").val(hwData.identiCode);
 				$("#Manufac").val(hwData.manufac);
 				$("#ModelName").val(hwData.modelName);
 				$("#productDate").val(hwData.productDate);
 				$("#ItemStatus").val(hwData.itemStatus);
 				
 				if((hwData.saveFileName != null)&&(hwData.saveFileName !="")){
 					$("#fileName").val(hwData.identiCode+".jsp");
 					$("#ImgUUID").val(hwData.saveFileName);
 					$("#preViewModal").show();
 	 			}
 				
 				$("#LCodeType").val(hwData.lcodeType);
 				$("#LCode1").val(hwData.lcode1);
 				$("#LCode1Name").val(hwData.lcode1Name);
 				$("#LCode2").val(hwData.lcode2);
 				$("#LCode2Name").val(hwData.lcode2Name);
 				$("#purDate").val(hwData.purDate);
 				$("#purNum").val(hwData.purNum);
 				$("#PcName").val(hwData.pcName);
 				$("#macAdd").val(hwData.macAdd);
 				$("#IpAddress").val(hwData.ipAddress);
 				$("#OperSys").val(hwData.operSys);
 				$("#Ram").val(hwData.ram);
 				$("#GrapCard").val(hwData.grapCard);
 				$("#Inch").val(hwData.inch);
 				$("#Note").val(hwData.note);
 				$("#inputDate").val(hwData.inputDate);
 				$("#updateDate").val(hwData.updateDate);
 				
 			}
 		})
 	}
 		
	function saveHwm001(){
		//var IdentiCode = document.getElementById("IdentiCode").value;
		var saveFlg = true;
		
		if($("#IdentiCode").val() == ""){
			//alert("식별번호는 필수 입력 항목입니다.");
			PNotifyAlert("error","식별번호는 필수 입력 항목입니다.","");
			saveFlg = false;
		}
		if($("#Manufac").val() == ""){
			//alert("제조사는 필수 입력 항목입니다.");
			PNotifyAlert("error","제조사는 필수 입력 항목입니다.","");
			saveFlg = false;
		}
		if($("#ModelName").val() == ""){
			//alert("모델명은 필수 입력 항목입니다.");
			PNotifyAlert("error","모델명은 필수 입력 항목입니다.","");
			saveFlg = false;
		}
		if($("#productDate").val() == ""){
			//alert("제조년월은 필수 입력 항목입니다.");
			PNotifyAlert("error","제조년월은 필수 입력 항목입니다.","");
			saveFlg = false;
		}
		
		if(saveFlg == false){
			return false;
		}
		
		$.ajax({
 			type : "post",
 			url : "hwResouceRegister.do",
 			dataType : "text",
 			data : bindData(),
 			async : true,
 			success : function(rsult){
 				if(rsult != "E"){
 					if(($("#fileName").val() != "")&&($("#ImgUUID").val() == "")){
 						insertFile();
 					}
 					searchHwResource(rsult,$("#IdentiCode").val());
 					//alert("저장이 완료되었습니다.");
 					PNotifyAlert('info','저장이 완료되었습니다.','')
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
 		var totData = $("form[name=hwm001Basic]").serializeArray()
 		var locaData = $("form[name=hwm001Location]").serializeArray();
 		var purData = $("form[name=hwm001PurInfo]").serializeArray();
 		var etcData = $("form[name=hwm001Etc]").serializeArray();
 		var imgObject = {name : 'resouceImg', value : document.getElementById('uploadFile').files[0]};
 		
 		$.merge(totData,locaData);
 		$.merge(totData,purData);
 		$.merge(totData,etcData);
 		totData.push(imgObject);
 		
 		return totData;
 	}
 	
 	function insertFile(){
 		//event.preventDefault();
 		var data = new FormData(document.getElementById('hwm001Basic'));
		var IdentiCode = document.getElementById("IdentiCode").value;
		$.ajax({
	 		type : "post",
	 		enctype: 'multipart/form-data',
	 		url : "insertFile.do",
	 		data : data,
	 		dataType : "text",
	 		processData: false,
	        contentType: false,
	        cache: false,
	        async : true,
	 		success : function(data){
	 			$('#ImgUUID').val(data);
	 			if(data == "E01"){
	 				alert("이미지 파일만 업로드 할 수 있습니다.");
	 			}else if(data == "E02"){
	 				alert("파일의 크기가 0이거나 존재하지 않는 파일 입니다.");
	 			}else{
	 				insertFileHistory(IdentiCode,data,"hwm001");
	 			}
	 		},
	 		error : function(e){
	 			console.log(e);
	 			alert("저장에 실패하였습니다.");
	 		}
	 	}); 
 	}
 	
 	function insertFileHistory(IdentiCode,getUUID,pgid){
 		$.ajax({
 			type : "post",
 			url : "insertFileHistory.do",
 			dataType : "text",
 			data : "IdentiCode="+IdentiCode+"&UUID="+getUUID+"&pgid="+pgid,
 			success : function(rsult){
 				updateFileName(IdentiCode,getUUID);
 			},
 			error : function(request, error){
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				alert("저장에 실패하였습니다.");
 			}
 		});
 	}
 	
 	function updateFileName(IdentiCode,UUID){
 		$.ajax({
 			type : "post",
 			url : "updateFileNameTHW10.do",
 			dataType : "text",
 			data : "IdentiCode="+IdentiCode+"&UUID="+UUID,
 			success : function(rsult){
 				$("#fileName").val(IdentiCode+".jsp");
 			}
 		});
 	}
 	
 	function moveResource(){
 		if(confirm("[이동내역]을 작성하시겠습니까?")){
 			location.href="hwm001MovingHistory.do?rSeq="+$("#rSeq").val()+"&IdentiCode="+$("#IdentiCode").val();
 		}	
 	}
 	
  	function noOwnerResource(){
 		if(confirm("퇴사 및 공석 처리를 진행하겠습니까?")){
			//var lastUser = getSysDate() + " 마지막 사용자 : ["+$("#LCode1Name").val()+ "]" + $("#LCode2Name").val();
			var lastUser = "["+ getSysDate() +"] 마지막 사용자 : "+$("#LCode1Name").val()+"_"+ $("#LCode2Name").val();
			var LCodeFlag = "";
			
			if($("#LCodeType").val()=="com"){
				LCodeFlag = "empty";
			}else if($("#LCodeType").val()=="fac"){
				LCodeFlag = "fEmpty";
			}else if($("#LCodeType").val()=="reg"){
				LCodeFlag = "rEmpty";
			}else{
				LCodeFlag = $("#LCodeType").val();
			}
			
			$.ajax({
	 			type : "post",
	 			url : "resourceMoveHistory.do",
	 			dataType : "text",
	 			data : {
	 				rSeq : $("#rSeq").val(),
	 				IdentiCode : $("#IdentiCode").val(),
	 				ModelName : $("#ModelName").val(),
	 				ProductDate : $("#ProductDate").val(),
	 				startLCode1 : $("#LCode1").val(),
	 				startLCode1Name : $("#LCode1Name").val(),
	 				startLCode2 : $("#LCode2").val(),
	 				startLCode2Name : $("#LCode2Name").val(),
	 				ItemType : $("#ItemType").val(),
	 				arrLCodeType : LCodeFlag,
	 				arrLCode1 : $("#LCode1").val(),
	 				arrLCode1Name : $("#LCode1Name").val(),
	 				arrLCode2 : $("#LCode1").val(),
	 				arrLCode2Name : "",
	 				arrDate : getSysDate(),
	 				Note : lastUser
	 				
	 			},
	 			success : function(rsult){
	 				if(rsult != "E"){
	 					PNotifyAlert('info','저장이 완료되었습니다.','');
						//alert("저장이 완료되었습니다.");
						searchHwResource($("#rSeq").val(),$("#IdentiCode").val());
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
 	}
	
 	
</script>