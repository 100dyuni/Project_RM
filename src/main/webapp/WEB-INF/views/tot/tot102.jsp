<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery.min.js"></script>

<script src="js/moment.min.js"></script>

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
		    	<h3>퇴사자 확인</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="tot102Save()"><i class="fa fa-save">&nbsp;&nbsp;퇴사 확인</i></button>
		            		</span>
		                </span>
		            </div>
		        </div>
		    </div>
		    
		</div>
		<div class="clearfix"></div>
		<div class="row">
        	<div class="col-md-3 col-xs-12">
            	<div class="x_panel" >
	            	<div class = "x_title">
	            		<div class="title_left">
							<h2>퇴사자 목록</h2>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
            	
                	<div class="x_content">
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th class="column-title" width="40px">사번</th>
			                            <th class="column-title" width="50px">이름 </th>
			                            <th class="column-title" width="40px" hidden="hidden">부서코드</th>
			                            <th class="column-title" width="80px">부서</th>
			                        </tr>
	                          	</thead>
		                        <tbody id="retiredEmpList">
		                
		                        </tbody>
	                      </table>
	                    </div>
	                </div>
                </div>
                
        	</div>
        	<div class="col-md-6 col-xs-12">
            	<div class="x_panel">
            		<div class = "x_title">
	            		<div class="title_left">
							<h2>퇴사자 HW</h2>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
                	<div class="x_content">
	                	<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th hidden="true">rSeq</th>
				                		<th width="60px">종류</th>
				                		<th width="60px">제조사</th>
				                		<th width="140px">모델명</th>
				                		<th width="60px">위치</th>
				                		<th hidden="true">lCode1</th>
				                		<th width="140px">부서</th>
				                		<th hidden="true">lCode2</th>
				                		<th width="80px">사용자</th>
				                		<th width="100px">제조년월</th>
				                		<th width="140px">식별번호</th>
	                            		<th hidden="true">itemtypeCode</th>
	                            		<th hidden="true">LCodeTypeCode</th>
			                        </tr>
	                          	</thead>
		                        <tbody id="empHwList">
		                         	
		                        </tbody>
	                    	</table>
	                    </div>
                		
	                </div>
                </div>
                
        	</div>
        	<div class="col-md-3 col-xs-12">
            	<div class="x_panel" >
	            	<div class = "x_title">
	            		<div class="title_left">
							<h2>퇴사자 SW</h2>
						</div>
						
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
            	
                	<div class="x_content">
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                            		<th class="column-title" width="60px" hidden="hidden">SW종류C</th>
								        <th class="column-title" width="80px">SW종류</th>
								        <th class="column-title" width="100px" hidden="hidden">LicenseC</th>
								        <th class="column-title" width="100px">License</th>
								        <th class="column-title" width="60px">수량</th>
			                        </tr>
	                          	</thead>
		                        <tbody id="empSwList">
		                
		                        </tbody>
	                      </table>
	                    </div>
	                </div>
                </div>
           </div>
        </div>
		
	</div>
</div>


<script type="text/javascript">

$(document).ready(function(){
	
	searchRetiredEmpList();

	setTimeout(function(){
		searchRetiredEmpHwList();
		searchRetiredEmpSwList();
	},500)
		
		
	
	
});

function searchRetiredEmpList(){
	$.ajax({
		type: "post",
		url: "searchRetiredEmpList.do",
		success: function(data){
			var str = "";
	    	$.each(data, function(index) {
				str += "<tr>";
				str += "<td>" + ( data[index].LCode2) + "</th>";
	    		str += "<td>" + ( data[index].LCode2Name ) + "</td>";
	    		str += "<td hidden='hidden'>" + ( data[index].LCode1 ) + "</td>";
	    		str += "<td>" + ( data[index].LCode1Name ) + "</td>";
	    		str += "</tr>"
	    	});
			$("#retiredEmpList").html(str);	
		}
	});
}

