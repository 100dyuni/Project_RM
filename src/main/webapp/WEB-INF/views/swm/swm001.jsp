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
    	    <h3>S/W 라이센스 구매</h3>
        </div>
        <div class="title_right">
        	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
            	<div class="input-group">
                	<span class="input-group-btn">
                		<span>
                			<button class="btn btn-dark" type="button" onclick="initSwm001()"><span class="fa fa-file-o">&nbsp;&nbsp;</span>신규</button>
                    		<button class="btn btn-dark" type="button" onclick="saveSwm001()"><span class="fa fa fa-save">&nbsp;&nbsp;</span>저장</button>
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
				<h2>품의서 정보</h2>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<form class="form-horizontal" name="swm001Form1" id="swm001Form1">
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">품의 번호</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="purNum" name="purNum">
				    </div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">작성 일자</label>
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
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">메 모</label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<textarea rows="4" class="form-control" id="Note" name="Note"></textarea>
				 	</div>
				</div>
				
				
				<!--히든값  -->
				<div class="form-group" hidden="hidden">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">히든</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    	<input type="text" class="form-control" id="sSeq" name="sSeq">
				    	
				    </div>
				</div>
						  
			</form> 
		</div>  
	</div>
	<div class="clearfix"></div>
	<div class="x_panel">			
		<div class = "x_title">
			<div class="title_left">
				<h2>구매내역</h2>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class = "x_content">
			<form class="form-horizontal form-label-left input_mask" name="swm001Form2" id="swm001Form2">
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">S/W 종류</label>
					<div class="col-md-2 col-sm-2 col-xs-12">
						<select class="select2_single form-control" tabindex="-1" required="required" id="swType" name="swType">
						</select>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-12">
						<select class="select2_single form-control" tabindex="-1" required="required" id="swLicense" name="swLicense">
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">구매 수량</label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<input type="text" class="form-control" id="purQty" name="purQty" style="text-align: right">
					</div>
				</div>
					
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">시작일</label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="input-group date" id="startDatePicker">
					  		<input type='text' class="form-control" id="startDate" name="startDate"/>
			                <span class="input-group-addon">
			                	<span class="glyphicon glyphicon-calendar"></span>
			                </span>
					  	</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">종료일</label>
					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="input-group date" id="endDatePicker">
					  		<input type='text' class="form-control" id="endDate" name="endDate"/>
			                <span class="input-group-addon">
			                	<span class="glyphicon glyphicon-calendar"></span>
			                </span>
					  	</div>
					 </div>
				</div>
				
				<!--히든값  -->
				<div class="form-group" hidden="hidden">
					<label class="col-md-3 col-sm-3 col-xs-10 control-label">히든값</label>
				    <div class="col-md-5 col-sm-5 col-xs-12">
				    
				    </div>
				    <button type="reset" class="btn btn-primary" id="resetBtn02" ></button>
				</div>
				
				
			</form>
		</div>
	</div>
</div>



<script type="text/javascript">

 	$(document).ready(function(){
 		
 		$("#purDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"  
 		});
 		$("#startDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"  
 		});
 		$("#endDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"  
 		});
 		
 		$("#purDatePicker").keyup(function(event){
 			if((event.keyCode == 13)&&($("#arrDate").val().length == 8)){
 				this.blur();
 			}
 		})
 		$("#startDatePicker").keyup(function(event){
 			if((event.keyCode == 13)&&($("#arrDate").val().length == 8)){
 				this.blur();
 			}
 		})
 		$("#endDatePicker").keyup(function(event){
 			if((event.keyCode == 13)&&($("#arrDate").val().length == 8)){
 				this.blur();
 			}
 		})
 		
 		$("#swType").change(function(){
 			setSelectBox("swLicense",$("#swType").val());
 		});
 		
 		/* if(("${thw10.identiCode}" !="")&&("${thw10.rSeq}"!="")){
 			getProductInfo();
 		} */
 		
 		initSwm001();
 	});
 	
 	function initSwm001(){
 		$("#purDate").val(getSysDate());
 		setSelectBox("swType","swLicence");
 		setSelectBox("swLicense","msOffice");
 		
 		$("#startDate").val(getSysDate());
 		$("#endDate").val(get_1Year_Later());
 		
 		$("#purQty").val(0);
 		$("#sSeq").val("");
 		
 		$("#purNum").val("");
 		$("#Note").val("");
 		
 	}
  	
 	function saveSwm001(){
 		var saveFlg = true;
 		
 		if($("#purNum").val()==""){
 			PNotifyAlert("error","품의 번호를 입력해 주시기 바랍니다.","");
 			saveFlg = false;
 		}
 		
 		if($("#purQty").val() <= 0 ){
 			PNotifyAlert("error","구매수량은 0 이상이어야 합니다.","");
 			saveFlg = false;
 		}
 		
 		if($("#endDate").val() < $("#startDate").val()  ){
 			PNotifyAlert("error","날짜를 확인해 주시기 바랍니다.","");
 			saveFlg = false;	
 		}
 		
 		if(saveFlg == false){
 			return false;
 		}
 		
 		$.ajax({
 			type : "post",
 			url : "swLicenseRegister.do",
 			dataType : "text",
 			data : bindData(),
 			async : true,
 			success : function(rsult){
 				if(rsult != "E"){
					PNotifyAlert('info','저장이 완료되었습니다.','');
					$("#sSeq").val(rsult);
					searchSwLicense();
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
 		var mainData = $("form[name=swm001Form1]").serializeArray();
 	 	var purData = $("form[name=swm001Form2]").serializeArray();
 	 	
 	 	$.merge(mainData,purData);
 	 	return mainData;
 	 	
 	}
 	
 	function searchSwLicense(){
 		$.ajax({
 			type: "post",
 			url: "searchSwLicense.do",
 			data: "sSeq="+$("#sSeq").val(),
 			success: function(data){
 				if(data.length==0){
 					PNotifyAlert("error","검색결과가 존재하지 않습니다.","");
 				}else{
 					console.log("완료");
					console.log(data);
					$("#purNum").val(data.purNum);
					$("#purDate").val(data.purDate);
					$("#Note").val(data.note);
					$("#swType").val(data.swType);
					$("#swLicense").val(data.swLicense);
					$("#purQty").val(data.purQty);
					$("#startDate").val(data.startDate);
					$("#endDate").val(data.endDate);
 				}
 			}
 		});
 	}
 	
 

</script>