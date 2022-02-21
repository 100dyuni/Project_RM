<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery.min.js"></script>

<!-- 사원검색 Modal -->
<div class="modal fade" id="searchEMP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">사원검색<small>&nbsp;&nbsp;(검색 조건 : 이름)</small></h4>
      </div>
      <div class="modal-body">
        <div class="input-group">
	    	<input type="text" class="form-control" placeholder="Search for..." id="inputSearchEmp">
	        <span class="input-group-btn">
	        	<button class="btn btn-default" type="button" id="btnEmpSearch" onclick="empSearch()">검색</button>
	        </span>
	    </div>
	    <div class="table-responsive">
	    	<table class="table table-hover jambo_table bulk_action" id="searchEmpTable">
            	<thead >
                	<tr class="center">
                		<th>사번</th>
                    	<th>이름</th>
                        <th>소속</th>
                        <th>직위 직책</th>
                        <th hidden="true">
							소속코드
						</th>
                    </tr>
                </thead>
                <tbody id="detailEmp">
                	
                </tbody>
            </table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<!-- 매장검색 Modal -->
<div class="modal fade" id="searchTarget" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">매장검색<small>&nbsp;&nbsp;(검색 조건 : 매장명)</small></h4>
      </div>
      <div class="modal-body">
        <div class="input-group">
	    	<input type="text" class="form-control" placeholder="Search for..." id="inputTarget">
	        <span class="input-group-btn">
	        	<button class="btn btn-default" type="button" id="btnTargetSearch" onclick="targetSearch()">검색</button>
	        </span>
	    </div>
	    <div class="table-responsive">
	    	<table class="table table-hover jambo_table bulk_action" id="searchTargetTable">
            	<thead >
                	<tr class="center">
                    	<th>대리점명</th>
                    	<td hidden="true">관리부서코드</td>
                        <th>관리부서</th>
                        <td hidden="true">담당자 사번</td>
                        <th>담당자명</th>
                        <th hidden="true">
							활성화여부
						</th>
						<th hidden="true">
							대리점코드
						</th>
                    </tr>
                </thead>
                <tbody id ="detailTarget">
                	
                 </tbody>
            </table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<!-- 기타검색 Modal -->
<div class="modal fade" id="searchEtc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">기타</h4>
      </div>
      <div class="modal-body">
      	<select class="select2_single form-control" tabindex="-1" id="etcLCodeType" name="etcLCodeType" style="width: 120px">	
      	</select>
      	<div class="clearfix"></div>
      	
        <div class="input-group">
	    	<input type="text" class="form-control" id="inputEtcLoca">
	        <span class="input-group-btn">
	        	<button class="btn btn-dark" type="button" id="btnEtcLoca" onclick="addEtcLoca()">추가</button>
	        </span> 
	    </div>
        <div class="clearfix"></div>
        <br>
	  	<div class="table-responsive">
	    	<table class="table table-hover jambo_table bulk_action" id="searchTargetTable">
            	<thead >
                	<tr class="center">
                    	<th>위치</th>
                    	<td hidden="true">seq</td>
                    </tr>
                </thead>
                <tbody id ="detailEtcLoca">
                	
                 </tbody>
            </table>
          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<!-- 이미지확인 Modal -->
<div class="modal fade" id="checkImg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">이미지체크</h4>
     		</div>
      	<div class="modal-body">
			<div id="loadImgDiv"></div>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      	</div>
    	</div>
  	</div>
</div>


<!-- 이동할 제품 검색  -->
<div class="modal fade" id="searchProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">이동 제품검색<small>&nbsp;&nbsp;(검색 조건 : 사원명)</small></h4>
      		</div>
	      	<div class="modal-body">
	        	<div class="input-group">
		    		<input type="text" class="form-control" placeholder="Search for..." id="inputProduct">
		        	<span class="input-group-btn">
		        		<button class="btn btn-default" type="button" id="btnProductSearch" onclick="productSearch()">검색</button>
		       	 	</span>
		    	</div>
		    	<div class="table-responsive">
		    		<table class="table table-hover jambo_table bulk_action" id="searchTargetTable">
	            		<thead >
	                		<tr class="center">
	                			<td>부서</td>
	                			<td hidden="true">부서코드</td>
	                    		<td hidden="true">사번</td>
	                    		<td>이름</td>
	                        	<td>종류</td>
	                        	<td>식별번호</td>
	                        	<td>모델명</td>
	                        	<td>제조년월</td>
								<td hidden="true">rSeq</td>
	                    	</tr>
	                	</thead>
	                	<tbody id ="detailProduct">
	                	
	                 	</tbody>
	            	</table>
	          	</div>
	      	</div>
		    <div class="modal-footer">
		     	<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
    	</div>
	</div>
</div>

<!--간단 제품정보 Modal -->
<div class="modal fade" id="simpleProductInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        	<h4 class="modal-title" id="myModalLabel">간단 제품정보</h4>
	      	</div>
	      	<div class="modal-body">
				<div id="simpleProductDiv"></div>
	      	</div>
	      	<div class="modal-footer">
	      		<button type="button" class="btn btn-default" onclick="simpleProInfoSave()">저장</button>
	        	<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
	      	</div>
    	</div>
	</div>
</div>


