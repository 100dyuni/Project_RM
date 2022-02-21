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

<script src="js/switchery.min.js"></script>  
<link href="css/switchery.min.css" rel="stylesheet"> 


<div class="">
	<div class="">
		<div class="page-title">
			<div class="title_left">
		    	<h3>매장 관리</h3>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
        	<div class="col-md-4 col-sm-4 col-xs-12">
            	<div class="x_panel" >
	            	<div class = "x_title">
	            		<div class="title_left">
							<h2>매장 등록</h2>
						</div>
						<div class="title_right">
							<div class="col-md-5 form-group pull-right">
								<button class="btn btn-dark" type="button" onclick="initCom002()"><span class="fa fa-file-o">&nbsp;&nbsp;</span>신규</button>
		                    	<button class="btn btn-dark" type="button" onclick="saveCom002()"><span class="fa fa-save">&nbsp;&nbsp;</span>저장</button>
							</div>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
            	
                	<div class="x_content">
                		<form id="com002form01" name="com002form01" class="form-horizontal" enctype="multipart/form-data" method="post">
                			<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">매장명</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="hidden" id ="aSeq" name ="aSeq"> 
									<input type="text" class="form-control" id="agencyName" name="agencyName">
							    </div>
							</div>
							<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">사용 유무</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<select class="select2_single form-control" tabindex="-1"  id="activeFlg" name="activeFlg"></select>
							    </div>
							</div>
							<div hidden="true">
								<button type="reset" class="btn btn-primary" id="resetBtn01" ></button>
							</div>
                		</form>
	                </div>
                </div>
                
                <div class="x_panel" >
	            	<div class = "x_title">
	            		<div class="title_left">
							<h2>담당자</h2>
						</div>
						<div class="title_right">
							<div class="col-md-4 form-group pull-right">
								<button class="btn btn-dark" type="button" id="com002btn01" onclick="popModalChek()"><i class="fa fa-search"></i>&nbsp;&nbsp;담당자 검색</button>
							</div>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
            	
                	<div class="x_content">
                		<form id="com002form02" name="com002form02" class="form-horizontal" enctype="multipart/form-data" method="post">
                			<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">관리부서</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="manageDepName" name="manageDepName" readonly="readonly"/>
									<input type="hidden" id="manageDep" name="manageDep" />
							    </div>
							</div>
							<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">담당자</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="manageEmpName" name="manageEmpName" readonly="readonly"/>
									<input type="hidden" id="manageEmp" name="manageEmp"/>
							    </div>
							</div>
							<div hidden="true">
								<input type="text" id="eBtnValue">
								<button type="reset" class="btn btn-primary" id="resetBtn02" ></button>
							</div>
                		</form>
	                </div>
                </div>
        	</div>
        	<div class="col-md-8 col-xs-12">
            	<div class="x_panel">
            		<div class = "x_title">
	            		<div class="title_left">
							<h2>매장 조회</h2>
						</div>
						<div class="title_right">
							<div class="col-md-1 form-group pull-right">
								<button type="button" class="btn btn-dark" onclick="agencyListSearch()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
							</div>
						</div>
						<div class="clearfix"></div>
	            	</div>
            		<div class="clearfix"></div>
                	<div class="x_content">
	                	<form id="lowCodeForm" name="lowCodeForm" class="form-horizontal" enctype="multipart/form-data" method="post">
                			<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">매장명</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<input type="text" class="form-control" id="inAgencyName" name="inAgencyName">
							    </div>
							</div>
							<div class="form-group">
								<label class="col-md-4 col-sm-4 col-xs-10 control-label">사용유무</label>
							    <div class="col-md-5 col-sm-5 col-xs-12">
							    	<select class="select2_single form-control" tabindex="-1"  id="inActiveFlg" name="inActiveFlg"></select>
							    </div>
							</div>
						</form>
                		
                		<div class="table-responsive">
	                    	<table class="table table-striped jambo_table" style="table-layout: fixed" >
	                        	<thead>
	                          		<tr class="headings" >
	                          			<th class="column-title" width="40px" hidden="hidden">aSeq</th>
	                            		<th class="column-title" >매장명</th>
	                            		<th class="column-title" width="40px" hidden="hidden">관리부서코드</th>
	                            		<th class="column-title" >관리부서</th>
			                            <th class="column-title" width="50px" hidden="hidden">담당자 사번</th>
			                            <th class="column-title" >담당자 </th>
	                            		<th class="column-title" >사융유무</th>
			                        </tr>
	                          	</thead>
		                        <tbody id="agencyListTable">
		                         		
		                         	
		                         	
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
 		
	setSelectBox("activeFlg","activeFlag");
	setSelectBox("inActiveFlg","activeFlag");
 		
	agencyListSearch();
	
	$("#agencyListTable").on("click","tr", function(event){
		var tr = $(this);
		var td = tr.children();
		
		var aSeq = td.eq(0).text();
		var agencyName = td.eq(1).text();
		var manageDep = td.eq(2).text();
		var manageDepName = td.eq(3).text();
		var manageEmp = td.eq(4).text();
		var manageEmpName = td.eq(5).text();
		var activeFlg = td.eq(6).text();
 			
		$("#aSeq").val(aSeq);
		$("#agencyName").val(agencyName);
		$("#activeFlg").val(activeFlg);
		$("#manageDepName").val(manageDepName);
		$("#manageDep").val(manageDep);
		$("#manageEmpName").val(manageEmpName);
		$("#manageEmp").val(manageEmp);
 			
	});
});
 		
