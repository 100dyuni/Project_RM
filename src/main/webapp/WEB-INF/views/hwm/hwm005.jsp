<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery.min.js"></script>

<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>

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
		    	<h3>HW조직 이동</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-6 col-md-4 col-lg-3 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="hwm005Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;확인 대상</i></button>
		                		<button class="btn btn-dark" type="button" onclick="hwm005Save()"><i class="fa fa fa-save">&nbsp;&nbsp;저장</i></button>
		            		</span>
		                </span>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-3 col-sm-3 col-xs-12">
				<div class="x_panel">
					<div class = "x_title">
						<h2>이동대상</h2>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<div class="form-group">
							<div class="col-md-3 col-xs-12">
								<label class="control-label">조직 구분</label>
							</div>
							<div class="col-md-8 col-xs-12">
								<div class="input-group">
									<select class="select2_single form-control" tabindex="-1" id="fromOrgFlag" name="fromOrgFlag" >
							      	</select>
							      	<span class="input-group-btn">
				                       	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="hwm005btn01" name="hwm005btn01" style="margin-right: 0px">검색</button>
				                      	<input type="hidden" id="eBtnValue">
				                    </span>
				            	</div>
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
						<div class="form-group">
							<div class="col-md-3 col-xs-12" >
								<label class="control-label">부서</label>
							</div>
							<div class="col-md-8 col-xs-12">
								<input type="text" class="form-control" id ="fromDivisionName" name="fromDivisionName" readonly="readonly">
								<input type="hidden" id="fromHighOrgCode" name="fromHighOrgCode">
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
						
						<div class="form-group">
							<div class="col-md-3 col-xs-12" >
								<label class="control-label">팀</label>
							</div>
							<div class="col-md-8 col-xs-12">
								<input type="text" class="form-control" id = "fromTeamName" name="fromTeamName" readonly="readonly">
								<input type="hidden" id="fromLowOrgCode" name="fromLowOrgCode">
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="x_panel" >
					<div class = "x_title">
						<div class="col-md-2 col-sm-2 form-group pull-right">
							<button class="btn btn-dark" type="button" onclick="addTargetList()"> 추가 </button>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<form class="form-horizontal" name="hwm005form01" id ="hwm005form01">
							<div class="table-responsive">
								<table class="table table-hover jambo_table " style="table-layout: fixed" id="orgMemberListTable">
									<thead>
										<tr class="headings center">
											<th width="10px"><input type="checkbox" class="select-all" name="select-all" id="select-all"> </th>
											<th width="60px">팀</th>
											<th width="60px">이름</th>
											<th width="40px">직급</th>
										</tr>
									</thead>
									<tbody id="orgMemberList">
									
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="x_panel" >
					<div class = "x_title">
						<h2>이동부서</h2>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<div class="form-group">
							<div class="col-md-3 col-xs-12">
								<label class="control-label">조직 구분</label>
							</div>
							<div class="col-md-8 col-xs-12">
								<div class="input-group">
									<select class="select2_single form-control" tabindex="-1" id="toOrgFlag" name="toOrgFlag" >
							      	</select>
							      	<span class="input-group-btn">
				                       	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="hwm005btn02" name="hwm005btn02" style="margin-right: 0px;">검색</button>
				                      	<input type="hidden" id="eBtnValue"> 
				                    </span>
				            	</div>
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
						<div class="form-group">
							<div class="col-md-3 col-xs-12" >
								<label class="control-label">부서</label>
							</div>
							<div class="col-md-8 col-xs-12">
								<input type="text" class="form-control" id ="toDivisionName" name="toDivisionName" readonly="readonly">
								<input type="hidden" id="toHighOrgCode" name="toHighOrgCode">
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
						
						<div class="form-group">
							<div class="col-md-3 col-xs-12" >
								<label class="control-label">팀</label>
							</div>
							<div class="col-md-8 col-xs-12">
								<input type="text" class="form-control" id = "toTeamName" name="toTeamName" readonly="readonly">
								<input type="hidden" id="toLowOrgCode" name="toLowOrgCode">
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
						
						<div class="form-group hidden">
							<div class="col-md-3 col-xs-12" >
								<label class="control-label"></label>
							</div>
							<div class="col-md-8 col-xs-12 ">
								<input type="text" class="form-control" id = "targetListLength" name="targetListLength" readonly="readonly">
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
						
					</div>
				</div>	
					
				<div class="clearfix"></div>
				<div class="x_panel" >
					<div class = "x_title">
						<div class="col-md-3 col-sm-5 form-group pull-right">
							<button class="btn btn-dark" type="button" onclick="deleteAllTarget()">전체 삭제</button>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<form class="form-horizontal" name="hwm005form02" id ="hwm005form02">
							<div class="table-responsive">
								<table class="table table-hover jambo_table " style="table-layout: fixed" id="targetMemberListTable">
									<thead>
										<tr class="headings center" >
											<th width="60px">팀</th>
											<th width="60px">이름</th>
											<th width="40px">직급</th>
											<th width="40px">사번</th>
											<th width="40px">버튼</th>
										</tr>
									</thead>
									<tbody id ="targetMemberList">
									
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-5 col-sm-5 col-xs-12">
				<div class="x_panel" >
					<div class = "x_title">
						<h2>해당자산<small><span id="HWListLeng"></span></small></h2>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<form class="form-horizontal" name="hwm005form03" id ="hwm005form03">
							<div class="table-responsive">
								<table class="table table-hover jambo_table " style="table-layout: fixed" id="targetHWListTable">
									<thead>
										<tr class="headings center">
											<th width="60px">구분</th>
											<th width="120px">모델명</th>
											<th width="100px">제조년월</th>
											<th width="60px">사번</th>
											<th width="60px">이름</th>
											<th width="140px">식별코드</th>
											<th width="60px" hidden="true">rSeq</th>
										</tr>
									</thead>
									<tbody id="targetHWList">
									
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		setSelectBox("fromOrgFlag","orgFlag");
		setSelectBox("toOrgFlag","orgFlag");
		checkTarget();
		//targetMemberList
		$("#targetListLength").val(0);
		$("#orgListModal").on("hide.bs.modal", function (e) {
			if($("#eBtnValue").val()=="hwm005btn01"){
				$.ajax({
					type: "post",
					url: "searchOrgMemberList2.do",
					data: {
						highOrgCode : $("#fromHighOrgCode").val(),
						lowOrgCode  : $("#fromLowOrgCode").val(),
						orgFlag : $("#fromOrgFlag").val()
					},
					success: function(data){
						var str = "";
				    	$.each(data, function(index) {
							str += "<tr  style='height: 51px'>";
							str += "	<td><input type='checkbox' class='select-item checkbox' name='orgListCheck' value ="+ data[index].empCode +"></td>";
							str += "	<td>" + ( data[index].lowOrgName) + "</th>";
				    		str += "	<td>" + ( data[index].empName ) + "</td>";
				    		str += "	<td>" + ( data[index].rankName ) + "</td>";
				    		str += "</tr>"
				    	});
				    	
				    	$("#orgMemberList").html(str);
							
					}
				});
			}
		}); 
		
		$("#select-all").click(function(){
	    	var all = $("input.select-all")[0];
	        var checked = all.checked;
	        $("input.select-item").each(function (index,item) {
	        	item.checked = checked;
	        });
	    })
		
		
 	});
 	
	function popModalChek(){
		var eObject = event.target;
		$("#eBtnValue").val(eObject.id);
 		$("#orgListModal").modal();
	}
	
	function addTargetList(){
		var orgCheck = $("input[name=orgListCheck]:checked");
		
    	 
	    orgCheck.each(function(i,item){
	    	var tr = orgCheck.parent().parent().eq(i);
	    	var td = tr.children();
	        var addFlg = true;
	        var targetList = document.getElementById("targetMemberList");
	    	var row = targetList.insertRow(targetList.rows.length);
	    	var checkRows = $("#targetMemberList tr");
	    	
	    	$("#targetListLength").val(targetList.rows.length);
	    	
	        for(i=0; i<=$(checkRows).length;i++){
	    		if($(checkRows[i]).children().eq(3).text() == item.value){
	    			addFlg = false;
	    		}
		    }
	    	
	    	if(addFlg){
	    		row.insertCell(0).innerHTML = td.eq(1).text();
				row.insertCell(1).innerHTML = td.eq(2).text();
				row.insertCell(2).innerHTML = td.eq(3).text();
				row.insertCell(3).innerHTML = item.value;
				row.insertCell(4).innerHTML = "<button class='btn btn-dark' type='button' onclick='deleteTarget(this)' style='margin-bottom: 0px; margin-right: 0px;'>삭제</button>";
				
				$.ajax({
					type: "post",
					url: "employeeHw.do",
					data: "empCode="+item.value,
					success: function(data){
						//console.log(data);
						var listStr = "";
						var temp = "";
				    	$.each(data, function(index) {
				    		listStr += "<tr>";
				    		listStr += "	<td>" + data[index].itemType +"</td>";
				    		listStr += "	<td>" + data[index].modelName + "</th>";
				    		listStr += "	<td>" + data[index].productDate + "</td>";
				    		listStr += "	<td>" + data[index].lcode2 + "</td>";
				    		listStr += "	<td>" + data[index].lcode2Name + "</td>";
				    		listStr += "	<td>" + data[index].identiCode + "</td>";
				    		listStr += "	<td hidden='true'>" + data[index].rSeq + "</td>";
				    		listStr += "</tr>"
				    	});
				    	temp = $("#targetHWList").html();
				    	temp += listStr;
				    	$("#targetHWList").html(temp); 
							
					}
				});
				
	    	}
	    	
	    	setTimeout(function(){
	    		$("#HWListLeng").html(document.getElementById("targetHWList").rows.length);	
 			},500)
	    	
	    	 
	    })
        
	}
	
	function deleteAllTarget() {
		$("#targetMemberList").html("");
		$("#targetHWList").html(""); 
		$("#targetListLength").val(0);
		$("#HWListLeng").html(0);	
	}
	
	function deleteTarget(obj){
		var tr = $(obj).parent().parent();
	    var delEmpcode = tr.children().eq(3).text();
		
	    tr.remove();
	    
		var hwlist = $("#targetHWList tr");
	    
	    for(i=0; i<=$(hwlist).length;i++){
	    	//console.log($(hwlist[i]).children().eq(3).text());
	   		if($(hwlist[i]).children().eq(3).text() == delEmpcode){
	   			hwlist[i].remove();
	   		}
	    }
	    
	    $("#targetListLength").val($("#targetListLength").val()-1);
	    $("#HWListLeng").html(document.getElementById("targetHWList").rows.length);	
	}
	
	function hwm005Save(){
		
		if($("#targetListLength").val()==0){
			alert("이동할 사원을 선택해 주시기 바랍니다.");
			return false;
		}
		
		if($("#toHighOrgCode").val() ==""){
			alert("이동할 부서를 선택해 주시기 바랍니다.");
			return false;
		}
		
		if(document.getElementById("targetHWList").rows.length==0){
			alert("이동할 자산이 없습니다.");
			return false;
		}
		
		var rSeqList =[];
		var tr = $("#targetHWList tr");
		
		for(i=0; i<$(tr).length;i++){
		    rSeqList.push($(tr[i]).children().eq(6).text());
		}
		
		if(confirm($(tr).length +" 개의 HW자산을 \n"+$("#toDivisionName").val() +" 로 이동하시겟습니까?")){
			$.ajax({
				type : "post",
     			url : "hwm005Save.do",
     			traditional : true,
     			data : {
     				"rSeqList" : rSeqList,
     				"arrLCode1" : $("#toHighOrgCode").val(),
     				"arrLCode1Name" : $("#toDivisionName").val(),
     				"arrLCodeType" : $("#toOrgFlag").val(),
     				"arrDate"	: getSysDate()
     			}, 
     			success : function(rsult){
     				if(rsult != "E"){
     					PNotifyAlert("info","","저장이 완료되었습니다.");
     					//location.href="hwm005.do";
     				}else{
     					PNotifyAlert('error','저장이 실패하였습니다.','');
     				}
     			},
     			error : function(request, error){
     				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
     				alert("저장에 실패하였습니다.");
     			}
			})
		}	
			
			
	}
	
	function checkTarget(){
		$.ajax({
			type: "post",
			url: "hwm005CheckTarget.do",
			success: function(data){
				if(data.length>0){
					//alert("버르버블버블팝");
					$("#orgHwCheckList").modal();
				}
				console.log(data);
			}
		});
	}
	
	function hwm005Search(){
		$("#orgHwCheckList").modal();
	}
</script>