<!--이동내역 간단조회 Modal -->
<div class="modal fade" id="simpleHWMovingHistory" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">이동내역 간단조회</h4>
      		</div>
      		<div class="modal-body">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">종류</label>
					    <div class="col-md-5 col-sm-5 col-xs-12">
					    	<input type="text" class="form-control" id="mItemType" name="mItemType" readonly="readonly">
					    </div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">모델명</label>
					    <div class="col-md-5 col-sm-5 col-xs-12">
					    	<input type="text" class="form-control" id="mModelName" name="mModelName" readonly="readonly">
					    </div>
					</div>
					<div class="form-group">
						<label class="col-md-3 col-sm-3 col-xs-10 control-label">식별번호</label>
					    <div class="col-md-5 col-sm-5 col-xs-12">
					    	<input type="text" class="form-control" id="mIdentiCode" name="mIdentiCode" readonly="readonly">
					    </div>
					</div>
				</form>
				<form class="form-horizontal" >
					<div class="table-responsive">
						<table class="table table-hover jambo_table bulk_action" id="searchHwm102Table">
			            	<thead >
			                	<tr class="headings center">
			                		<th>이동일자</th>
			                		<th>출발위치</th>
			                		<th>도착위치</th>
			                		<th>메모</th>
			                	</tr>
			                </thead>
			                <tbody id ="simpleHWMovingHistoryTableDetail">
			                
			                
			            	</tbody>
			            </table>
			        </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnHwInfoDetail" onclick="confirmBtnCheck()"><i class="fa fa-search"></i>&nbsp;&nbsp;H/W정보확인</button>
				<button type="button" class="btn btn-dark" data-dismiss="modal"><i class="fa fa-close"></i>&nbsp;&nbsp;닫기</button>
			</div>
		</div>
	</div>
</div>

<!--팀 리스트  Moadl 안씀 -->
<div class="modal fade" id="teamListModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">팀 리스트</h4>
      		</div>
      		<div class="modal-body">
				<div class="input-group">
			    	<input type="text" class="form-control" placeholder="Search for..." id="inputSearchTeamInfo">
			        <span class="input-group-btn">
			        	<button class="btn btn-default" type="button" id="btnTeamSearch" onclick="teamSearch()">검색</button>
			        </span>
			    </div>
				<form class="form-horizontal" >
					<div class="table-responsive">
						<table class="table table-hover jambo_table bulk_action" id="searchHwm102Table">
			            	<thead >
			                	<tr class="headings center">
			                		<th>부서코드</th>
			                		<th>부서명</th>
			                		<th>팀코드</th>
			                		<th>팀명</th>
			                	</tr>
			                </thead>
			                <tbody id ="teamListDetail">
			                
			                
			            	</tbody>
			            </table>
			        </div>
				</form>
			</div>
			<!-- <div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnHwInfoDetail" onclick="confirmBtnCheck()"><i class="fa fa-search"></i>&nbsp;&nbsp;H/W정보확인</button>
				<button type="button" class="btn btn-dark" data-dismiss="modal"><i class="fa fa-close"></i>&nbsp;&nbsp;닫기</button>
			</div> -->
		</div>
	</div>
</div>

<!--조직 검색 Moadl  -->
<div class="modal fade" id="orgListModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
        		<div class="input-group">
        			<h4 class="modal-title" id="myModalLabel">조직 검색</h4>
        			<span class="input-group-btn">
        				<button class="btn btn-dark" type="button" onclick="orgSelectOK()">확인</button>
        				<button class="btn btn-dark" type="button" data-dismiss="modal">닫기</button>
        			</span>
        		</div>
        		
        	</div>
        	<div class="modal-body">
        		<div class ="row">
        			<div class="col-md-6 col-xs-12">
						<span id="divisionChoice" style="font-size: 14px; font-weight: bold; margin-left: 5px" ></span>
						<input type="hidden" id="divisionChoiceVal">
						<input type="hidden" id="divisionChoiceName">
					</div>
					<div class="col-md-6 col-xs-12">
						<span id="teamChoice" style="font-size: 14px;font-weight: bold;"></span>
						<input type="hidden" id="teamChoiceVal">
						<input type="hidden" id="teamChoiceName">
					</div>
        		</div>
        	</div>
      		<div class="modal-body">
      			<div class ="row">
					<div class="col-md-6 col-xs-12">
						<form class="form-horizontal" >
							<div class="table-responsive">
								<table class="table table-hover jambo_table">
					                <tbody id ="modalHighOrgList" >
					                	
					            	</tbody>
					            </table>
					        </div>
						</form>
					</div>
					<div class="col-md-6 col-xs-12">
						<form class="form-horizontal" >
							<div class="table-responsive">
								<table class="table table-hover jambo_table">
					                <tbody id ="modalLowOrgList">
					                	
					            	</tbody>
					            </table>
					        </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--조직정보 HW위치 정보 비교 후 알림  코딩코딩-->
<div class="modal fade" id="orgHwCheckList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">확인 대상</h4>
      		</div>
	      	<div class="modal-body">
	        	<div class="table-responsive">
		    		<table class="table table-hover jambo_table bulk_action" id="orgHwCheckTable">
	            		<thead >
	                		<tr class="center">
	                			<td>사번</td>
	                			<td>이름</td>
	                    		<td>사원 부서 정보</td>
	                    		<td>HW 위치 정보</td>
	                    		<td hidden="true">rSeq</td>
	                        	<td>종류</td>
	                        	<td>식별번호</td>
	                        	<td>모델명</td>
	                        	<td>제조년월</td>
	                    	</tr>
	                	</thead>
	                	<tbody id ="orgHwCheckTableDetail">
	                	
	                 	</tbody>
	            	</table>
	          	</div>
	      	</div>
		    <div class="modal-footer">
		     	<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
    	</div>
	</div>
</div>

