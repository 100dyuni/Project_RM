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

<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
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
		    	<h3>폐기리스트 조회</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="hwm104Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<button class="btn btn-dark" type="button" onclick="hwm104Del()"><i class="fa fa-file-text-o">&nbsp;&nbsp;삭제</i></button>
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
				<form class="form-horizontal" name="hwm104form01" id ="hwm104form01">
					<div class="form-group">
						<div class="row" style="height: 44px">
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="dListTitleCheck" name="dListTitleCheck">리스트 제목</label>
						  	</div>
						  	<div class="col-md-2">
						  		<input type="text" class="form-control" id="dListTitle" name ="dListTitle">
						  	</div>
						  	
						  	<div class="col-md-1 checkbox">
						  		<label><input type="checkbox" id="writeDateCheck" name="writeDateCheck">작성일자</label>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="writeDateFromPicker">
						  			<input type='text' class="form-control" id="writeDateFrom" name="writeDateFrom" data-inputmask="'mask' : '9999.99.99'"/>
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-2">
						  		<div class="input-group date" id="writeDateToPicker">
						  			<input type='text' class="form-control" id="writeDateTo" name="writeDateTo" data-inputmask="'mask' : '9999.99.99'"/>
				                    <span class="input-group-addon">
				                    	<span class="glyphicon glyphicon-calendar"></span>
				                    </span>
						  		</div>
						  	</div>
						  	<div class="col-md-1 ">
						  		<label>진행 여부</label>
						  	</div>
						  	<div class="col-md-2">
						  		<select class="select2_single form-control" tabindex="-1" id="discardFlg" name="discardFlg">
						  			<option value="Y">보류</option>
						  			<option value="D">폐기 완료</option>
						  		</select>
						  	</div>
						 </div>
					</div>
				</form>
				
			</div>
		</div>
		
		<div class="x_panel">
			<div class = "x_content">
				<form class="form-horizontal" name="hwm104form02" id ="hwm104form02">
					<div class="table-responsive">
						<table class="table table-hover jambo_table " style="table-layout: fixed" id="searchHwm104Table"><!-- bulk_action -->
			            	<thead>
			                	<tr class="headings center">
			                		<th hidden="true">dListSeq</th>
			                		<th width="10px"><input type="checkbox" class="select-all" name="select-all" id="select-all"> </th>
			                		<th width="160px">리포트제목</th>
			                		<th width="100px">작성일자</th>
			                		<th width="60px">전체갯수</th>
			                		<th width="60px">PC</th>
			                		<th width="60px">모니터</th>
			                		<th width="60px">기타</th>
			                		<th hidden="true">Flag</th>
			                	</tr>
			                </thead>
			                <tbody id ="searchHwm104TableDetail">
			                
			                
			            	</tbody>
			            </table>
			            <div id="hwm104PagingInfo"></div>
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
		
		$("#searchHwm104TableDetail").on("dblclick","tr",function(event){
			var tr = $(this);
			var td = tr.children();
			
			var dListSeq = td.eq(1).text();
			
			if(confirm("상세페이지로 이동하시겠습니까?")){
				location.href="hwm104Detail.do?dListSeq="+dListSeq;
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
 		
	
	function hwm104Search(){
		var str="";
		$.ajax({
			type : "post",
			url : "hwm104Search.do",
			data : {
				dListTitle 		: document.getElementById("dListTitleCheck").checked == true ? $("#dListTitle").val() :"",
				writeDateFrom 	: document.getElementById("writeDateCheck").checked == true ? $("#writeDateFrom").val() :"",
				writeDateTo 	: document.getElementById("writeDateCheck").checked == true ? $("#writeDateTo").val() :"",
				useYN			: $("#discardFlg").val() 
			},
			success : function(searchData){
				var str = "";
				if(searchData.length==0){
					PNotifyAlert("info","","검색결과가 존재하지 않습니다.");
				}else{
					$.each(searchData, function(index) {
			    		str += "<tr>";
			    		str += "	<td><input type='checkbox' class='select-item checkbox' name='select-item' value ="+ searchData[index].dListSeq +"></td>";
			    		str += "	<td hidden='true'>"+ searchData[index].dListSeq +"</td>";
			    		str += "	<td>"+ searchData[index].dListTitle +"</td>";
			    		str += "	<td>"+ searchData[index].writeDate +"</td>";
			    		str += "	<td>"+ searchData[index].totCnt +"</td>";
			    		str += "	<td>"+ searchData[index].pcCnt +"</td>";
			    		str += "	<td>"+ searchData[index].monCnt +"</td>";
			    		str += "	<td>"+ searchData[index].prtCnt +"</td>";
			    		str += "	<td hidden='true'>"+ searchData[index].useYN +"</td>";
			    		str += "</tr>";
			    	});
				}
				$("#searchHwm104TableDetail").html(str);
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
		
	}
		
	function hwm104Del(){
		var items=[];
		
		$("input.select-item:checked:checked").each(function (index,item) {
        	items[index] = item.value;
        });
		
        if (items.length < 1) {
        	PNotifyAlert("info","","선택된 리스트가 없습니다.");
        }else {
            if(!(checkDListFlg(items))){
            	PNotifyAlert("error","[폐기 완료]된 리스트는 삭제할 수 없습니다.","");
            	return false;
            }else{
            	$.ajax({
         			type : "post",
         			url : "hwm104Del.do",
         			traditional : true,
         			data : {
         				"dListSeqs" : items
         			}, 
         			success : function(rsult){
         				if(rsult != "E"){
         					PNotifyAlert("info","","삭제가 완료되었습니다.");
        					hwm104Search();
         				}
         			},
         			error : function(request, error){
         				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         				alert("저장에 실패하였습니다.");
         			}
         		}); 
            }
        } 
	}
	
	function checkDListFlg(items){
		var rows = $("#searchHwm104Table tr");
		var delFlg = true;
		for(i=1; i<$(rows).length;i++){
			var flg = $(rows[i]).children().eq(8).text();
			var seq = $(rows[i]).children().eq(1).text();
			for(j=0; j<items.length;j++){
				if((seq == items[j])&&(flg=="D")){
					delFlg=false;
				}
			}
		}
		return delFlg;
	}
	
	
	
	
	
	
</script>