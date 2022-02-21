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
	<div class="">
		<div class="page-title">
			<div class="title_left">
		    	<h3>이동내역 조회</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="hwm102Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                    	<button class="btn btn-dark" type="button" onclick="hwm102Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
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
				<ul class="nav navbar-right panel_toolbox"></ul>
				<div class="clearfix"></div>
			</div>
			<div class = "x_content">
				<form class="form-horizontal" name="hwm102form01" id ="hwm102form01" method="get" action="hwm102Excel.do" accept-charset="utf-8">
					<div class="form-group">
						<div class="row" style="height: 44px">
							<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="IdentiCodeCheck" name="IdentiCodeCheck" checked="checked">식별번호</label>
						  	</div>
						  	<div class="col-md-2">
								<input type="text" class="form-control" id="IdentiCode" name="IdentiCode">
							</div>
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ItemTypeCheck" name="ItemTypeCheck">종류</label>
						  	</div>
						  	<div class="col-md-2">
								<select class="select2_single form-control" tabindex="-1" id="ItemType" name="ItemType">							
								</select>
							</div>
							
							<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ModelNameCheck" name="ModelNameCheck">모델명</label>
						  	</div>
						 	<div class="col-md-2">
								<input type="text" class="form-control" id="ModelName" name ="ModelName">
							</div>
							<div class="col-md-3">
							
							</div>
						</div>
						
						
						<div class="row" style="height: 44px">
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="LCodeTypeCheck" name ="LCodeTypeCheck">도착위치</label>
						  	</div>
						  	<div class="col-md-2">
								<div class="input-group">
			                       	<select class="select2_single form-control" tabindex="-1" id="arrLCodeType" name="arrLCodeType" >
							      	</select>
							      	<span class="input-group-btn">
			                           	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="hwm102btn01" name="hwm102btn01">검색</button>
			                           	<input type="hidden" id="eBtnValue">
			                        </span>
			                    </div>
							</div>
							<div class="col-md-3 checkbox">
						  		<label><input type="checkbox" id="arrLCode1Check" name="arrLCode1Check">부서 : <span id="arrLCode1Name"></span></label>&nbsp;&nbsp;&nbsp;
						  		<label><input type="checkbox" id="arrLCode2Check" name="arrLCode2Check">사용자 : <span id="arrLCode2Name"></span></label>
						  		<input type="hidden" id="arrLCode1" name="arrLCode1"><input type="hidden" id="arrLCode2" name="arrLCode2">
						  	</div>
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="arrDateCheck" name="arrDateCheck">이동일자</label>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="fromArrDatePicker">
						  			<input type='text' class="form-control" id="arrDateFrom" name="arrDateFrom" data-inputmask="'mask' : '9999.99.99'" />
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="toArrDatePicker">
						  			<input type='text' class="form-control" id="arrDateTo" name="arrDateTo" data-inputmask="'mask' : '9999.99.99'"/>
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-1">
							
							</div>
						</div>
						
					</div>	
				</form>
				
			</div>
		</div>
		
		<div class="x_panel">
			<div class = "x_content">
				<form class="form-horizontal" name="hwm102form02" id ="hwm102form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table bulk_action" style="table-layout: fixed" id="searchHwm102Table">
			            	<thead >
			                	<tr class="headings center">
			                		<th hidden="true">mSeq</th>
			                		<th hidden="true">rSeq</th>
			                		<th width="80px">이동일자</th>
			                		<th width="60px">종류</th>
			                		<th width="140px">모델명</th>
			                		<th width="140px">식별번호</th>
			                		<th width="140px">출발위치</th>
			                		<th width="140px">도착위치</th>
			                		<th width="140px">소속</th>
			                		<th width="500px">메모</th>
			                	</tr>
			                </thead>
			                <tbody id ="searchHwm102TableDetail">
			                
			                
			            	</tbody>
			            </table>
			            <div id="hwm102PagingInfo">
			            </div>
			        </div>
					<input type="hidden" id="pagingLastNum">
					<input type="hidden" id="simRSEQ">
					<input type="hidden" id="simIdentiCode">
				</form>
			</div>
		</div>
		
	</div>
</div>