<!-- 문의번호 등록  -->
<div class="modal fade" id="phoneDirectoryRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 	<div class="modal-dialog modal-sm" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">문의 번호</h4>
      		</div>
      		<div class="modal-body">
        		<div class="table-responsive">
	    	
			    	<table class="table table-hover jambo_table bulk_action" id="phoneDirectTable1">
		            	<thead >
		                	<tr class="center">
		                    	<th colspan="1" width="150px">컴퓨터, MS 설치 문의</th>
		                    	<th></th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<tr>
		                		<td><input type="text" id="pd1_name" name="pd1_name" style="width: 100px"></td>
		                		<td><input type="text" id="pd1_tel" name="pd1_tel" style="width: 100px"></td>
		                	</tr>
		                	<tr>
		                		<td><input type="text" id="pd2_name" name="pd2_name" style="width: 100px"></td>
		                		<td><input type="text" id="pd2_tel" name="pd2_tel" style="width: 100px"></td>
		                	</tr>
		                </tbody>
		            </table>
            
		            <table class="table table-hover jambo_table bulk_action" id="phoneDirectTable2">
		            	<thead >
		                	<tr class="center">
		                    	<th colspan="1" width="150px">Adobe, Cad 설치 문의</th>
		                    	<th></th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<tr>
		                		<td><input type="text" id="pd3_name" name="pd3_name" style="width: 100px"></td>
		                		<td><input type="text" id="pd3_tel" name="pd3_tel" style="width: 100px"></td>
		                	</tr>
		                	<tr>
		                		<td><input type="text" id="pd4_name" name="pd4_name" style="width: 100px"></td>
		                		<td><input type="text" id="pd4_tel" name="pd4_tel" style="width: 100px"></td>
		                	</tr>
		                </tbody>
		            </table>
		            
		            <table class="table table-hover jambo_table bulk_action" id="phoneDirectTable3">
		            	<thead >
		                	<tr class="center">
		                    	<th colspan="1" width="150px">PC 포맷</th>
		                    	<th></th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<tr>
		                		<td><input type="text" id="pd5_name" name="pd5_name" style="width: 100px"></td>
		                		<td><input type="text" id="pd5_tel" name="pd5_tel" style="width: 100px"></td>
		                	</tr>
		                	<tr>
		                		<td><input type="text" id="pd6_name" name="pd6_name" style="width: 100px"></td>
		                		<td><input type="text" id="pd6_tel" name="pd6_tel" style="width: 100px"></td>
		                	</tr>
		                </tbody>
		            </table>
            
          		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" onclick="phDirectorySave()">저장</button>
	        	<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
	      	</div>
		</div>
	</div>
</div>


<script type="text/javascript">