function popModalChek(){
	var eObject = event.target;
	$("#eBtnValue").val(eObject.id);
	$("#searchEMP").modal();
}
 	
function initCom002(){
	$("#aSeq").val("");
	$("#resetBtn01").click();
	$("#resetBtn02").click();
}
 	
function saveCom002(){
 		
	if($("#agencyName").val()==""){
		alert("매장명은 필수 입력 항목입니다.");
		return false;
	}
 		
	if($("#manageDepName").val()==""){
		alert("담당자는 필수 입력 항목입니다.");
		return false;
	}
 		
	$.ajax({
		type : "post",
		url : "targetAgencyRegister.do",
		dataType : "text",
		data : bindData(),
		success : function(rsult){
			if(rsult != "E"){
 				//console.log("seq : "+rsult);
 				//searchTargetInfo(rsult);
				PNotifyAlert("info","","저장이 완료되었습니다.");
				initCom002();
				agencyListSearch();
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
	var targetData = $("form[name=com002form02]").serializeArray()
	targetData.push({name : 'aSeq', value :  $("#aSeq").val()});
	targetData.push({name : 'agencyName', value :  $("#agencyName").val()});
	targetData.push({name : 'activeFlg', value : $("#activeFlg").val()});
	//console.log(targetData);

	return targetData;
}
 	
/* function searchTargetInfo(aSeq){
	$.ajax({
		type : "post",
		url : "searchTargetInfo.do",
		data : "aSeq="+aSeq,
		success : function(data){
			$("#aSeq").val(data.aSeq);
			$("#agencyName").val(data.agencyName);
			$("#activeFlg").val(data.activeFlg);
			$("#manageDep").val(data.manageDep);
			$("#manageDepName").val(data.manageDepName);
			$("#manageEmp").val(data.manageEmp);
			$("#manageEmpName").val(data.manageEmpName);

		}
	})
} */
 	
function agencyListSearch(){
	//console.log(+$("#inActiveFlg").val());
	$.ajax({
		type : "post",
		url : "agencyListSearch.do",
		data : "agencyName="+$("#inAgencyName").val()+"&activeFlg="+$("#inActiveFlg").val(),
		success : function(data){
			//console.log(data);
			var str=""
			$.each(data, function(index) {
				str += "<tr>";
				str += "<td hidden='hidden'>" + ( data[index].aSeq) + "</th>";
	    		str += "<td>" + ( data[index].agencyName ) + "</td>";
				str += "<td hidden='hidden'>" + ( data[index].manageDep) + "</th>";
	    		str += "<td>" + ( data[index].manageDepName ) + "</td>";
	    		str += "<td hidden='hidden'>" + ( data[index].manageEmp ) + "</td>";
	    		str += "<td>" + ( data[index].manageEmpName ) + "</td>";
	    		str += "<td>" + ( data[index].activeFlg ) + "</td>";
	    		str += "</tr>";
			});
			$("#agencyListTable").html(str);	

		}
	})
}

</script>