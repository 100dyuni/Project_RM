<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		    	<h3>부서별 H/W 자산 조회</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="hwm106Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		         	       		<button class="btn btn-dark" type="button" onclick="hwm106Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
		            		</span>
		            	</span>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="x_panel">
			<div class = "x_title">
				<h2>조회 조건</h2>
				<ul class="nav navbar-right panel_toolbox">
		    		<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		            </li>
	    		</ul>
				<div class="clearfix"></div>
			</div>
			<div class = "x_content">
				<form class="form-horizontal" name="hwm106form01" id ="hwm106form01" method="get" action="hwm106Excel.do" accept-charset="utf-8">
					<div class="form-group">
						<div class="row" style="height: 44px">
							<div class="col-md-1 col-xs-10">
								<label class="control-label">조직 구분</label>
							</div>
							<div class="col-md-2 col-xs-10">
								<div class="input-group">
									<select class="select2_single form-control" tabindex="-1" id="orgFlag" name="orgFlag" >
							      	</select>
							      	<span class="input-group-btn">
			                           	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="hwm106btn01" name="hwm106btn01">검색</button>
			                           	<input type="hidden" id="eBtnValue">
			                        </span>
			                    </div>
							</div>
							<div class="col-md-2 col-xs-6 checkbox" >
						  		<label><input type="checkbox" id="divisionCheck" name="divisionCheck">부서 : <span id="divisionName"></span></label>
						  		<input type="hidden" id="highOrgCode" name="highOrgCode">
						  	</div>
						  	<div class="col-md-2 col-xs-6 checkbox">
						  		<label><input type="checkbox" id="teamCheck" name="teamCheck">팀 : <span id="teamName"></span></label>
						  		<input type="hidden" id="lowOrgCode" name="lowOrgCode">
						  	</div>
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ItemTypeCheck" name="ItemTypeCheck" >종류</label>
						  	</div>
						  	<div class="col-md-2">
								<select class="select2_single form-control" tabindex="-1" id="ItemType" name="ItemType">							
								</select>
							</div>
						  	
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="x_panel">
			<div class = "x_content">
				<form class="form-horizontal" name="hwm106form02" id ="hwm106form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table bulk_action" style="table-layout: fixed" id="searchHwm106Table">
			            	<thead >
			                	<tr class="headings center">
			                		<th width="10px" hidden="true">GP</th>
			                		<th width="100px">부서</th>
			                		<th width="100px">팀</th>
			                		<th width="80px">이름</th>
			                		<th width="80px">직책</th>
			                		<th width="60px">종류</th>
			                		<th width="140px">모델명</th>
			                		<th width="80px">제조년월</th>
			                		<th width="80px">운영체제</th>
			                		<th width="60px">제조사</th>
			                		<th width="160px">식별번호</th>
			                		<th width="20px" hidden="true">rSeq</th>
			                		<th width="100px">상태</th>
			                		<th width="300px">메모</th>
			                	</tr>
			                </thead>
			                <tbody id ="hwm106ReportTable">
			                
			                
			            	</tbody>
			            </table>
			        </div>
				</form>
			</div>
		</div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		var usrEmpCode = ${sessionScope.usrID};
		var usrDepCode = ${sessionScope.usrDepCode};
		
		setSelectBox("orgFlag","orgFlag");
		setSelectBox("ItemType","hwItem");
		
		if(usrDepCode != "50000059"){
			setTimeout(function(){
				setUsrOrgInfo(usrEmpCode);			
 			},100)
			
			$("#orgFlag").prop("disabled",true);	
		}else{
			//$("#orgFlag").prop("disabled",false);	
			$("#divisionCheck").prop("disabled",false);
		}
		
		
		$("#hwm106ReportTable").on("dblclick","tr",function(event){
			if(usrDepCode == "50000059"){
				var tr = $(this);
				var td = tr.children();
				
				var rSeq = td.eq(11).text();
				var IdentiCode = td.eq(10).text();
				
				if(rSeq !=""){
					if(confirm("상세페이지로 이동하시겠습니까?")){
						location.href="hwm101DetailSearch.do?rSeq="+rSeq+"&IdentiCode="+IdentiCode;
					}
				}
			}
			
		});
		
		
		if(("${bParam.orgFlag}" !="") &&("${bParam.highOrgCode}" !="")){
			setTimeout(function(){
				$("#orgFlag").val("${bParam.orgFlag}");
				$("#highOrgCode").val("${bParam.highOrgCode}");
				$("#divisionName").html("${bParam.divisionName}");
				document.getElementById("divisionCheck").checked =true;
				hwm106Search();
			},100)
			
		}
		
 	});
 		
	function popModalChek(){
		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		$("#orgListModal").modal();
	}
	
	function hwm106Search(){
		var str="";
		$.ajax({
			type : "post",
			url : "hwm106Search.do",
			data : {
				orgFlag : $("#orgFlag").val(),
				highOrgCode : document.getElementById("divisionCheck").checked == true ? $("#highOrgCode").val() :"",
				lowOrgCode : document.getElementById("teamCheck").checked == true ? $("#lowOrgCode").val() :"",
				ItemType : document.getElementById("ItemTypeCheck").checked == true ? $("#ItemType").val() :""
			},
			success : function(searchData){
				//console.log(searchData);
				if(searchData.length==0){
					PNotifyAlert("info","","결과값이 존재하지 않습니다.");
				}else{
					$.each(searchData, function(index) {
						//bgcolor="CCFFFF" 99CCFF 6699FF
						if(searchData[index].GP==11){
							str += "<tr bgcolor='#EEEEEE'>";
						}else if(searchData[index].GP==12){
							str += "<tr bgcolor='#DDDDDD'>";
						}else if(searchData[index].GP==13){
							str += "<tr bgcolor='#CCCCCC'>";
						}else{
							str += "<tr>";	
						}
			    		str += "	<td hidden='true'>"+ searchData[index].GP +"</td>";
				    	str += "	<td>"+ searchData[index].highOrgName +"</td>";
				    	str += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    	str += "	<td>"+ searchData[index].LCode2Name +"</td>";
				    	str += "	<td>"+ searchData[index].rankName +"</td>";
				    	str += "	<td>"+ searchData[index].ItemType +"</td>";
				    	str += "	<td>"+ searchData[index].ModelName +"</td>";
				    	str += "	<td>"+ searchData[index].productDate +"</td>";
				    	str += "	<td>"+ searchData[index].OperSys +"</td>";
				    	str += "	<td>"+ searchData[index].Manufac +"</td>";
				    	str += "	<td>"+ searchData[index].IdentiCode +"</td>";
				    	str += "	<td hidden='true'>"+ searchData[index].rSeq +"</td>";
				    	str += "	<td>"+ searchData[index].ItemStatus +"</td>";
				    	str += "	<td>"+ searchData[index].Note +"</td>";
				    	str += "</tr>";
			    	});
			    	$("#hwm106ReportTable").html(str);	
			    	
				}
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
		});
	}

	function hwm106Excel(){
		var usrDepCode = ${sessionScope.usrDepCode};
		
		if(usrDepCode != "50000059"){
			$("#orgFlag").prop("disabled",false);
			$("#divisionCheck").prop("disabled",false);
			
			document.hwm106form01.submit();	
			
			$("#orgFlag").prop("disabled",true);
			$("#divisionCheck").prop("disabled",true);
		}else{
			document.hwm106form01.submit();
		}
		
	}
	
	function setUsrOrgInfo(getEmpCode){
		$.ajax({
			type: "post",
			url: "getUsrOrgInfo.do",
			data: { 
					empCode : getEmpCode
			},
			success: function(data){
				$("#highOrgCode").val(data[0].highOrgCode);
				$("#divisionName").html(data[0].highOrgName);
				$("#lowOrgCode").val(data[0].lowOrgCode);
				$("#teamName").html(data[0].lowOrgName);
				$("#orgFlag").val(data[0].orgFlag);
				$("#divisionCheck").prop("checked",true);
				hwm106Search();
				$("#divisionCheck").prop("disabled",true);
			}
		});
	}
	
</script>