$(document).ready(function(){

	$("#alertModal").on("show.bs.modal", function(event){
		var button = $(event.relatedTarget);
		var modal = $(this);
		var getVal = button.data("whatever");
		var getVal1 = button.data("t1");
		
		modal.find(".modal-body").text("상세페이지로 이동하시겠습니까?");
	});
	
	$("#simpleHWMovingHistory").on("show.bs.modal", function(event){
		simpleHWMoveingHistorySeach($("#simRSEQ").val(),$("#simIdentiCode").val());
	});
	
	
	$('#searchEMP').on('show.bs.modal', function (event) {
		var modal = $(this);
		var obTest = event.target;
		$("#inputSearchEmp").val("");
		$("#detailEmp").html("");
	});
	
	$('#checkImg').on('show.bs.modal', function (event) {
		var modal = $(this);
		var obTest = event.target;
		var str="";
		var uuid="";
		if(($("#ImgUUID").val() != null) &&($("#ImgUUID").val() != "" )){
			str = "<div>"+  
			  "<img src='/loadImgModal.do?UUID=" + $("#ImgUUID").val() +  "'/>" +
			  "</div>";	
		}	
		$("#loadImgDiv").html(str);
 		
	});
	
	$('#simpleProductInfo').on('show.bs.modal', function (event) {
		var str="";
		$.ajax({
			type : "post",
			url : "searchHwResource.do",
			data : "rSeq="+$("#tdInfoRSeq").val()+"&IdentiCode="+$("#tdInfoIdenti").val(),
			success : function(rsult){
				if(rsult != "E"){
					str += "<table class='table table-bordered'>";
					str += "	<tr>";
					str += "   	<th class='column-title' width='80px'>구분</th>";
					str += "      <td>"+rsult.itemType+"</td>";
					str += "    </tr>";
					str += "    <tr>";
					str += "    	<th class='column-title' width='80px'>식별번호</th>";
					str += "    	<td>"+rsult.identiCode+"</td>";
					str += "    </tr>";
					str += "    <tr>";
					str += "		<th class='column-title' width='80px'>제조사</th>";
					str += "        <td>"+rsult.manufac+"</td>";
					str += "   </tr>";
					str += "    <tr>";
					str += "        <th class='column-title' width='80px'>모델명</th>";
					str += "        <td>"+rsult.modelName+"</td>";
					str += "    </tr>";
					str += "    <tr>";
					str += "        <th class='column-title' width='80px'>제조년월</th>";
					str += "        <td>"+rsult.productDate+"</td>";
					str += "    </tr>";
					str += "    <tr>";
					str += "       <th class='column-title' width='80px'>상태</th>";
					str += "       <td>";
					str += "			<select class='form-control' id='modalItemStatus' name ='modalItemStatus' style='width: 120px;'>";//class='form-control'
					str += "				<option value='00'></option>";
					str += "				<option value='01'>정상</option>";
					str += "				<option value='02'>분실</option>";
					str += "				<option value='03'>폐기대상</option>";
					str += "				<option value='04'>폐기완료</option>";// hidden='hidden'
					str += "			</select> ";
					str += "		</td>";
					str += "    </tr>";
					str += "</table>";
				}
				$("#simpleProductDiv").html(str);
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("저장에 실패하였습니다.");
			}
			
		});
	});
	
	$('#searchEtc').on('show.bs.modal', function (event) {
		var eObject = event.target;
		EtcLCodeTypeSB();
		setTimeout(function(){
			
			if(("hwm101btn01") == $("#eBtnValue").val()){
				$("#etcLCodeType").val($("#LCodeType").val());
			}else if(("hwm102btn01") == $("#eBtnValue").val()){
				$("#etcLCodeType").val($("#arrLCodeType").val());
			}else if(("hwm001btn01") == $("#eBtnValue").val() ){
				$("#etcLCodeType").val($("#LCodeType").val());
			}else if(("hwm002btn02") == $("#eBtnValue").val()){
				$("#etcLCodeType").val($("#arrLCodeType").val());
			}else if(("swm003btn01") == $("#eBtnValue").val()){
				$("#etcLCodeType").val($("#LCodeType").val());
			};
			
			etcLocationSearch($("#etcLCodeType").val());
			
		},100)
		
		
	});
	
	$("#orgListModal").on('show.bs.modal', function (event) {
		searchHighOrgList();
		
		$("#teamChoice").html("");
		$("#teamChoiceVal").val("");
		$("#teamChoiceName").val("");
		$("#divisionChoice").html("");
		$("#divisionChoiceVal").val("");
		$("#divisionChoiceName").val("");
		$("#modalLowOrgList").html("");
	});
	
	$("#orgHwCheckList").on("show.bs.modal", function(event){
		$.ajax({
			type: "post",
			url: "hwm005CheckTarget.do",
			success: function(data){
				var str="";
				if(data.length>0){
					for(var i=0; i<data.length; i++){
						str += "<tr>";
						str += "	<td>"+data[i].empCode +"</td>";
						str += "	<td>"+data[i].empName +"</td>";
						str += "	<td>"+data[i].highOrgName +"</td>";
						str += "	<td>"+data[i].LCode1Name +"</td>";
						str += "	<td hidden='true'>"+data[i].rSeq +"</td>";
						str += "	<td>"+data[i].ItemType +"</td>";
						str += "	<td>"+data[i].identiCode +"</td>";
						str += "	<td>"+data[i].ModelName +"</td>";
						str += "	<td>"+data[i].productDate +"</td>";
						str += "</tr>"; 
					}
				}
				
				$("#orgHwCheckTableDetail").html(str);
				
			}
		});
	})
	
	$('#phoneDirectoryRegister').on('show.bs.modal', function (event) {
		$.ajax({
			type: "post",
			url: "phoneDirecSearch.do",
			success: function(data){
				if(data.length>0){
					for(var i=0; i<data.length; i++){
						if(data[i].pdFlag == "pd1"){
							$("#pd1_name").val(data[i].name);
							$("#pd1_tel").val(data[i].tel);
						}
						
						if(data[i].pdFlag == "pd2"){
							$("#pd2_name").val(data[i].name);
							$("#pd2_tel").val(data[i].tel);
						}
						
						if(data[i].pdFlag == "pd3"){
							$("#pd3_name").val(data[i].name);
							$("#pd3_tel").val(data[i].tel);
						}
						
						if(data[i].pdFlag == "pd4"){
							$("#pd4_name").val(data[i].name);
							$("#pd4_tel").val(data[i].tel);
						}
						
						if(data[i].pdFlag == "pd5"){
							$("#pd5_name").val(data[i].name);
							$("#pd5_tel").val(data[i].tel);
						}
						
						if(data[i].pdFlag == "pd6"){
							$("#pd6_name").val(data[i].name);
							$("#pd6_tel").val(data[i].tel);
						}
							
					}
				}
				
				
			}
		});
		
	})
	
	
	
	$("#detailEmp").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();
		/* 참고 */ 
		var empCode = td.eq(0).text();
		var empName = td.eq(1).text();
		var depName = td.eq(2).text();
		var rankName = td.eq(3).text();
		var depCode = td.eq(4).text();
		
		//console.log(empCode);
		
		var targetBtn = $("#eBtnValue").val();
		
		if(!isNaN(empCode)){
			if(targetBtn == "hwm001btn01"){
				hwm001Btn01SetEmp(td);
			}else if(targetBtn == "hwm002btn02"){
				hwm002btn02SetEmp(td);
			}else if(targetBtn =="com002btn01"){
				com002btn01Set(td);
			}else if(targetBtn =="hwm101btn01"){
				hwm101btn01SetEmp(td);
			}else if(targetBtn =="hwm102btn01"){
				hwm102btn01SetEmp(td);
			}else if(targetBtn =="swm002btn01"){
				swm002btn01SetEmp(td);
			}else if(targetBtn =="tot101btn01"){
				tot101btn01SetEmp(td);
			}
			$("#searchEMP").modal("hide");	
		}
	})
	
	$("#detailTarget").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();

		var agencyName = td.eq(0).text();
		var manageDep = td.eq(1).text();
		var manageDepName = td.eq(2).text();
		var manageEmp = td.eq(3).text();
		var manageEmpName = td.eq(4).text();
		var activeFlg = td.eq(5).text();
		var aSeq = td.eq(6).text();
		
		var targetBtn = $("#eBtnValue").val();

		if(targetBtn == "hwm001btn01"){
			hwm001Btn01SetTarget(td);
		}else if(targetBtn == "hwm002btn02"){
			hwm002btn02SetTarget(td);
		}else if(targetBtn =="hwm101btn01"){
			hwm101btn01SetTarget(td);
		}else if(targetBtn =="hwm102btn01"){
			hwm102btn01SetTarget(td);
		}else if(targetBtn =="swm002btn01"){
			swm002btn01SetTarget(td);
		}else if(targetBtn =="tot101btn01"){
			tot101btn01SetTarget(td);
		}
		
		$("#searchTarget").modal("hide");	
		
	})
	
	$("#detailProduct").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();

		var lcode1Name = td.eq(0).text();//부서명
		var lcode1 = td.eq(1).text();//부서코드
		var lcode2 = td.eq(2).text();//사번
		var lcode2Name = td.eq(3).text();//이름
		var itemType = td.eq(4).text();//종류
		var identiCode = td.eq(5).text();//식별번호
		var modelName = td.eq(6).text();//모델명
		var productDate = td.eq(7).text();//제조년월
		var rSeq = td.eq(8).text();//rseq
		
		var targetBtn = $("#eBtnValue").val();
		console.log(targetBtn);
		if(targetBtn == "hwm002btn01"){
			hwm002Btn01SetProduct(td);
		}else if(targetBtn == "swm004btn01"){
			console.log("44444444444444444");
			console.log(td);
			swm004Btn01SetProduct(td);
		}
		
		
		$("#searchProduct").modal("hide");		
	})
	
	$("#detailEtcLoca").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();

		var etcLocation = td.eq(0).text();//기타장소 이름
		var etcLocaSeq = td.eq(1).text();//기타장소 코드
		
		var targetBtn = $("#eBtnValue").val();

		if(targetBtn == "hwm001btn01"){
			hwm001Btn01SetEtcLocation(td);
		}else if(targetBtn == "hwm002btn02"){
			hwm002btn02SetEtcLocation(td);
		}else if(targetBtn =="hwm101btn01"){
			hwm101btn01SetEtcLocation(td);
		}else if(targetBtn =="hwm102btn01"){
			hwm102btn01SetEtcLocation(td);
		}else if(targetBtn =="swm003btn01"){
			swm003btn01SetEtcLocation(td);
		}
		
		$("#searchEtc").modal("hide");		
	})
	
	$("#modalHighOrgList").on('click','tr', function(event){
		var tr = $(this);
		var td = tr.children();
		var highOrgCode = td.eq(0).text();//상위조직 코드
		var highOrgName = td.eq(1).text();//상위조직 이름
		
		var orgFlgVal ="";
		if(($("#eBtnValue").val() == "hwm005btn01")){
			orgFlgVal = $("#fromOrgFlag").val();
		}else if(($("#eBtnValue").val() == "hwm005btn02")){
			orgFlgVal = $("#toOrgFlag").val();
		}else{
			orgFlgVal = $("#orgFlag").val();
		}
		
		
		$("#divisionChoice").html(highOrgName);
		$("#divisionChoiceVal").val(highOrgCode);
		$("#divisionChoiceName").val(highOrgName);
		
		$.ajax({
			type: "post",
			url: "modalSearchLowOrg.do",
			data:  "highOrgCode="+highOrgCode+"&orgFlag="+orgFlgVal,
			success: function(data){
				var str = "";
		    	$.each(data, function(index) {
					str += "<tr>";
		    		str += "<td hidden='true'>" + ( data[index].lowOrgCode ) + "</td>";
					str += "<td>" + ( data[index].lowOrgName) + "</td>";
		    		str += "</tr>";
		    	});
				$("#modalLowOrgList").html(str);	
				$("#teamChoice").html("");
				$("#teamChoiceVal").val("");
				$("#teamChoiceName").val("");
			}
		});
		
	})
	
	$("#modalLowOrgList").on("click","tr", function(event){
		var tr = $(this);
		var td = tr.children();
		
		var lowOrgCode = td.eq(0).text();//하위조직 코드
		var lowOrgName = td.eq(1).text();//하위조직 이름
		
		$("#teamChoice").html(lowOrgName);
		$("#teamChoiceVal").val(lowOrgCode);
		$("#teamChoiceName").val(lowOrgName);
	})
	
	
	
	$("#inputSearchEmp").keyup(function(event){
		if((event.keyCode == 13)){
			empSearch();
		}
	})
	$("#inputTarget").keyup(function(event){
		if((event.keyCode == 13)){
			targetSearch();
		}
	})
	$("#inputProduct").keyup(function(event){
		if((event.keyCode == 13)){
			productSearch();
		}
	})
	
	$("#inputEtcLoca").keyup(function(event){
		if((event.keyCode == 13)){
			etcLocationSearch($("#etcLCodeType").val());
		}
	})
	
	$("#etcLCodeType").change(function(){
		etcLocationSearch($("#etcLCodeType").val());
	})
})