function searchRetiredEmpHwList(){
	
	var empCodeList =[];
	var tr = $("#retiredEmpList tr");
	
	if($(tr).length > 0 ){
		
		for(i=0; i<$(tr).length;i++){
			empCodeList.push($(tr[i]).children().eq(0).text());
		}
		
		$.ajax({
			type : "post",
			url : "searchRetiredEmpHwList.do",
			data : {"empCodeList" : empCodeList},
			traditional : true,
			async : true,
			success : function(hwData){
				console.log(hwData);
				if(hwData != "E"){
					var str = "";
			    	$.each(hwData, function(index) {
						str += "<tr>";
						str += "<td hidden='hidden'>" + ( hwData[index].rSeq) + "</th>";
			    		str += "<td>" + ( hwData[index].ItemType ) + "</td>";
			    		str += "<td>" + ( hwData[index].Manufac ) + "</td>";
			    		str += "<td>" + ( hwData[index].ModelName ) + "</td>";
			    		str += "<td>" + ( hwData[index].LCodeType ) + "</td>";
			    		str += "<td hidden='hidden'>" + ( hwData[index].LCode1) + "</th>";
			    		str += "<td>" + ( hwData[index].LCode1Name ) + "</td>";
			    		str += "<td hidden='hidden'>" + ( hwData[index].LCode2) + "</th>";
			    		str += "<td>" + ( hwData[index].LCode2Name ) + "</td>";
			    		str += "<td>" + ( hwData[index].productDate ) + "</td>";
			    		str += "<td>" + ( hwData[index].IdentiCode ) + "</td>";
			    		str += "<td hidden='hidden'>" + ( hwData[index].ItemTypeCode) + "</th>";
			    		str += "<td hidden='hidden'>" + ( hwData[index].LCodeTypeCode) + "</th>";
			    		str += "</tr>"
			    	});
					$("#empHwList").html(str);	
				}else{
					PNotifyAlert('error','죄회에 실패하였습니다.','');
				}
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("저장에 실패하였습니다.");
			}
		})
	}
}

function searchRetiredEmpSwList(){
	var empCodeList =[];
	var tr = $("#retiredEmpList tr");
	
	if($(tr).length > 0 ){
		
		for(i=0; i<$(tr).length;i++){
			empCodeList.push($(tr[i]).children().eq(0).text());
		}
		
		$.ajax({
			type : "post",
			url : "searchRetiredEmpSwList.do",
			data : {"empCodeList" : empCodeList},
			traditional : true,
			async : true,
			success : function(swData){
				if(swData != "E"){
					var str = "";
			    	$.each(swData, function(index) {
						str += "<tr>";
						str += "<td>" + ( swData[index].swType ) + "</td>";
			    		str += "<td>" + ( swData[index].swLicense ) + "</td>";
			    		str += "<td>" + ( swData[index].qty ) + "</td>";
			    		str += "</tr>"
			    	});
					$("#empSwList").html(str);	
				}else{
					PNotifyAlert('error','죄회에 실패하였습니다.','');
				}
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("저장에 실패하였습니다.");
			}
		})
	}
	
}

function tot102Save(){
	var tr = $("#retiredEmpList tr");
	if($(tr).length > 0 ){
		if(confirm("공석처리 및 SW배정을 철회합니다.")){
			retiredHwProcess();
			retiredSwProcess();
			
			
			searchRetiredEmpList();
				
			setTimeout(function(){
				searchRetiredEmpHwList();
				searchRetiredEmpSwList();
			},500)
			
		}	
	}else{
		PNotifyAlert('error','대상이 존재하지 않습니다.','');
	}
	

}

function retiredHwProcess(){
	var tr = $("#empHwList tr");
	var resultFlg = "S";
	
	if($(tr).length > 0 ){
		for(i=0; i<$(tr).length;i++){
			//$(tr[i]).children().eq(0).text();
			
			//var lastUser = getSysDate() + " 마지막 사용자 : ["+ $(tr[i]).children().eq(6).text()+ "]" + $(tr[i]).children().eq(8).text();
			var lastUser = "["+ getSysDate() +"] 마지막 사용자 : "+ $(tr[i]).children().eq(6).text() +"_"+ $(tr[i]).children().eq(8).text();
			
			var LCodeFlag = "";
			var LCodeValue = $(tr[i]).children().eq(12).text();
			
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
	 				rSeq : $(tr[i]).children().eq(0).text(),
	 				IdentiCode : $(tr[i]).children().eq(10).text(),
	 				ModelName : $(tr[i]).children().eq(3).text(),
	 				ProductDate :  $(tr[i]).children().eq(9).text(),
	 				startLCode1 : $(tr[i]).children().eq(5).text(),
	 				startLCode1Name : $(tr[i]).children().eq(6).text(),
	 				startLCode2 : $(tr[i]).children().eq(7).text(),
	 				startLCode2Name : $(tr[i]).children().eq(8).text(),
	 				ItemType : $(tr[i]).children().eq(11).text(),
	 				arrLCodeType : LCodeFlag,
	 				arrLCode1 : $(tr[i]).children().eq(5).text(),
	 				arrLCode1Name : $(tr[i]).children().eq(6).text(),
	 				arrLCode2 : $(tr[i]).children().eq(5).text(),
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
	var tr = $("#retiredEmpList tr");
	
	if($(tr).length > 0 ){
		
		for(i=0; i<$(tr).length;i++){
			empCodeList.push($(tr[i]).children().eq(0).text());
		}
		
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
	
}

</script>
