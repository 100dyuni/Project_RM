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
		    	<h3>공석 자산 회수</h3>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class = "x_title">
						<h2>공석 자산</h2>
						<div class="col-md-2 col-sm-4 form-group pull-right">
							<button class="btn btn-dark" type="button" onclick="searchEmptyList()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class = "x_content">
						<div class="form-group">
							<div class="col-md-4 col-xs-12">
								<label class="control-label">미반납 구분</label>
							</div>
							<div class="col-md-7 col-xs-12">
								<select class="select2_single form-control" tabindex="-1" id="emptyCodeSB" name="emptyCodeSB" >
							    </select>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="form-group">
							<div class="col-md-4 col-xs-12" >
								<label class="control-label">부서</label>
							</div>
							<div class="col-md-7 col-xs-12">
								<select class="select2_single form-control" tabindex="-1" id="divisionSB" name="divisionSB" >
							    </select>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="x_panel" >
					<div class = "x_title">
						<div class="col-md-4">
							<label><h2><span id="searchEptRsInfo" ></span></h2>  </label>
						</div>
						<div class="col-md-2 col-sm-2 form-group pull-right">
							<button class="btn btn-dark" type="button" onclick="addTargetList()"><i class="fa fa-plus"></i>&nbsp;&nbsp;추가</button>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<form class="form-horizontal" name="tot103form01" id ="tot103form01">
							<div class="table-responsive">
								<table class="table table-hover jambo_table " style="table-layout: fixed" id="eptResourceTable">
									<thead>
										<tr class="headings center">
											<th width="10px"><input type="checkbox" class="select-all" name="select-all" id="select-all"> </th>
											<th width="100px">부서</th>
											<th width="100px">종류</th>
											<th width="120px">모델명</th>
											<th width="100px">제조년월</th>
											<th width="140px">식별번호</th>
											<th width="100px">마지막 사용자</th>
										</tr>
									</thead>
									<tbody id="eptResourceList">
									
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel" style="height: 178px">
					<div class = "x_title">
						<h2>이동 위치</h2>
						<div class="col-md-2 col-sm-4 form-group pull-right">
							<button class="btn btn-dark" type="button" onclick="tot103Save()"><span class="fa fa fa-save">&nbsp;&nbsp;</span>저장</button>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<div class="form-group">
							<div class="col-md-4 col-xs-12">
								<label class="control-label">이동 위치</label>
							</div>
							<div class="col-md-7 col-xs-12">
								<select class="select2_single form-control" tabindex="-1" id="arrLCodeSB" name="arrLCodeSB" >
							    </select>
							</div>
							<div class="clearfix">
								<!-- <input type="text" id ="arrLCodeType" name="arrLCodeType">
								<input type="text" id ="arrLCode1" name="arrLCode1">
								<input type="text" id ="arrLCode1Name" name="arrLCode1Name">
								<input type="text" id ="arrLCode2" name="arrLCode2">
								<input type="text" id ="arrLCode2Name" name="arrLCode2Name"> -->
							</div>
							<div class="col-md-1"></div>
							<div class="clearfix"></div>
						</div>
						
						
					</div>
				</div>	
					
				<div class="clearfix"></div>
				<div class="x_panel" >
					<div class = "x_title">
						<div class="col-md-4">
							<label><h2><span id="moveRsCount" ></span></h2>  </label>
						</div>
						<div class="col-md-2 col-sm-5 form-group pull-right">
							<button class="btn btn-dark" type="button" onclick="deleteAllTarget()"><i class="fa fa-trash-o">&nbsp;&nbsp;</i>전체 삭제</button>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class = "x_content">
						<form class="form-horizontal" name="tot103form02" id ="tot103form02">
							<div class="table-responsive">
								<table class="table table-hover jambo_table " style="table-layout: fixed" id="moveResourceTable">
									<thead>
										<tr class="headings center" >
											<th width="60px" hidden="hidden">seq</th>
											<th width="100px">종류</th>
											<th width="120px">모델명</th>
											<th width="100px">제조년월</th>
											<th width="140px">식별번호</th>
											<th width="100px"></th>
										</tr>
									</thead>
									<tbody id ="moveResourceList">
									
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
		setEmptyCodeSB();
		setDivisionSB("empty");
		setArrLCodeSB();
		
		$("#emptyCodeSB").change(function(){
			setDivisionSB($("#emptyCodeSB").val());
		})
		
		$("#select-all").click(function(){
	    	var all = $("input.select-all")[0];
	        var checked = all.checked;
	        $("input.select-item").each(function (index,item) {
	        	item.checked = checked;
	        });
	    })
		
		
 	});

	function addTargetList(){
		var rSeqCheck = $("input[name=rSeqCheck]:checked");
		
    	 
		rSeqCheck.each(function(i,item){
	    	var tr = rSeqCheck.parent().parent().eq(i);
	    	var td = tr.children();
	        var checkRows = $("#moveResourceList tr");
	    	var addFlg = true;
	     
	    	//var targetList = document.getElementById("moveResourceList");
	    	//var row = targetList.insertRow(targetList.rows.length);
	    	
	        for(var j=0; j<=$(checkRows).length;j++){
	    		if($(checkRows[j]).children().eq(0).text() == item.value){
	    			addFlg = false;
	    		}
	        }
	        
	    	
	    	if(addFlg){
	    		var temp = $("#moveResourceList").html();
	    		var str ="";
	    		
	    		str += "<tr>";
	    		str += "	<td hidden='hidden'>" + item.value + "</td>";
	    		str += "	<td>" + td.eq(2).text() + "</td>";
	    		str += "	<td>" + td.eq(3).text() + "</td>";
	    		str += "	<td>" + td.eq(4).text() + "</td>";
	    		str += "	<td>" + td.eq(5).text() + "</td>";
	    		str += "	<td> <button class='btn btn-dark' type='button' onclick='deleteTarget(this)' style='margin-bottom: 0px; margin-right: 0px;'>삭제</button> </td>";
	    		str += "</tr>";
	    		
	    		temp += str;
	    		$("#moveResourceList").html(temp);
	    		$("#moveRsCount").html("선택된 수량 : " + (checkRows.length+1));
	    	}
	    	 
	    })
        
	}
	
	function deleteAllTarget() {
		$("#moveResourceList").html("");
	    $("#moveRsCount").html("");
		
	}
	
	function deleteTarget(obj){
		var tr = $(obj).parent().parent();
	  
	    tr.remove();
	    $("#moveRsCount").html("선택된 수량 : " + ($("#moveResourceList tr").length));
	}
	
	
	function tot103Save(){
		
		var rSeqList =[];
		var tr = $("#moveResourceList tr");
		
		if($(tr).length == 0){
			PNotifyAlert("info","선택된 자산이 없습니다.","");
			return false;
		}
		
		for(i=0; i<$(tr).length;i++){
		    rSeqList.push($(tr[i]).children().eq(0).text());
		}
		
		var arrLCodeSB= document.getElementById("arrLCodeSB");
		
		if(confirm($(tr).length +" 개의 HW자산을 \n"+arrLCodeSB.options[arrLCodeSB.selectedIndex].text +" 로 이동하시겟습니까?")){
			$.ajax({
				type : "post",
     			url : "tot103Save.do",
     			traditional : true,
     			data : {
     				"rSeqList" : rSeqList,
     				"arrLCode1" : $("#arrLCodeSB").val(),
     				"arrLCode1Name" : arrLCodeSB.options[arrLCodeSB.selectedIndex].text ,
     				"arrLCode2" : $("#arrLCodeSB").val(),
     				"arrLCodeType" : "etc",
     				"arrDate"	: getSysDate()
     			}, 
     			success : function(rsult){
     				if(rsult != "E"){
     					searchEmptyList();
     					deleteAllTarget();
     					PNotifyAlert("info","","저장이 완료되었습니다.");
     					//location.href="tot103.do";
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
	
	/////////////////////////////////////////////////////////////////////////////////////생성
	
	function setEmptyCodeSB(){
		$.ajax({
			type: "post",
			url: "setEmptyCodeSB.do",
			success: function(data){
				var str = "";
		    	$.each(data, function(index) {
		    		str += "<option value='"+data[index].lowCode +"'>"+data[index].lowCodeName+"</option>";
		    	});
				$("#emptyCodeSB").html(str);
				
			}
		});
	}
	
	function setDivisionSB(code){
		var orgFlag = "";
		
		if(code == "empty"){
			orgFlag="HQ";
		}else if(code == "fEmpty"){
			orgFlag="FAC";
		}else if(code == "rEmpty"){
			orgFlag="REG";
		}
		
		$.ajax({
			type: "post",
			url: "setDivisionSB.do",
			data: "orgFlag="+orgFlag,
			success: function(data){
				var str = "";
					str += "<option value=''>전체</option>";
		    	$.each(data, function(index) {
		    		str += "<option value='"+data[index].highOrgCode +"'>"+data[index].highOrgName+"</option>";
		    	});
				$("#divisionSB").html(str);
				
			}
		});
	}
	
	function searchEmptyList(){
		
		var LCodeType = $("#emptyCodeSB").val();
		var LCode1 = $("#divisionSB").val();
		
		$.ajax({
			type: "post",
			url: "searchEmptyList.do",
			data : "LCodeType="+LCodeType+"&LCode1="+LCode1,
			success: function(data){
				var str = "";
				$.each(data, function(index) {
					str += "<tr  style='height: 51px'>";
					str += "	<td><input type='checkbox' class='select-item checkbox' name='rSeqCheck' value ="+ data[index].rSeq +"></td>";
					str += "	<td>" + ( data[index].highOrgName) + "</th>";
					str += "	<td>" + ( data[index].ItemType) + "</th>";
					str += "	<td>" + ( data[index].ModelName ) + "</td>";
					str += "	<td>" + ( data[index].productDate ) + "</td>";
					str += "	<td>" + ( data[index].IdentiCode ) + "</td>";
					str += "	<td>" + ( data[index].preUsr ) + "</td>";
					str += "</tr>"
				});
				$("#eptResourceList").html(str);
				$("#searchEptRsInfo").html("검색 수량 : "+data.length);
				
				
			}
		});
		
	}
	

	function setArrLCodeSB(){
		$.ajax({
			type: "post",
			url: "modalSearchLowOrg.do",
			data:  "highOrgCode=99999999&orgFlag=HQ",
			success: function(data){
				var str = "";
		    	$.each(data, function(index){
		    		str += "<option value='"+data[index].lowOrgCode +"'>"+data[index].lowOrgName+"</option>";
		    	});
				$("#arrLCodeSB").html(str);	
			}
		});
	}

	
</script>