function empSearch(){
	if($("#inputSearchEmp").val().length <= 1){
		alert("2글자 이상 입력해 주시기 바랍니다.");
		return;
	}
	
	$.ajax({
		type: "post",
		url: "modalSearchEmp.do",
		data: "searchEmp="+$("#inputSearchEmp").val(),
		success: function(searchEmpList){
			if(searchEmpList.length==0){
				alert("검색결과가 존재하지 않습니다.");
			}else{
				var str = "";
		    	$.each(searchEmpList, function(index) {
					str += "<tr>";
					str += "<th>" + ( searchEmpList[index].empCode) + "</th>";
		    		str += "<td>" + ( searchEmpList[index].empName ) + "</td>";
		    		str += "<td>" + ( searchEmpList[index].depName1 ) + "</td>";
		    		str += "<td>" + ( searchEmpList[index].rankName ) + "</td>";
		    		str += "<td hidden='true'>" + ( searchEmpList[index].depCode1 ) + "</td>";
		    		str += "</tr>"
		    	});
				$("#detailEmp").html(str);	
			}
			
			
		}
	});
}

function targetSearch(){
	if($("#inputTarget").val().length <= 1){
		alert("2글자 이상 입력해 주시기 바랍니다.");
		return;
	}
	
	$.ajax({
		type: "post",
		url: "modalSearchTarget.do",
		data: "searchTarget="+$("#inputTarget").val(),
		success: function(searchTargetList){
			if(searchTargetList.length==0){
				alert("검색결과가 존재하지 않습니다.");
			}else{
				var str = "";
		    	$.each(searchTargetList, function(index) {
					str += "<tr>";
					str += "<th>" + ( searchTargetList[index].agencyName) + "</th>";
		    		str += "<td hidden='true'>" + ( searchTargetList[index].manageDep ) + "</td>";
		    		str += "<td>" + ( searchTargetList[index].manageDepName ) + "</td>";
		    		str += "<td hidden='true'>" + ( searchTargetList[index].manageEmp ) + "</td>";
		    		str += "<td>" + ( searchTargetList[index].manageEmpName ) + "</td>";
		    		str += "<td hidden='true'>" + ( searchTargetList[index].activeFlg ) + "</td>";
		    		str += "<td hidden='true'>" + ( searchTargetList[index].aSeq ) + "</td>";
		    		str += "</tr>"
		    	});
				$("#detailTarget").html(str);
			}
		}
	});
}

