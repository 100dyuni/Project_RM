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
		    	<h3>HW 전체조회</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="hwm101Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<button class="btn btn-dark" type="button" onclick="hwm101Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
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
				<form class="form-horizontal" name="hwm101form01" id ="hwm101form01" method="get" action="hwm101Excel.do" accept-charset="utf-8">
					<div class="form-group">
					
						<div class="row" style="height: 44px">
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ItemTypeCheck" name="ItemTypeCheck" checked="checked">종류</label>
						  	</div>
						  	<div class="col-md-2">
								<select class="select2_single form-control" tabindex="-1" id="ItemType" name="ItemType">							
								</select>
							</div>
							
							<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ItemStatusCheck" name="ItemStatusCheck">상태</label>
						  	</div>
						  	<div class="col-md-2">
						  		<select class="select2_single form-control" tabindex="-1" id="ItemStatus" name="ItemStatus">							
								</select>
						  	</div>
						  	
							<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ModelNameCheck" name="ModelNameCheck">모델명</label>
						  	</div>
						 	<div class="col-md-2">
								<input type="text" class="form-control" id="ModelName" name ="ModelName">
							</div>
							
							<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="IdentiCodeCheck" name="IdentiCodeCheck">식별번호</label>
						  	</div>
						  	<div class="col-md-2">
								<input type="text" class="form-control" id="IdentiCode" name="IdentiCode">
							</div>
						</div>
						
						<div class="row" style="height: 44px">
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="LCodeTypeCheck" name ="LCodeTypeCheck">위치</label>
						  	</div>
						  	<div class="col-md-2">
								<div class="input-group">
			                       	<select class="select2_single form-control" tabindex="-1" id="LCodeType" name="LCodeType" >
							      	</select>
							      	<span class="input-group-btn">
			                           	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="hwm101btn01" name="hwm101btn01">검색</button>
			                           	<input type="hidden" id="eBtnValue">
			                        </span>
			                    </div>
							</div>
							<div class="col-md-3 checkbox">
						  		<label><input type="checkbox" id="LCode1Check" name="LCode1Check">부서 : <span id="LCode1Name"></span></label>&nbsp;&nbsp;&nbsp;
						  		<label><input type="checkbox" id="LCode2Check" name="LCode2Check">사용자 : <span id="LCode2Name"></span></label>
						  		<input type="hidden" id="LCode1" name="LCode1"><input type="hidden" id="LCode2" name="LCode2">
						  	</div>
						  	
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="NoteCheck" name="NoteCheck">메모</label>
						  	</div>
						  	<div class="col-md-2">
						  		<input type="text" class="form-control" id="Note" name ="Note">
						  	</div>
						  	
						</div>
						
						<div class="row" style="height: 44px"> 
							<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ManufacCheck" name="ManufacCheck">제조사</label>
						  	</div>
						  	<div class="col-md-2">
						  		<select class="select2_single form-control" tabindex="-1" id="Manufac" name="Manufac">							
								</select>
						  	</div>
						  	 	
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ProductDateCheck" name="ProductDateCheck">제조년월</label>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="fromProDatePicker">
						  			<input type='text' class="form-control" id="ProductDateFrom" name="ProductDateFrom" data-inputmask="'mask' : '9999.99.99'" />
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="toProDatePicker">
						  			<input type='text' class="form-control" id="ProductDateTo" name="ProductDateTo" data-inputmask="'mask' : '9999.99.99'"/>
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-1">
						  		
						  	</div>
						  	
						</div>
						
						<div class="row" style="height: 44px">
						  	
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="purNumCheck" name="purNumCheck">구매품의번호</label>
						  	</div>
						  	<div class="col-md-2">
						  		<input type="text" class="form-control" id="purNum" name ="purNum">
						  	</div>
						  	
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="PurDateCheck" name="PurDateCheck">구매년월</label>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="PurDateFromPicker">
						  			<input type='text' class="form-control" id="PurDateFrom" name="PurDateFrom" data-inputmask="'mask' : '9999.99.99'"/>
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="PurDateToPicker">
						  			<input type='text' class="form-control" id="PurDateTo" name="PurDateTo" data-inputmask="'mask' : '9999.99.99'"/>
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-1">
						  	</div>
						  	<div class="col-md-1 checkbox">
						  		<label>정렬</label>
						  	</div>
						  	<div class="col-md-1">
						  		<select class="select2_single form-control" tabindex="-1" id="orderByCol" name="orderByCol" >
						  			<option value="ItemType">종류</option>
									<option value="Manufac">제조사</option>
									<option value="ModelName">모델명</option>
									<option value="LCode1Name">위치</option>
									<option value="LCode2Name">사용자</option>
									<option value="ItemStatus">상태</option>
									<option value="productDate">제조년월</option>
									<option value="IdentiCode">식별번호</option>
									<option value="purNum">구매품의</option>
									<option value="purDate">구매년월</option>
									<option value="Note">메모</option>
							    </select>
						  	</div>
						  	<div class="col-md-1">
						  		<select class="select2_single form-control" tabindex="-1" id="orderByType" name="orderByType" >
							  		<option value="ASC">오름차순</option>
							  		<option value="DESC">내림차순</option>
						  		</select>
						  	</div>
						  	
						 </div>
					</div>
				</form>
				
			</div>
		</div>
		
		<div class="x_panel">
			<div class = "x_content">
				<form class="form-horizontal">
					<div class="col-md-4">
						<label><h2><span id="searchResultInfo" ></span></h2>  </label>
					</div>
				</form>
				
				<form class="form-horizontal" name="hwm101form02" id ="hwm101form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table bulk_action" style="table-layout: fixed" id="searchHwm101Table">
			            	<thead >
			                	<tr class="headings center">
			                		<th hidden="true">rSeq</th>
			                		<th width="60px">종류</th>
			                		<th width="60px">제조사</th>
			                		<th width="140px">모델명</th>
			                		<th width="140px">위치</th>
			                		<th width="80px">사용자</th>
			                		<th width="100px">상태</th>
			                		<th width="100px">제조년월</th>
			                		<th width="140px">식별번호</th>
			                		<th width="120px">구매품의</th>
			                		<th width="100px">구매년월</th>
			                		<th width="500px">메모</th>
			                	</tr>
			                </thead>
			                <tbody id ="searchHwm101TableDetail">
			                
			                
			            	</tbody>
			            </table>
			            <div id="hwm101PagingInfo">
			            </div>
			        </div>
					<input type="hidden" id="pagingLastNum">
				</form>
				<!-- <button class="btn btn-default source" onclick="PNotifyAlert('success','배가너무고파','두레촌!!')">Success</button>
				<button class="btn btn-default source" onclick="PNotifyAlert('info','배가너무고파','두레촌!!')">info</button>
				<button class="btn btn-default source" onclick="PNotifyAlert('warning','배가너무고파','두레촌!!')">warning</button>
				<button class="btn btn-default source" onclick="PNotifyAlert('error','배가너무고파','두레촌!!')">error</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Modal</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#alertModal" data-whatever="에고공" data-t1="벅!!!!!!!!!팬!!!!!!!">ModalTest</button> -->
				<!-- alertTest PNotifyAlert -->
			</div>
		</div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		setSelectBox("ItemType","hwItem");
		setSelectBox("Manufac","hwManufac");
		setSelectBox("ItemStatus","hwStatus");
		setSelectBox("LCodeType","lCode");
		
		$("#LCodeType").change(function(){
			$("#LCode1").val("");
			$("#LCode1Name").html("");
			$("#LCode2").val("");
			$("#LCode2Name").html("");
		})
		
		$("#fromProDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		$("#toProDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		$("#PurDateFromPicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		$("#PurDateToPicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		
		$("#ProductDateFrom").val(getLastYear());
		$("#ProductDateTo").val(getSysDate());

		$("#PurDateFrom").val(getLastYear());
		$("#PurDateTo").val(getSysDate());
		
		$("#orderByCol").val("productDate");
		
		$("#ProductDateFrom").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#ProductDateFrom").blur();
		    }
		});
		
		$("#ProductDateTo").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#ProductDateTo").blur();
		    }
		});
		
		$("#PurDateFrom").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#PurDateFrom").blur();
		    }
		});
		
		$("#PurDateTo").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#PurDateTo").blur();
		    }
		});
		
		$("#searchHwm101TableDetail").on("dblclick","tr",function(event){
			var tr = $(this);
			var td = tr.children();
			
			var rSeq = td.eq(0).text();
			var IdentiCode = td.eq(8).text();
				
			if(confirm("상세페이지로 이동하시겠습니까?")){
				location.href="hwm101DetailSearch.do?rSeq="+rSeq+"&IdentiCode="+IdentiCode;
			}
		});
		
		/* $("#alertModal").on("hide.bs.modal", function (e) {
			var eObject = event.target;
			console.log(eObject.id);
		}); */
		
 	});
 		
	function popModalChek(){
 		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		
 		if(($("#LCodeType").val()=="com")||($("#LCodeType").val()=="fac")||($("#LCodeType").val()=="reg")){
 			$("#searchEMP").modal();
 		}else if($("#LCodeType").val()=="agen"){
 			$("#searchTarget").modal();
 		}else if($("#LCodeType").val()=="etc"){
 			$("#searchEtc").modal();
 		}else if($("#LCodeType").val()=="fetc"){
 			$("#searchEtc").modal();
 		}
 	}
	
	function hwm101Search(pNum){
		
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
		
		var str="";
		$.ajax({
			type : "post",
			url : "hwm101Search.do",
			data : {
				ItemType : document.getElementById("ItemTypeCheck").checked == true ? $("#ItemType").val() :"",
				ItemStatus : document.getElementById("ItemStatusCheck").checked == true ? $("#ItemStatus").val() :"",
				ModelName : document.getElementById("ModelNameCheck").checked == true ? $("#ModelName").val() :"",
				IdentiCode : document.getElementById("IdentiCodeCheck").checked == true ? $("#IdentiCode").val() :"",
				LCodeType : document.getElementById("LCodeTypeCheck").checked == true ? $("#LCodeType").val() :"",
				LCode1 : document.getElementById("LCode1Check").checked == true ? $("#LCode1").val() :"",
				LCode2 : document.getElementById("LCode2Check").checked == true ? $("#LCode2").val() :"",
				Note : document.getElementById("NoteCheck").checked == true ? $("#Note").val() :"",
				Manufac : document.getElementById("ManufacCheck").checked == true ?	$("#Manufac").val() :"",	
				productDateFrom : document.getElementById("ProductDateCheck").checked == true ? $("#ProductDateFrom").val() :"",
				productDateTo : document.getElementById("ProductDateCheck").checked == true ? $("#ProductDateTo").val() :"",				
				purNum : document.getElementById("purNumCheck").checked == true ? $("#purNum").val() :"",
				purDateFrom : document.getElementById("PurDateCheck").checked == true ? $("#PurDateFrom").val() :"",
				purDateTo : document.getElementById("PurDateCheck").checked == true ? $("#PurDateTo").val() :"",
				sort :  $("#orderByCol").val() + " " + $("#orderByType").val()
			},
			success : function(searchData){
				
				if(searchData.length==0){
					PNotifyAlert("info","","결과값이 존재하지 않습니다.");
					
				}else{
					//str = "";
					var temp="";
					var menuStr="";
			    	$.each(searchData, function(index) {
			    		if(pNum==searchData[index].pagingvo.pageNum){
				    		str += "<tr>";
				    		str += "	<td hidden='true'>"+ searchData[index].rSeq +"</td>";
				    		str += "	<td>"+ searchData[index].itemType +"</td>";
				    		str += "	<td>"+ searchData[index].manufac +"</td>";
				    		str += "	<td>"+ searchData[index].modelName +"</td>";
				    		str += "	<td>"+ searchData[index].lcode1Name +"</td>";
				    		str += "	<td>"+ searchData[index].lcode2Name +"</td>";
				    		str += "	<td>"+ searchData[index].itemStatus +"</td>";
				    		str += "	<td>"+ searchData[index].productDate +"</td>";
				    		str += "	<td>"+ searchData[index].identiCode +"</td>";
				    		str += "	<td>"+ searchData[index].purNum +"</td>";
				    		str += "	<td>"+ searchData[index].purDate +"</td>";
				    		str += "	<td>"+ searchData[index].note +"</td>";
				    		str += "</tr>";
				    		//console.log(searchData[index].note);
			    		}
			    		
			    		if(searchData[index].pagingvo.pageNum!=temp){
	 			        	temp=searchData[index].pagingvo.pageNum;
	 			        	menuStr += "	    <li class='page-item'><a class='page-link' onclick='hwm101Search("+temp+")'>"+temp+"</a></li>";
	 			        }
			    	});
			    	
			    	var pagingStr="";
			    	pagingStr += "<nav aria-label='Page hwm101'>";
			    	pagingStr += "	  <ul class='pagination justify-content-end'>";
			    	pagingStr += " 	    <li class='page-item'>";
			    	pagingStr += "	      <a class='page-link' href='#' tabindex='-1' onclick='hwm101Search("+(pNum-1)+")' >Previous</a>";
			    	pagingStr += "	    </li>";
			    	pagingStr += menuStr;
			    	pagingStr += "	    <li class='page-item'>";
			    	pagingStr += "	      <a class='page-link' href='#' onclick='hwm101Search("+(pNum+1)+")'>Next</a>";
			    	pagingStr += "	    </li>";
			    	pagingStr += "	  </ul>";
			    	pagingStr += "	</nav>";
			    	
			    	$("#searchHwm101TableDetail").html(str);
					$("#hwm101PagingInfo").html(pagingStr);
					$("#pagingLastNum").val(temp);
					$("#searchResultInfo").html("현재 페이지 : "+ pNum +" of "+ temp+"&nbsp;&nbsp; 조회 결과 : "+searchData.length+" 건");
					
				}
				
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
		
	}

	function hwm101Excel(){
		document.hwm101form01.submit();	
	}
	
	
	
	
</script>