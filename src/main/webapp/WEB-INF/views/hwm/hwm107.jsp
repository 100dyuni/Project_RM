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
		    	<h3>연차별 자산 리스트</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="hwm107Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<button class="btn btn-dark" type="button" onclick="hwm107Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
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
				<form class="form-horizontal" name="hwm107form01" id ="hwm107form01" method="get" action="hwm107Excel.do" accept-charset="utf-8">
					<div class="form-group">
						<div class="col-md-1 col-xs-10">
							<label class="control-label">연차</label>
						</div>
						<div class="col-md-2 col-xs-10">
							<select class="select2_single form-control"  id="fromYears" name="fromYears" >
								<option value="1">1 년차</option>
								<option value="2">2 년차</option>
								<option value="3">3 년차</option>
								<option value="4">4 년차</option>
								<option value="5">5 년차</option>
								<option value="6">6 년차</option>
								<option value="7">7 년차</option>
								<option value="8">8 년차</option>
						    </select>
						</div>
						<div class="col-md-2 col-xs-10">
							<select class="select2_single form-control" tabindex="-1" id="toYears" name="toYears" >
								<option value="">이상</option>
								<option value="1">1 년차</option>
								<option value="2">2 년차</option>
								<option value="3">3 년차</option>
								<option value="4">4 년차</option>
								<option value="5">5 년차</option>
								<option value="6">6 년차</option>
								<option value="7">7 년차</option>
								<option value="8">8 년차</option>
						    </select>
						</div>
						<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="ItemTypeCheck" name="ItemTypeCheck" >종류</label>
						</div>
						<div class="col-md-2">
							<select class="select2_single form-control" tabindex="-1" id="ItemType" name="ItemType">							
							</select>
						</div>
							
					</div>
					
					<div class="form-group">
						<div class="col-md-1 col-xs-10">
							<label class="control-label">조직 구분</label>
						</div>
						<div class="col-md-2 col-xs-10">
							<div class="input-group">
								<select class="select2_single form-control" tabindex="-1" id="orgFlag" name="orgFlag" >
						      	</select>
						      	<span class="input-group-btn">
			                       	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="hwm107btn01" name="hwm107btn01">검색</button>
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
					</div>
					
				</form>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="x_panel">
			<div class = "x_content" >
				<form class="form-horizontal">
					<div class ="col-md-4">
						<label><h2><span id="searchResultInfo"></span></h2></label>
					</div>	
				</form>
				<form class="form-horizontal" name="hwm107form02" id ="hwm107form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table bulk_action" style="table-layout: fixed" id="searchhwm107Table" >
			            	<thead >
			                	<tr class="headings center" >
			                		<th hidden="true">rSeq</th>
			                		<th width="60px">연차</th>
			                		<th width="80px">종류</th>
			                		<th width="60px">제조사</th>
			                		<th width="140px">모델명</th>
			                		<th width="140px">위치</th>
			                		<th width="80px">사용자</th>
			                		<th width="100px">상태</th>
			                		<th width="100px">제조년월</th>
			                		<th width="140px">식별번호</th>
			                	</tr>
			                </thead>
			                <tbody id ="hwm107ReportTable">
			            	</tbody>
			            </table>
			            <div id="hwm107PagingInfo">
			            </div>
			        </div>
			        <input type="hidden" id="pagingLastNum" name="pagingLastNum">
				</form>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		setSelectBox("orgFlag","orgFlag");
		setSelectBox("ItemType","hwItem");
		$("#fromYears").val(4);
		
		$("#hwm107ReportTable").on("dblclick","tr",function(event){
			var tr = $(this);
			var td = tr.children();
			
			var rSeq = td.eq(0).text();
			var IdentiCode = td.eq(9).text();
				
			if(confirm("상세페이지로 이동하시겠습니까?")){
				location.href="hwm101DetailSearch.do?rSeq="+rSeq+"&IdentiCode="+IdentiCode;
			}
		});
		
		
 	});
 	
	function popModalChek(){
		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		$("#orgListModal").modal();
	}
	
	function hwm107Search(pNum){

		if(pNum==0){
			//alert("첫번재 페이지입니다.");
			PNotifyAlert("info","","첫번째 페이지입니다.");
			return false;
		}
		
		if((pNum > $("#pagingLastNum").val())&&(pNum!=undefined) ){
			PNotifyAlert("info","","마지막 페이지입니다.");
			//alert("마지막 페이지입니다.");
			return false;
		}
		
		if(pNum==undefined){
			pNum=1;
 		}
		if(($("#toYears").val() !="")&&($("#fromYears").val() > $("#toYears").val())){
			PNotifyAlert("info","","연차 설정을 확인해 주시기 바랍니다..");
			return false;
		}
		
		var str="";
		var temp="";
		var menuStr="";
		var pagingStr="";
		$.ajax({
			type : "post",
			url : "hwm107Search.do",
			data : {
				fromYears 	: $("#fromYears").val(),
				toYears		: $("#toYears").val(),
				orgFlag 	: $("#orgFlag").val(),
				ItemType 	: document.getElementById("ItemTypeCheck").checked == true ? $("#ItemType").val() :"",
				highOrgCode : document.getElementById("divisionCheck").checked == true ? $("#highOrgCode").val() :"",
				lowOrgCode 	: document.getElementById("teamCheck").checked == true ? $("#lowOrgCode").val() :""
			},
			success : function(searchData){
				if(searchData.length==0){
					PNotifyAlert("info","","결과값이 존재하지 않습니다.");
				}else{
					
					$.each(searchData, function(index) {
						if(pNum==searchData[index].pageNum){
							str += "<tr>";	
							str += "	<td hidden='true'>"+ searchData[index].rSeq +"</td>";
					    	str += "	<td>"+ searchData[index].years +"</td>";
					    	str += "	<td>"+ searchData[index].ItemType +"</td>";
					    	str += "	<td>"+ searchData[index].Manufac +"</td>";
					    	str += "	<td>"+ searchData[index].ModelName +"</td>";
					    	str += "	<td>"+ searchData[index].lowOrgName +"</td>";
					    	str += "	<td>"+ searchData[index].LCode2Name +"</td>";
					    	str += "	<td>"+ searchData[index].ItemStatus +"</td>";
					    	str += "	<td>"+ searchData[index].productDate +"</td>";
					    	str += "	<td>"+ searchData[index].IdentiCode +"</td>";
					    	str += "</tr>";
						}
						
						if(searchData[index].pageNum != temp){
							temp=searchData[index].pageNum;
							menuStr += "	    <li class='page-item'><a class='page-link' onclick='hwm107Search("+temp+")'>"+temp+"</a></li>";
						}
						
			    	});
					
					var pagingStr="";
			    	pagingStr += "<nav aria-label='Page hwm107'>";
			    	pagingStr += "	  <ul class='pagination justify-content-end'>";
			    	pagingStr += " 	    <li class='page-item'>";
			    	pagingStr += "	      <a class='page-link' href='#' tabindex='-1' onclick='hwm107Search("+(pNum-1)+")' >Previous</a>";
			    	pagingStr += "	    </li>";
			    	pagingStr += menuStr;
			    	pagingStr += "	    <li class='page-item'>";
			    	pagingStr += "	      <a class='page-link' href='#' onclick='hwm107Search("+(pNum+1)+")'>Next</a>";
			    	pagingStr += "	    </li>";
			    	pagingStr += "	  </ul>";
			    	pagingStr += "	</nav>";
					
			    	$("#hwm107ReportTable").html(str);	
			    	$("#hwm107PagingInfo").html(pagingStr);
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

	function hwm107Excel(){
		document.hwm107form01.submit();	
	}
	
</script>