function productSearch(){
	if($("#inputProduct").val().length <= 1){
		//console.log($("#inputProduct").val().length);
		alert("2글자 이상 입력해 주시기 바랍니다.");
		return;
	}
	
	$.ajax({
		type: "post",
		url: "modalSearchProduct.do",
		data: "searchProduct="+$("#inputProduct").val(),
		success: function(searchProductList){
			if(searchProductList.length==0){
				alert("검색결과가 존재하지 않습니다.");
			}else{
				var str = "";
				$.each(searchProductList, function(index) {
					str += "<tr>";
					str += "<td>" + ( searchProductList[index].lcode1Name) + "</td>";
		    		str += "<td hidden='true'>" + ( searchProductList[index].lcode1) + "</td>";
		    		str += "<td hidden='true'>" + ( searchProductList[index].lcode2 ) + "</td>";
		    		str += "<td>" + ( searchProductList[index].lcode2Name ) + "</td>";
		    		str += "<td>" + ( searchProductList[index].itemType ) + "</td>";
		    		str += "<td>" + ( searchProductList[index].identiCode ) + "</td>";
		    		str += "<td>" + ( searchProductList[index].modelName ) + "</td>";
		    		str += "<td>" + ( searchProductList[index].productDate ) + "</td>";
		    		str += "<td hidden='true'>" + ( searchProductList[index].rSeq ) + "</td>";
		    		str += "</tr>"
		    	});
				$("#detailProduct").html(str);
			}
		}
	});
}


function EtcLCodeTypeSB(){
	$.ajax({
		type: "post",
		url: "createEtcLCodeTypeSB.do",
		success: function(data){
			var str = "";
	    	$.each(data, function(index) {
	    		str += "<option value='"+data[index].lowCode +"'>"+data[index].lowCodeName+"</option>";
	    	});
			$("#etcLCodeType").html(str);
			
		}
	});
}

function etcLocationSearch(etcLocaType){
	$.ajax({
		type: "post",
		url: "modalSearchEtcLoca.do",
		data: "searchLocation="+etcLocaType,
		success: function(searchEtcList){
			var str = "";
		    $.each(searchEtcList, function(index) {
				str += "<tr>";
				str += "<th>" + ( searchEtcList[index].etcLocation) + "</th>";
		    	str += "<td hidden='true'>" + ( searchEtcList[index].etcLocaSeq ) + "</td>";
		    	str += "</tr>"
		    });
			$("#detailEtcLoca").html(str);	
			
		}
	});
}

function addEtcLoca(){
	if($("#inputEtcLoca").val().length <=2){
		alert("자세한 위치를 입력해 주세요. 2글자 이상");
	}else{
		$.ajax({
			type : "post",
			url : "etcLocationRegister.do",
			dataType : "text",
			data : "etcLocation="+$("#inputEtcLoca").val()+"&etcLocaType=" + $("#etcLCodeType").val(),
			success : function(rsult){
				if(rsult != "E"){
					$("#inputEtcLoca").val("");
					etcLocationSearch($("#etcLCodeType").val());
					alert("저장이 완료되었습니다.");
				}
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("저장에 실패하였습니다.");
			}
		});	
	}
	
}

function simpleProInfoSave(){
	//alert("하나부터 열까지다 널위한 소리~");
	if($("#modalItemStatus").val()=="00"){
		alert("상태값을 선택해 주시기 바랍니다.");
		return false;
	};
	$.ajax({
			type : "post",
			url : "hwFlagUpdateModal.do",
			dataType : "text",
			data : "rSeq="+$("#tdInfoRSeq").val()+"&IdentiCode="+$("#tdInfoIdenti").val()+"&ItemStatus="+$("#modalItemStatus").val(),
			async : true,
			success : function(rsult){
				if(rsult != "E"){
					alert("저장이 완료되었습니다.");
					$("#simpleProductInfo").modal("hide");	
					searchDiscardList();
				}
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("저장에 실패하였습니다.");
			}
		});
	
}

function simpleHWMoveingHistorySeach(rSeq,IdentiCode){
	$.ajax({
		type : "post",
		url : "simpleHWMoveingHistorySeach.do",
		data : "rSeq="+rSeq+"&IdentiCode="+IdentiCode,
		success : function(searchMovingList){
			//console.log(searchMovingList);
			var str="";
			$.each(searchMovingList, function(index) {
				str += "<tr>";
	    		str += "	<td>"+ searchMovingList[index].arrDate +"</td>";
	    		str += "	<td>"+ searchMovingList[index].startLCode2Name +"</td>";
	    		str += "	<td>"+ searchMovingList[index].arrLCode2Name +"</td>";
	    		str += "	<td>"+ searchMovingList[index].note +"</td>";
	    		str += "</tr>";
			})
			$("#simpleHWMovingHistoryTableDetail").html(str);
			$("#mItemType").val(searchMovingList[0].itemType);
			$("#mModelName").val(searchMovingList[0].modelName);
			$("#mIdentiCode").val(searchMovingList[0].identiCode);	
			//console.log(searchMovingList[0].identiCode);
		},
		error : function(request, error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("조회에 실패하였습니다.");
		}
	});
}
function teamSearch(){
	//inputSearchTeamInfo
	//teamListDetail
	$.ajax({
		type: "post",
		url: "searchTeamInfo.do",
		data: "searchTeam="+$("#inputSearchTeamInfo").val(),
		success: function(searchTeamList){
			//console.log(searchTeamList);
			if(searchTeamList.length==0){
				alert("검색결과가 존재하지 않습니다.");
			}else{
				var str = "";
				$.each(searchTeamList, function(index) {
					str += "<tr>";
					str += "<td>" + ( searchTeamList[index].depCode1) + "</td>";
		    		str += "<td>" + ( searchTeamList[index].depName1) + "</td>";
		    		str += "<td>" + ( searchTeamList[index].depCode2 ) + "</td>";
		    		str += "<td>" + ( searchTeamList[index].depName2 ) + "</td>";
		    		str += "</tr>"
		    	});
				$("#teamListDetail").html(str);
			}
		}
	});
}