<script type="text/javascript">

	$(document).ready(function(){
		setSelectBox("ItemType","hwItem");
		setSelectBox("arrLCodeType","lCode");
			
		$("#arrLCodeType").change(function(){
			$("#arrLCode1").val("");
			$("#arrLCode1Name").html("");
			$("#arrLCode2").val("");
			$("#arrLCode2Name").html("");
		})
		
		$("#fromStartDatePicker").datetimepicker({
	 		format:"YYYY.MM.DD"
		});
		
		$("#toStartDatePicker").datetimepicker({
	 		format:"YYYY.MM.DD"
		});
			
		$("#fromArrDatePicker").datetimepicker({
	 		format:"YYYY.MM.DD"
		});
			
		$("#toArrDatePicker").datetimepicker({
	 		format:"YYYY.MM.DD"
		});
		
		$("#startDateFrom").val(getLastMonth());
		$("#startDateTo").val(getSysDate());
	
		$("#arrDateFrom").val(getLastMonth());
		$("#arrDateTo").val(getSysDate());
			
		$("#startDateFrom").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#startDateFrom").blur();
		    }
		});
			
		$("#startDateTo").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#startDateTo").blur();
		    }
		});
		
		$("#arrDateFrom").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#arrDateFrom").blur();
		    }
		});
		
		$("#arrDateTo").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#arrDateTo").blur();
		    }
		});
		//alert("퍄퍅:"+lastMonth());
		$("#searchHwm102TableDetail").on("dblclick","tr",function(event){
			var tr = $(this);
			var td = tr.children();
			
			var rSeq = td.eq(1).text();
			var IdentiCode = td.eq(5).text();
			
			$("#simRSEQ").val(rSeq);
			$("#simIdentiCode").val(IdentiCode);
			if(confirm("해당 자원의 최근 이동내역을 보시겠습니까?")){
				$("#simpleHWMovingHistory").modal();
			}
		});
		
	});
	 	
	function popModalChek(){
		var eObject = event.target;
		$("#eBtnValue").val(eObject.id);
		if(($("#arrLCodeType").val()=="com")||($("#arrLCodeType").val()=="fac")||($("#arrLCodeType").val()=="reg")){
			$("#searchEMP").modal();
		}else if($("#arrLCodeType").val()=="agen"){
			$("#searchTarget").modal();
		}else if($("#arrLCodeType").val()=="etc"){
			$("#searchEtc").modal();
		}else if($("#arrLCodeType").val()=="fetc"){
			$("#searchEtc").modal();
		}else if($("#arrLCodeType").val()=="empty"){
			
		}
	}
	
	function hwm102Search(pNum){
		
		if(pNum==0){
			alert("첫번재 페이지입니다.");
			return false;
		}
		
		if((pNum > $("#pagingLastNum").val())&&(pNum!=undefined) ){
			alert("마지막 페이지입니다.");
			return false;
		}
		
		if(pNum==undefined){
			pNum=1;
 		}
		
		$.ajax({
			type : "post",
			url : "hwm102Search.do",
			data : {
				IdentiCode : document.getElementById("IdentiCodeCheck").checked == true ? $("#IdentiCode").val() :"",
				ItemType : document.getElementById("ItemTypeCheck").checked == true ? $("#ItemType").val() :"",
				ModelName : document.getElementById("ModelNameCheck").checked == true ? $("#ModelName").val() :"",
				arrLCodeType : document.getElementById("LCodeTypeCheck").checked == true ? $("#arrLCodeType").val() :"",
				arrLCode1 : document.getElementById("arrLCode1Check").checked == true ? $("#arrLCode1").val() :"",
				arrLCode2 : document.getElementById("arrLCode2Check").checked == true ? $("#arrLCode2").val() :"",			
				arrDateFrom : document.getElementById("arrDateCheck").checked == true ? $("#arrDateFrom").val() :"",
				arrDateTo : document.getElementById("arrDateCheck").checked == true ? $("#arrDateTo").val() :""
			},
			success : function(searchData){
				if(searchData.length==0){
					PNotifyAlert("info","","결과값이 존재하지 않습니다.");
				}else{
					var str = "";
					var temp="";
					var menuStr="";
			    	$.each(searchData, function(index) {
			    		if(pNum==searchData[index].pagingvo.pageNum){
				    		str += "<tr>";
				    		str += "	<td hidden='true'>"+ searchData[index].mSeq +"</td>";
				    		str += "	<td hidden='true'>"+ searchData[index].rSeq +"</td>";
				    		str += "	<td>"+ searchData[index].arrDate +"</td>";
				    		str += "	<td>"+ searchData[index].itemType +"</td>";
				    		str += "	<td>"+ searchData[index].modelName +"</td>";
				    		str += "	<td>"+ searchData[index].identiCode +"</td>";
				    		str += "	<td>"+ searchData[index].startLCode2Name +"</td>";
				    		str += "	<td>"+ searchData[index].arrLCode2Name +"</td>";
				    		str += "	<td>"+ searchData[index].arrLCode1Name +"</td>";
				    		str += "	<td>"+ searchData[index].note +"</td>";
				    		str += "</tr>";
			    		}
			    		if(searchData[index].pagingvo.pageNum!=temp){
	 			        	temp=searchData[index].pagingvo.pageNum;
	 			        	menuStr += "	    <li class='page-item'><a class='page-link' onclick='hwm102Search("+temp+")'>"+temp+"</a></li>";
	 			        }
			    	});
			    	
			    	var pagingStr="";
			    	pagingStr += "<nav aria-label='Page hwm102'>";
			    	pagingStr += "	  <ul class='pagination justify-content-end'>";
			    	pagingStr += " 	    <li class='page-item'>";
			    	pagingStr += "	      <a class='page-link' href='#' tabindex='-1' onclick='hwm102Search("+(pNum-1)+")' >Previous</a>";
			    	pagingStr += "	    </li>";
			    	pagingStr += menuStr;
			    	pagingStr += "	    <li class='page-item'>";
			    	pagingStr += "	      <a class='page-link' href='#' onclick='hwm102Search("+(pNum+1)+")'>Next</a>";
			    	pagingStr += "	    </li>";
			    	pagingStr += "	  </ul>";
			    	pagingStr += "	</nav>";	
				}
				
				$("#searchHwm102TableDetail").html(str);
				$("#hwm102PagingInfo").html(pagingStr);
				$("#pagingLastNum").val(temp); 
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
		});
		
	}
	
	function hwm102Excel(){
		document.hwm102form01.submit()
	}
	
</script>