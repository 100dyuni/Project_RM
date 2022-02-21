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
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>

<div class="">
	<div class="">
		<div class="page-title">
			<div class="title_left">
		    	<h3>폐기리스트 작성</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
			            		<button class="btn btn-dark" type="button" onclick="initHwm004()"><i class="fa fa-file-o">&nbsp;&nbsp;신규</i></button>
			                    <button class="btn btn-dark" type="button" onclick="saveHwm004()"><span class="fa fa fa-save">&nbsp;&nbsp;저장</button>
		                    </span>
		            	
		                	<!-- <button class="btn btn-dark" type="button" onclick="porceHwm004()"><i class="fa fa-trash"></i>&nbsp;&nbsp;폐기</button> -->
		                </span>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>폐기리스트 정보</h2>
						<!-- <ul class="nav navbar-right panel_toolbox">
	                    	<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
	                    </ul> -->
	                    <div class="clearfix"></div>
					</div>
					<div class="x_content">
						<form id="hwm004form1" name="hwm004form1" data-parsley-validate class="form-horizontal form-label-left">
							<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-10 control-label">제목</label>
								<div class="col-md-5 col-sm-5 col-xs-12">
									<input type="text" class="form-control" id="disListTitle" name="disListTitle">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 col-sm-3 col-xs-10 control-label">작성일자</label>
							  	<div class="col-md-5 col-sm-5 col-xs-12">
							  		<div class="input-group date" id="disDatePicker">
							  			<input type='text' class="form-control" id="inputDate" name="inputDate" data-inputmask="'mask' : '9999.99.99'" readonly="readonly"/>
					                    <span class="input-group-addon" >
					                    	<span class="glyphicon glyphicon-calendar"></span>
					                    </span>
							  		</div>
							 	</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
        	<div class="col-md-8 col-xs-12">
            	<div class="x_panel" >
                	<div class="x_title">
                		<div class="title_left">
                			<h2>폐기대상</h2>
                		</div>
                		<div class="title_right">
                			<h3><span id="totListCnt" name="totListCnt" class="pull-right"></span></h3>
                		</div>
                		
                		<div class="clearfix"></div>
                	</div>
                	<div class="x_content">
                		<div>
                			<input type="hidden" id="tdInfoRSeq" name="tdInfoRSeq">
                			<input type="hidden" id="tdInfoIdenti" name="tdInfoIdenti">
                		</div>
	                	<!--아코디언  -->
	                	<div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
	                    	<div class="panel">
		                        <a class="panel-heading" role="tab" id="headingOne1" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne">
		                        	<h4 class="panel-title">PC List<small><span id="pcListCnt" name="pcListCnt" class="pull-right"></span></small></h4>      	
		                        </a>
		                        <div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
		                        	<div class="panel-body">
		                        		<button class="btn btn-dark" type="button" onclick="addPcList()"><i class="fa fa-plus"></i>&nbsp;&nbsp;폐기리스트 추가</button>
		                        		<input type="hidden" id="pcListChoicePage" name="pcListChoicePage">
					                	<input type="hidden" id="pcListLastPage" name="pcListLastPage">
					                	<input type="hidden" id="pcListLength" name="pcListLength">
		                            	<div class="table-responsive">
					                		<table class="table table-striped jambo_table" style="table-layout: fixed" id="pcListTable" name="pcListTable">
	                        					<thead>
				                          			<tr class="headings" >
					                            		<th class="column-title" width="40px" hidden="hidden">rSeq</th>
							                            <th class="column-title" width="50px" hidden="hidden">구분 </th>
							                            <th class="column-title" width="60px">제조사</th>
							                            <th class="column-title" width="100px">모델명</th>
							                            <th class="column-title" width="100px">제조년월</th>
							                            <th class="column-title" width="100px">현위치</th>
							                            <th class="column-title" width="160px">마지막사용자</th>
							                            <th class="column-title" width="160px">식별번호</th>
							                            <th class="column-title" width="100px">상태</th>
							                            <th class="column-title" width="500px">비고</th>
							                        </tr>
	                        					</thead>
						                        <tbody id="pcListTableDetail">
						                        </tbody>
	                      					</table>
					                      	<div id="pcListInfo">
					                      	
					                      	</div>
	                    				</div>
		                          	</div>
		                        </div>
	                      </div>
	                      <div class="panel">
	                      	<a class="panel-heading collapsed" role="tab" id="headingTwo1" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1" aria-expanded="false" aria-controls="collapseTwo">
	                        	<h4 class="panel-title">모니터 List<small><span id="monListCnt" name="monListCnt" class="pull-right"></span></small></h4>
	                        </a>
	                        <div id="collapseTwo1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
	                        	<div class="panel-body">
	                            	<button class="btn btn-dark" type="button" onclick="addMonList()"><i class="fa fa-plus"></i>&nbsp;&nbsp;폐기리스트 추가</button>
		                        	<input type="hidden" id="monListChoicePage" name="monListChoicePage">
					                <input type="hidden" id="monListLastPage" name="monListLastPage">
					                <input type="hidden" id="monListLength" name="monListLength">
		                            <div class="table-responsive">
					                	<table class="table table-striped jambo_table" style="table-layout: fixed" id="monListTable" name="monListTable" >
	                        				<thead>
				                         		<tr class="headings" >
						                        	<th class="column-title" width="40px" hidden="hidden">rSeq</th>
							                        <th class="column-title" width="50px" hidden="hidden">구분 </th>
							                        <th class="column-title" width="60px">제조사</th>
							                        <th class="column-title" width="100px">모델명</th>
							                        <th class="column-title" width="100px">제조년월</th>
							                        <th class="column-title" width="100px">현위치</th>
							                        <th class="column-title" width="160px">마지막사용자</th>
							                        <th class="column-title" width="160px">식별번호</th>
							                        <th class="column-title" width="100px">상태</th>
							                        <th class="column-title" width="500px">비고</th>
							                    </tr>
	                        				</thead>
						                    <tbody id="monListTableDetail">
						                    </tbody>
	                      				</table>
					                    <div id="monListInfo">
					                      	
					                    </div>
	                    			</div>
								</div>
	                        </div>
	                      </div>
	                      <div class="panel">
	                      	<a class="panel-heading collapsed" role="tab" id="headingThree1" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1" aria-expanded="false" aria-controls="collapseThree">
	                        	<h4 class="panel-title">기타 List (프린트, 노트북)<small><span id="etcListCnt" name="etcListCnt" class="pull-right"></span></small></h4>
	                        </a>
	                       	<div id="collapseThree1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
	                        	<div class="panel-body">
	                            	<button class="btn btn-dark" type="button" onclick="addPrtList()"><i class="fa fa-plus"></i>&nbsp;&nbsp;폐기리스트 추가</button>
		                        	<input type="hidden" id="etcListChoicePage" name="etcListChoicePage">
					                <input type="hidden" id="etcListLastPage" name="etcListLastPage">
					                <input type="hidden" id="etcListLength" name="etcListLength">
		                            <div class="table-responsive">
					                	<table class="table table-striped jambo_table" style="table-layout: fixed" id="prtListTable" name="prtListTable">
	                        				<thead>
				                         		<tr class="headings" >
						                        	<th class="column-title" width="40px" hidden="hidden">rSeq</th>
							                        <th class="column-title" width="50px" hidden="hidden">구분 </th>
							                        <th class="column-title" width="60px">제조사</th>
							                        <th class="column-title" width="100px">모델명</th>
							                        <th class="column-title" width="100px">제조년월</th>
							                        <th class="column-title" width="100px">현위치</th>
							                        <th class="column-title" width="160px">마지막사용자</th>
							                        <th class="column-title" width="160px">식별번호</th>
							                        <th class="column-title" width="100px">상태</th>
							                        <th class="column-title" width="500px">비고</th>
							                    </tr>
	                        				</thead>
						                    <tbody id="prtListTableDetail">
						                    </tbody>
	                      				</table>
					                    <div id="etcListInfo">
					                      	
					                    </div>
	                    			</div>
	                            </div>
	                      	</div>
	                      </div>
	                    </div>
	                    <!--아코디언  -->
	                </div>
                </div>
                
        	</div>
        	<div class="col-md-4 col-xs-12">
            	<div class="x_panel">
                	<div class="x_title">
                		<h2>폐기대상 리스트</h2>
                		<div class="clearfix"></div>
                	</div>
                	<div class="x_content">
                		<!-- <div class="table-responsive"> -->
                			<table class="table table-bordered">
                				<tr>
                					<th class="column-title" width="100px" height="65px"><h2>PC</h2></th>
                					<td><h2><span id="targetPcCnt"></span></h2></td>
                				</tr>
                				<tr>
                					<th class="column-title" width="100px" height="65px"><h2>모니터</h2></th>
                					<td><h2><span id="targetMonCnt"></span></h2></td>
                				</tr>
                				<tr>
                					<th class="column-title" width="100px" height="65px"><h2>기타</h2></th>
                					<td><h2><span id="targetPrtCnt"></span></h2></td>
                				</tr>
                				<tr>
                					<th class="column-title" width="100px" height="65px"><h2>합계</h2></th>
                					<td><h2><span id="targetTotCnt"></span></h2></td>
                				</tr>
                				
                			</table>
                		<!-- </div> -->
	            	</div>
                </div>
        	</div>
        </div>
		<!-- <div class="row">
        	
        </div> -->
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		searchDiscardList();
		
		$("#disDatePicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		
		$("#inputDate").val(getSysDate());
		
		$("#pcListTableDetail").on('click','tr', function(event){
			var tr = $(this);
			var td = tr.children();
			var rSeq = td.eq(0).text();
			var IdentiCode = td.eq(7).text();
			
			$("#tdInfoRSeq").val(rSeq);
			$("#tdInfoIdenti").val(IdentiCode);
			
			$("#simpleProductInfo").modal();
		});
		
		$("#monListTableDetail").on('click','tr', function(event){
			var tr = $(this);
			var td = tr.children();
			var rSeq = td.eq(0).text();
			var IdentiCode = td.eq(7).text();
			
			$("#tdInfoRSeq").val(rSeq);
			$("#tdInfoIdenti").val(IdentiCode);
			
			$("#simpleProductInfo").modal();
		});
		
		$("#prtListTableDetail").on('click','tr', function(event){
			var tr = $(this);
			var td = tr.children();
			var rSeq = td.eq(0).text();
			var IdentiCode = td.eq(7).text();
			
			$("#tdInfoRSeq").val(rSeq);
			$("#tdInfoIdenti").val(IdentiCode);
			
			$("#simpleProductInfo").modal();
		});
 	});
	
 	function searchDiscardList(){
 		totListCnt();
 		pcList();
 		monList();
 		etcList();
 	}
 	
	function pcList(pageNum){
		if(pageNum==0){
			alert("첫번재 페이지입니다.");
			return false;
		}
		
		if((pageNum > $("#pcListLastPage").val())&&(pageNum!=undefined) ){
			alert("마지막 페이지입니다.");
			return false;
		}
		
		if(pageNum==undefined){
 			pageNum=1;
 		}
		
 		$.ajax({
 			type : "post",
 			async : true,
 			url : "discardTargetList.do",
 			data : "ItemType=PC",
 			success : function(data){
 				var str="";
 				var temp="";
 				var menuStr="";
 				$.each(data, function(index) {	
 					if(pageNum==data[index].pagingvo.pageNum){
 						str += "<tr class='odd pointer'>";
 	 					str += "    <td hidden='hidden'>" +data[index].rSeq +"</td>";
 	 					str += "    <td hidden='hidden'>" +data[index].itemType +"</td>";
 	 					str += "    <td>" +data[index].manufac +"</td>";
 	 					str += "    <td>" +data[index].modelName +"</td>";
 	 					str += "    <td>" +data[index].productDate +"</td>";
 	 			        str += "    <td>" +data[index].lcode1Name +"</td>";
 	 					str += "    <td>" +data[index].preUsr +"</td>";
 	 					str += "    <td>" +data[index].identiCode +"</td>";
 	 					str += "    <td>" +data[index].itemStatus +"</td>";
 	 			        str += "    <td>" +data[index].note +"</td>";
 	 			        str += "</tr>"
 					}
 					
 					if(data[index].pagingvo.pageNum!=temp){
 			        	temp=data[index].pagingvo.pageNum;
 			        	menuStr +="<a href='#' onClick='pcList("+temp+")'>"+temp+"</a></span> ";
 			        }
 				})
 				$("#pcListTableDetail").html(str); 
 				
 				var infoStr="";
 				infoStr += "<a href='#' onClick='pcList(1)'>[처음]</a>";
 				infoStr += "<a href='#' onClick='pcList("+(pageNum-1)+")'>[이전]</a>"; 
 				infoStr += menuStr;
 				infoStr += "<a href='#' onClick='pcList("+(pageNum+1) +")'>[다음]</a>";
 				infoStr += "<a href='#' onClick='pcList("+temp+")'>[끝]</a>";
 				
 				$("#pcListInfo").html(infoStr);
 				$("#pcListChoicePage").val(pageNum);
 				$("#pcListLastPage").val(temp);
 				$("#pcListLength").val(data.length);
 				$("#pcListCnt").html(data.length);
 				
 			},
	 		error : function(request, error){
	 			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			alert("검색을 실패하였습니다..");
	 		}
 		})
	}
	
	function monList(pageNum){
		if(pageNum==0){
			alert("첫번재 페이지입니다.");
			return false;
		}
		
		if((pageNum > $("#monListLastPage").val())&&(pageNum!=undefined) ){
			alert("마지막 페이지입니다.");
			return false;
		}
		
		if(pageNum==undefined){
 			pageNum=1;
 		}
		
 		$.ajax({
 			type : "post",
 			async : true,
 			url : "discardTargetList.do",
 			data : "ItemType=Mon",
 			success : function(data){
 				var str="";
 				var temp="";
 				var menuStr="";
 				$.each(data, function(index) {	
 					if(pageNum==data[index].pagingvo.pageNum){
 						str += "<tr class='odd pointer'>";
 	 					str += "    <td hidden='hidden'>" +data[index].rSeq +"</td>";
 	 					str += "    <td hidden='hidden'>" +data[index].itemType +"</td>";
 	 					str += "    <td>" +data[index].manufac +"</td>";
 	 					str += "    <td>" +data[index].modelName +"</td>";
 	 					str += "    <td>" +data[index].productDate +"</td>";
 	 			        str += "    <td>" +data[index].lcode1Name +"</td>";
 	 					str += "    <td>" +data[index].preUsr +"</td>";
 	 					str += "    <td>" +data[index].identiCode +"</td>";
 	 					str += "    <td>" +data[index].itemStatus +"</td>";
 	 			        str += "    <td>" +data[index].note +"</td>";
 	 			        str += "</tr>"
 					}
 					
 					if(data[index].pagingvo.pageNum!=temp){
 			        	temp=data[index].pagingvo.pageNum;
 			        	menuStr +="<a href='#' onClick='monList("+temp+")'>"+temp+"</a></span> ";
 			        }
 				})
 				$("#monListTableDetail").html(str); 
 				
 				var infoStr="";
 				infoStr += "<a href='#' onClick='monList(1)'>[처음]</a>";
 				infoStr += "<a href='#' onClick='monList("+(pageNum-1)+")'>[이전]</a>"; 
 				infoStr += menuStr;
 				infoStr += "<a href='#' onClick='monList("+(pageNum+1) +")'>[다음]</a>";
 				infoStr += "<a href='#' onClick='monList("+temp+")'>[끝]</a>";
 				
 				$("#monListInfo").html(infoStr);
 				$("#monListChoicePage").val(pageNum);
 				$("#monListLastPage").val(temp);
 				$("#monListLength").val(data.length);
 				$("#monListCnt").html(data.length);
 				
 			},
	 		error : function(request, error){
	 			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			alert("검색을 실패하였습니다..");
	 		}
 		})
		
	}

	function etcList(pageNum){
		if(pageNum==0){
			alert("첫번재 페이지입니다.");
			return false;
		}
		
		if((pageNum > $("#etcListLastPage").val())&&(pageNum!=undefined) ){
			alert("마지막 페이지입니다.");
			return false;
		}
		
		if(pageNum==undefined){
 			pageNum=1;
 		}
		
 		$.ajax({
 			type : "post",
 			async : true,
 			url : "discardEtcTargetList.do",
 			/* data : "ItemType=PRT", */
 			success : function(data){
 				var str="";
 				var temp="";
 				var menuStr="";
 				$.each(data, function(index) {	
 					if(pageNum==data[index].pagingvo.pageNum){
 						str += "<tr class='odd pointer'>";
 	 					str += "    <td hidden='hidden'>" +data[index].rSeq +"</td>";
 	 					str += "    <td hidden='hidden'>" +data[index].itemType +"</td>";
 	 					str += "    <td>" +data[index].manufac +"</td>";
 	 					str += "    <td>" +data[index].modelName +"</td>";
 	 					str += "    <td>" +data[index].productDate +"</td>";
 	 			        str += "    <td>" +data[index].lcode1Name +"</td>";
 	 					str += "    <td>" +data[index].preUsr +"</td>";
 	 					str += "    <td>" +data[index].identiCode +"</td>";
 	 					str += "    <td>" +data[index].itemStatus +"</td>";
 	 			        str += "    <td>" +data[index].note +"</td>";
 	 			        str += "</tr>"
 					}
 					
 					if(data[index].pagingvo.pageNum!=temp){
 			        	temp=data[index].pagingvo.pageNum;
 			        	menuStr +="<a href='#' onClick='prtList("+temp+")'>"+temp+"</a></span> ";
 			        }
 				})
 				$("#prtListTableDetail").html(str); 
 				
 				var infoStr="";
 				infoStr += "<a href='#' onClick='etcList(1)'>[처음]</a>";
 				infoStr += "<a href='#' onClick='etcList("+(pageNum-1)+")'>[이전]</a>"; 
 				infoStr += menuStr;
 				infoStr += "<a href='#' onClick='etcList("+(pageNum+1) +")'>[다음]</a>";
 				infoStr += "<a href='#' onClick='etcList("+temp+")'>[끝]</a>";
 				
 				$("#etcListInfo").html(infoStr);
 				$("#etcListChoicePage").val(pageNum);
 				$("#etcListLastPage").val(temp);
 				$("#etcListLength").val(data.length);
 				$("#etcListCnt").html(data.length);
 				
 			},
	 		error : function(request, error){
	 			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			alert("검색을 실패하였습니다..");
	 		}
 		})
	}
	
	function totListCnt(){
		
		$.ajax({
 			type : "post",
 			async : true,
 			url : "discardTotCount.do",
 			success : function(data){
 				$("#totListCnt").html(data+"개");
 			},
	 		error : function(request, error){
	 			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
 		})
	
	}
	
	function addPcList(){
		$("#targetPcCnt").html(parseInt(document.getElementById("pcListCnt").innerHTML));
		addTotList();
	}
	
	function addMonList(){
		$("#targetMonCnt").html(parseInt(document.getElementById("monListCnt").innerHTML));
		addTotList();
	}
	
	function addPrtList(){
		$("#targetPrtCnt").html(parseInt(document.getElementById("etcListCnt").innerHTML));
		addTotList();
	}
	
	function addTotList(){
		
		var pcCnt = parseInt(document.getElementById("targetPcCnt").innerHTML);
		var monCnt = parseInt(document.getElementById("targetMonCnt").innerHTML);
		var prtCnt = parseInt(document.getElementById("targetPrtCnt").innerHTML);
		
		if(isNaN(pcCnt)){
			pcCnt=0;
		}
		if(isNaN(monCnt)){
			monCnt=0;
		}
		if(isNaN(prtCnt)){
			prtCnt=0;
		}
		
		var totCnt = pcCnt+monCnt+prtCnt;
		$("#targetTotCnt").html(totCnt);
	}
	
	function saveHwm004(){
		var lisPcCnt = parseInt(document.getElementById("pcListCnt").innerHTML);
		var lisMonCnt = parseInt(document.getElementById("monListCnt").innerHTML);
		var lisPrtCnt = parseInt(document.getElementById("etcListCnt").innerHTML);
		
		var tarPcCnt = parseInt(document.getElementById("targetPcCnt").innerHTML);
		var tarMonCnt = parseInt(document.getElementById("targetMonCnt").innerHTML);
		var tarPrtCnt = parseInt(document.getElementById("targetPrtCnt").innerHTML);
		
		var totCnt = parseInt(document.getElementById("targetTotCnt").innerHTML); 

		if($("#disListTitle").val()==""){
			alert("폐기리스트 제목을 설정해 주시기 바랍니다.");
			return false;
		}
		if(isNaN(totCnt)||(totCnt==0)){
			alert("등록된 확정 대상이 없습니다.");
			return false;
		}
		
		if((!isNaN(tarPcCnt))&&(lisPcCnt!=tarPcCnt)){
			alert("PC List 변경사항을 확인해 주세요.");
			return false;
		}
		
		if((!isNaN(tarMonCnt))&&(lisMonCnt!=tarMonCnt)){
			alert("모니터 List 변경사항을 확인해 주세요.");
			return false;
		}
		
		if((!isNaN(tarPrtCnt))&&(lisPrtCnt!=tarPrtCnt)){
			alert("기타 List 변경사항을 확인해 주세요.");
			return false;
		}
		
		$.ajax({
 			type : "post",
 			url : "makeDiscardList.do",
 			dataType : "text",
 			data : bindData(),
 			success : function(rsult){
 				if(rsult != "E"){
 					PNotifyAlert('info','저장이 완료되었습니다.','');
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
		var tarPcCnt = parseInt(document.getElementById("targetPcCnt").innerHTML);
		var tarMonCnt = parseInt(document.getElementById("targetMonCnt").innerHTML);
		var tarPrtCnt = parseInt(document.getElementById("targetPrtCnt").innerHTML);
		
		var totCnt = parseInt(document.getElementById("targetTotCnt").innerHTML); 
		
		if(isNaN(tarPcCnt)){
			tarPcCnt=0;
		}
		if(isNaN(tarMonCnt)){
			tarMonCnt=0;
		}
		if(isNaN(tarPrtCnt)){
			tarPrtCnt=0;
		}
		
		var data ={};
		
		data.dListTitle = $("#disListTitle").val();
		data.writeDate = $("#inputDate").val();
		data.pcCnt = tarPcCnt;
		data.monCnt = tarMonCnt;
		data.prtCnt = tarPrtCnt;
		data.totCnt = totCnt;
	
		return data;
		
	}
	
	
	function initHwm004(){
		$("#disListTitle").val("");
		$("#targetPcCnt").html("");
		$("#targetMonCnt").html("");
		$("#targetPrtCnt").html("");
		$("#totListCnt").html("");
		$("#targetTotCnt").html("");
	}

</script>