function searchHighOrgList(){
	var orgFlgVal ="";
	if(($("#eBtnValue").val() == "hwm005btn01")){
		orgFlgVal = $("#fromOrgFlag").val();
	}else if(($("#eBtnValue").val() == "hwm005btn02")){
		orgFlgVal = $("#toOrgFlag").val();
	}else if(($("#eBtnValue").val() == "hwm001btn01")){
		if($("#LCodeType").val()== "div"){
			orgFlgVal ="HQ";
		}else if($("#LCodeType").val()== "fDiv"){
			orgFlgVal ="FAC";
		}
	}else if(($("#eBtnValue").val() == "hwm002btn02")){
		if($("#arrLCodeType").val()== "div"){
			orgFlgVal ="HQ";
		}else if($("#arrLCodeType").val()== "fDiv"){
			orgFlgVal ="FAC";
		}
	}else{
		orgFlgVal = $("#orgFlag").val();
	}
	
	$.ajax({
		type: "post",
		url: "modalSearchHighOrg.do",
		data: "orgFlag="+ orgFlgVal,
		success: function(highOrgList){
			//console.log(highOrgList);
			var str = "";
			if(highOrgList.length==0){
				alert("검색결과가 존재하지 않습니다.");
				$("#modalLowOrgList").html("");
				
				$("#teamChoice").html("");
				$("#teamChoiceVal").val("");
				$("#teamChoiceName").val("");
				$("#divisionChoice").html("");
				$("#divisionChoiceVal").val("");
				$("#divisionChoiceName").val("");
				$("#orgListModal").modal("hide");
				
			}else{
				$.each(highOrgList, function(index) {
					str += "<tr>";
					str += "<td hidden='true'>" + ( highOrgList[index].highOrgCode) + "</td>";
		    		str += "<td>" + ( highOrgList[index].highOrgName) + "</td>";
		    		str += "</tr>"
		    	});
			}
			$("#modalHighOrgList").html(str);
		}
	});
}

function confirmBtnCheck(){
	var getBtnid = event.target.id;
	if(getBtnid="btnHwInfoDetail"){
		if(confirm("해당HW의 정보를 확인하시겠습니까?")){
			$("#simpleHWMovingHistory").modal("hide");
			location.href="hwm101DetailSearch.do?rSeq="+$("#simRSEQ").val()+"&IdentiCode="+$("#simIdentiCode").val();;
		}
	}
}

function phDirectorySave(){
	if(confirm("해당 정보를 저장하시겠습니까?")){
		$.ajax({
			type: "post",
			url: "pdDirectorySave.do",
			data : {
				pd1_name	: $("#pd1_name").val(),
				pd1_tel 	: $("#pd1_tel").val(),
				
				pd2_name 	: $("#pd2_name").val(),
				pd2_tel 	: $("#pd2_tel").val(),
				
				pd3_name 	: $("#pd3_name").val(),
				pd3_tel 	: $("#pd3_tel").val(),
				
				pd4_name 	: $("#pd4_name").val(),
				pd4_tel 	: $("#pd4_tel").val(),
				
				pd5_name 	: $("#pd5_name").val(),
				pd5_tel 	: $("#pd5_tel").val(),
				
				pd6_name 	: $("#pd6_name").val(),
				pd6_tel 	: $("#pd6_tel").val() 
			},
			success: function(data){
				if(data=="S"){
					$("#phoneDirectoryRegister").modal("hide");
					alert("저장이 완료되었습니다.");
				}else{
					alert("저장에 실패하엿습니다.");
				}
			}
		});
	}
	
}

function orgSelectOK(){
	var targetBtn = $("#eBtnValue").val();
	if(targetBtn =="hwm106btn01"){
		$("#highOrgCode").val($("#divisionChoiceVal").val());
		$("#divisionName").html($("#divisionChoiceName").val());
		$("#lowOrgCode").val($("#teamChoiceVal").val());
		$("#teamName").html($("#teamChoiceName").val());
		$("#orgListModal").modal("hide");
	}else if (targetBtn =="hwm107btn01"){
		$("#highOrgCode").val($("#divisionChoiceVal").val());
		$("#divisionName").html($("#divisionChoiceName").val());
		$("#lowOrgCode").val($("#teamChoiceVal").val());
		$("#teamName").html($("#teamChoiceName").val());
		$("#orgListModal").modal("hide");
	}else if (targetBtn =="hwm005btn01"){
		$("#fromHighOrgCode").val($("#divisionChoiceVal").val());
		$("#fromDivisionName").val($("#divisionChoiceName").val());
		$("#fromLowOrgCode").val($("#teamChoiceVal").val());
		$("#fromTeamName").val($("#teamChoiceName").val());
		$("#orgListModal").modal("hide");
	}else if (targetBtn =="hwm005btn02"){
		$("#toHighOrgCode").val($("#divisionChoiceVal").val());
		$("#toDivisionName").val($("#divisionChoiceName").val());
		$("#toLowOrgCode").val($("#teamChoiceVal").val());
		$("#toTeamName").val($("#teamChoiceName").val());
		$("#orgListModal").modal("hide");
	}else if (targetBtn =="swm103btn01"){
		$("#highOrgCode").val($("#divisionChoiceVal").val());
		$("#divisionName").html($("#divisionChoiceName").val());
		$("#lowOrgCode").val($("#teamChoiceVal").val());
		$("#teamName").html($("#teamChoiceName").val());
		$("#orgListModal").modal("hide");
	}else if(targetBtn =="swm104btn01"){
		$("#highOrgCode").val($("#divisionChoiceVal").val());
		$("#divisionName").html($("#divisionChoiceName").val());
		$("#lowOrgCode").val($("#teamChoiceVal").val());
		$("#teamName").html($("#teamChoiceName").val());
		$("#orgListModal").modal("hide");
	}else if(targetBtn =="hwm001btn01"){
		$("#LCode1").val($("#divisionChoiceVal").val());
		$("#LCode1Name").val($("#divisionChoiceName").val());
		$("#LCode2").val($("#divisionChoiceVal").val());
		$("#LCode2Name").val("부서자산");
		$("#orgListModal").modal("hide");
	}else if(targetBtn =="hwm002btn02"){
		$("#arrLCode1").val($("#divisionChoiceVal").val());
		$("#arrLCode1Name").val($("#divisionChoiceName").val());
		$("#arrLCode2").val($("#divisionChoiceVal").val());
		$("#arrLCode2Name").val("부서자산");
		$("#orgListModal").modal("hide");
	}
	
	
	
}

function hwm001Btn01SetEmp(td){
	$("#LCode1Name").val(td.eq(2).text());
	$("#LCode2Name").val(td.eq(1).text());
	$("#LCode1").val(td.eq(4).text());
	$("#LCode2").val(td.eq(0).text());
}

