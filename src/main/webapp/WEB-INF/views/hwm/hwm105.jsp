<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.min.js"></script>

<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>
<!-- bootstrap-daterangepicker -->
<link href="css/daterangepicker.css" rel="stylesheet">
<!-- bootstrap-datetimepicker -->
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
<script src="js/bootstrap-datetimepicker.min.js"></script>

<div class="">
	<div class="">
		<div class="page-title">
			<div class="title_left">
		    	<h3>폐기리스트 상세</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		                	<button class="btn btn-dark" type="button" onclick="hwm105Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button>
		                	<button class="btn btn-dark" type="button" onclick="hwm105Discard()"><i class="fa fa-trash-o">&nbsp;&nbsp;폐기</i></button>
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
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<form id="hwm105form1" name="hwm105form1" data-parsley-validate class="form-horizontal form-label-left" method="get" action="hwm105Excel.do" accept-charset="utf-8">
							<div class="form-group">
								<div hidden="hidden">
									<input type="text" id="dListSeq" name="dListSeq">
								</div>
								<label class="col-md-1 col-sm-1 col-xs-12 control-label">리스트 제목</label>
								<div class="col-md-3 col-sm-3 col-xs-12">
									<input type="text" class="form-control" id="disListTitle" name="disListTitle" readonly="readonly">
								</div>
								<label class="col-md-1 col-sm-1 col-xs-12 control-label">작성일자</label>
							  	<div class="col-md-3 col-sm-3 col-xs-12">
							  		<input type='text' class="form-control" id=writeDate name="writeDate" data-inputmask="'mask' : '9999.99.99'" readonly="readonly"/>
					            </div>
					            <label class="col-md-1 col-sm-1 col-xs-12 control-label">진행상황</label>
							  	<div class="col-md-1 col-sm-1 col-xs-12">
							  		<input type='text' class="form-control" id="flgLabel" name="flgLabel" readonly="readonly"/>
							  		<input type='hidden' class="form-control" id="useYN" name="useYN" />
					            </div>
								
							</div>
							<div class="form-group">
								<label class="col-md-1 col-sm-1 col-xs-2 control-label">총수량</label>
								<div class="col-md-1 col-sm-1 col-xs-2">
									<input type="text" class="form-control" id="totCnt" name="totCnt" readonly="readonly">
								</div>
							 	<label class="col-md-1 col-sm-1 col-xs-2 control-label">피씨</label>
								<div class="col-md-1 col-sm-1 col-xs-2">
									<input type="text" class="form-control" id="pcCnt" name="pcCnt" readonly="readonly">
								</div>
								<label class="col-md-1 col-sm-1 col-xs-2 control-label">모니터</label>
								<div class="col-md-1 col-sm-1 col-xs-2">
									<input type="text" class="form-control" id="monCnt" name="monCnt" readonly="readonly">
								</div>
								<label class="col-md-1 col-sm-1 col-xs-2 control-label">기타</label>
								<div class="col-md-1 col-sm-1 col-xs-2">
									<input type="text" class="form-control" id="prtCnt" name="prtCnt" readonly="readonly">
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="x_panel">
			<div class = "x_content">
				<form class="form-horizontal" name="hwm105form02" id ="hwm105form02">
					<div class="table-responsive" id="excelExportTest">
						<table class="table table-hover jambo_table bulk_action" id="searchHwm105Table">
			            	<thead >
			                	<tr class="headings center">
			                		<th>종류</th>
			                		<th>제조사</th>
			                		<th>모델명</th>
			                		<th>제조년월</th>
			                		<th>현위치</th>
			                		<th>식별번호</th>
			                		<th>상태</th>
			                		<th>비고</th>
			                	</tr>
			                </thead>
			                <tbody id ="searchHwm105TableDetail">
			                
			                
			            	</tbody>
			            </table>
			            <div id="hwm105PagingInfo"></div>
			            <input type="hidden" id="pagingLastNum">
					</div>
				</form>
			</div>
		</div>
		
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		
		$("#writeDateFromPicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		$("#writeDateToPicker").datetimepicker({
 	 		format:"YYYY.MM.DD"
 		});
		
		$("#writeDateFrom").val(getLastMonth());
		$("#writeDateTo").val(getSysDate());
		
		$("#writeDateFrom").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#writeDateFrom").blur();
		    }
		});
		
		$("#writeDateTo").keyup(function(event){
		    if(event.keyCode == 13){
		    	$("#writeDateTo").blur();
		    }
		});
		
		if("${thw30.dListSeq}" !=""){
			getDListHead("${thw30.dListSeq}");
			getDListDetail("${thw30.dListSeq}");
			$("#dListSeq").val("${thw30.dListSeq}");
		}
		
 	});
 		
	function hwm105Excel(){
		document.hwm105form1.submit();	
	}
	
	function hwm105Discard(){
		if(confirm("해당 제품들을 모두 폐기하시겟습니까?")){
			$.ajax({
				type 	: "post",
				url 	: "hwm105Discard.do",
				data 	: "dListSeq="+$("#dListSeq").val(),
				success : function(result){
					//console.log(result);
					PNotifyAlert('info','[폐기처리]가 완료되었습니다.','')
				},
				error 	: function(request, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("조회에 실패하였습니다.");
				}
				
			});
		};
	}
	
	
	function getDListHead(dListSeq){
		$.ajax({
			type : "post",
			url : "hwm105DListHead.do",
			data : "dListSeq="+dListSeq,
			success : function(searchData){
				//console.log(searchData);
				$("#disListTitle").val(searchData[0].dListTitle);
				$("#writeDate").val(searchData[0].writeDate);
				$("#totCnt").val(searchData[0].totCnt);
				$("#pcCnt").val(searchData[0].pcCnt);
				$("#monCnt").val(searchData[0].monCnt);
				$("#prtCnt").val(searchData[0].prtCnt);
				$("#useYN").val(searchData[0].useYN);
				
				if(searchData[0].useYN=="D"){
					$("#flgLabel").val("폐기 완료");
				}else{
					$("#flgLabel").val("보류");
				}
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
	}
	
	function getDListDetail(dListSeq){
		$.ajax({
			type : "post",
			url : "hwm105DListDetail.do",
			data : "dListSeq="+dListSeq,
			success : function(searchData){
				//console.log(searchData);
				var str = "";
			    $.each(searchData, function(index) {
			    	str += "<tr>";
			    	str += "	<td>"+ searchData[index].ItemType +"</td>";
			    	str += "	<td>"+ searchData[index].Manufac +"</td>";
			    	str += "	<td>"+ searchData[index].ModelName +"</td>";
			    	str += "	<td>"+ searchData[index].productDate +"</td>";
			    	str += "	<td>"+ searchData[index].LCode1Name +"</td>";
			    	str += "	<td>"+ searchData[index].IdentiCode +"</td>";
			    	str += "	<td>"+ searchData[index].ItemStatus +"</td>";
			    	str += "	<td>"+ searchData[index].Note +"</td>";
			    	str += "</tr>";
			    });
				$("#searchHwm105TableDetail").html(str); 
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
	}
	
	
</script>