function hwm001Btn01SetTarget(td){
	$("#LCode1Name").val(td.eq(2).text()+" ("+td.eq(4).text()+")");
	$("#LCode2Name").val(td.eq(0).text());
	$("#LCode1").val(td.eq(1).text());
	$("#LCode2").val(td.eq(6).text());
}

function hwm001Btn01SetEtcLocation(td){
	$("#LCode1").val(td.eq(1).text());
	$("#LCode1Name").val(td.eq(0).text());
	$("#LCode2").val(td.eq(1).text());//""
	$("#LCode2Name").val("");
	$("#LCodeType").val($("#etcLCodeType").val());
	
}


function hwm002Btn01SetProduct(td){
	$("#IdentiCode").val(td.eq(5).text());
	$("#ModelName").val(td.eq(6).text());
	$("#ProductDate").val(td.eq(7).text());
	$("#ItemType").val(td.eq(4).text());
	$("#rSeq").val(td.eq(8).text())
	
	$("#startLCode1Name").val(td.eq(0).text());
	$("#startLCode1").val(td.eq(1).text());
	$("#startLCode2Name").val(td.eq(3).text());
	$("#startLCode2").val(td.eq(2).text());
	
	$("#IdentiCode").prop("readonly", true);
	$("#resetBtn02").click();
	$("#arrDate").val(getSysDate());
	
}

function hwm002btn02SetEmp(td){
	$("#arrLCode1").val(td.eq(4).text());
	$("#arrLCode1Name").val(td.eq(2).text());
	$("#arrLCode2").val(td.eq(0).text());
	$("#arrLCode2Name").val(td.eq(1).text());
}

function hwm002btn02SetTarget(td){
	$("#arrLCode1").val(td.eq(1).text());
	$("#arrLCode1Name").val(td.eq(2).text()+" ("+td.eq(4).text()+")");
	$("#arrLCode2").val(td.eq(6).text());
	$("#arrLCode2Name").val(td.eq(0).text());
}

function hwm002btn02SetEtcLocation(td){
	$("#arrLCode1").val(td.eq(1).text());
	$("#arrLCode1Name").val(td.eq(0).text());
	$("#arrLCode2").val(td.eq(1).text());//""
	$("#arrLCode2Name").val("");
	$("#arrLCodeType").val($("#etcLCodeType").val());
	
}

function com002btn01Set(td){
	$("#manageDepName").val(td.eq(2).text());
	$("#manageDep").val(td.eq(4).text());
	$("#manageEmpName").val(td.eq(1).text());
	$("#manageEmp").val(td.eq(0).text());
}

function hwm101btn01SetEmp(td){
	$("#LCode1").val(td.eq(4).text());
	$("#LCode1Name").html(td.eq(2).text());
	$("#LCode2").val(td.eq(0).text());
	$("#LCode2Name").html(td.eq(1).text());
}

function hwm101btn01SetTarget(td){
	$("#LCode1").val(td.eq(1).text());
	$("#LCode1Name").html(td.eq(2).text()+" ("+td.eq(4).text()+")");
	$("#LCode2").val(td.eq(6).text());
	$("#LCode2Name").html(td.eq(0).text());
}

function hwm101btn01SetEtcLocation(td){
	$("#LCode1").val(td.eq(1).text());
	$("#LCode1Name").html(td.eq(0).text());
	$("#LCode2").val(td.eq(1).text());//""
	$("#LCode2Name").html("");
	$("#LCodeType").val($("#etcLCodeType").val());
}

function hwm102btn01SetEmp(td){
	$("#arrLCode1").val(td.eq(4).text());
	$("#arrLCode1Name").html(td.eq(2).text());
	$("#arrLCode2").val(td.eq(0).text());
	$("#arrLCode2Name").html(td.eq(1).text());
}

function hwm102btn01SetTarget(td){
	$("#arrLCode1").val(td.eq(1).text());
	$("#arrLCode1Name").html(td.eq(2).text()+" ("+td.eq(4).text()+")");
	$("#arrLCode2").val(td.eq(6).text());
	$("#arrLCode2Name").html(td.eq(0).text());
}

function hwm102btn01SetEtcLocation(td){
	$("#arrLCode1").val(td.eq(1).text());
	$("#arrLCode1Name").html(td.eq(0).text());
	$("#arrLCode2").val(td.eq(1).text());//""
	$("#arrLCode2Name").html("");
	$("#arrLCodeType").val($("#etcLCodeType").val());
}

function swm003btn01SetEtcLocation(td){
	$("#LCode1").val(td.eq(1).text());
	$("#LCode1Name").val(td.eq(0).text());
	$("#LCode2").val(td.eq(1).text());
	$("#LCodeType").val($("#etcLCodeType").val());
}

function swm002btn01SetEmp(td){
	$("#empCode").val(td.eq(0).text());
	$("#empName").val(td.eq(1).text());
	
}

function swm002btn01SetTarget(td){
	$("#divisionCode").val(td.eq(1).text());
	$("#divisionName").val(td.eq(2).text()+" ("+td.eq(4).text()+")");
	$("#empCode").val(td.eq(6).text());
	$("#empName").val(td.eq(0).text());
}


function swm004Btn01SetProduct(td){
	console.log("------------------------");
	console.log(td);
	$("#IdentiCode").val(td.eq(5).text());
	$("#ModelName").val(td.eq(6).text());
	$("#ProductDate").val(td.eq(7).text());
	$("#ItemType").val(td.eq(4).text());
	$("#rSeq").val(td.eq(8).text())
	
}

function tot101btn01SetEmp(td){
	$("#empCode").val(td.eq(0).text());
	$("#empName").val(td.eq(1).text());
	
}

function tot101btn01SetTarget(td){
	$("#divisionCode").val(td.eq(1).text());
	$("#divisionName").val(td.eq(2).text()+" ("+td.eq(4).text()+")");
	$("#empCode").val(td.eq(6).text());
	$("#empName").val(td.eq(0).text());
}

</script>