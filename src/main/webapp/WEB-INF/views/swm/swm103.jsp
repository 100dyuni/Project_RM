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
		    	<h3>S/W 관리 대장</h3>
		    </div>
		    <div class="title_right">
		    	<div class=" col-xs-7 col-sm-5 col-md-3 col-lg-2 form-group pull-right">
		        	<div class="input-group ">
		            	<span class="input-group-btn">
		            		<span>
		            			<button class="btn btn-dark" type="button" onclick="swm103Search()"><i class="fa fa-file-text-o">&nbsp;&nbsp;조회</i></button>
		                		<!-- <button class="btn btn-dark" type="button" onclick="swm103Excel()"><i class="fa fa-file-excel-o">&nbsp;&nbsp;엑셀</i></button> -->
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
				<form class="form-horizontal" name="swm103form01" id ="swm103form01" method="get" action="swm103Excel.do" accept-charset="utf-8">
					<div class="col-md-1 col-xs-10">
						<label class="control-label">조직 구분</label>
					</div>
					<div class="col-md-2 col-xs-10">
						<div class="input-group">
							<select class="select2_single form-control" tabindex="-1" id="orgFlag" name="orgFlag" >
					      	</select>
					      	<span class="input-group-btn">
			                   	<button type="button" class="btn btn-dark" onclick="popModalChek()" id="swm103btn01" name="swm103btn01">검색</button>
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
						  	
					<div class="col-md-1 col-xs-10 checkbox">
						<label><input type="checkbox" id="swTypeCheck" name="swTypeCheck" checked="checked">S/W 종류</label>
					</div>
					<div class="col-md-2 col-xs-10">
						<select class="select2_single form-control" tabindex="-1" required="required" id="swType" name="swType">
						</select>
					</div>
					
				</form>
			</div>
		</div>
		
		<div class="x_panel">
			<div class = "x_content">
				<form class="form-horizontal" name="swm103form02" id ="swm103form02">
					<div class="table-responsive">
						<table class="table table-hover table-bordered " style="table-layout: fixed" id="searchswm103Table"><!-- bulk_action -->
			            	<thead id="swm103TableHead">
			                	
			                </thead>
			                <tbody id ="swm103TableBody">
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
		setSelectBox("orgFlag","orgFlag");	
		setSelectBox("swType","swLicence");
		
		$("#swm103TableBody").on("dblclick","tr",function(event){
			var tr = $(this);
			var td = tr.children();
			
			var highOrgCode = td.eq(0).text();
			var divisionName = td.eq(1).text();
			//alert(highOrgCode + " - " + divisionName);
			if(confirm(divisionName + "\n상세페이지로 이동하시겠습니까?")){
				location.href="swm103depSwSearch.do?highOrgCode="+highOrgCode+"&divisionName="+divisionName +"&orgFlag="+$("#orgFlag").val();
			}
		});
		
 	});
 		
	function popModalChek(){
		var eObject = event.target;
 		$("#eBtnValue").val(eObject.id);
 		$("#orgListModal").modal();
 		/* if(eObject.id=="swm103btn01"){
 			if(($("#orgFlag").val()=="HQ") || ($("#orgFlag").val()=="REG") || ($("#orgFlag").val()=="FAC") ){
 				$("#searchEMP").modal();	
 			}else if($("#orgFlag").val()=="AGEN"){
 				$("#searchTarget").modal();
 			}
 		} */
 		
	}
	
	function swm103Search(){
		var dataSetFlg = 0;
		
		if(document.getElementById("swTypeCheck").checked ==false){
			setTableHeadAllData();
			dataSetFlg = 1;
		}else{
			if($("#swType").val() =="msOffice"){
				setTableHeadMSoffice();
				dataSetFlg = 2;
			}else if ($("#swType").val() == "hangul"){
				setTableHeadHangul();
				dataSetFlg = 3;
			}else if ($("#swType").val() =="adobe"){
				setTableHeadAdobe();
				dataSetFlg = 4;
			}else if ($("#swType").val() =="graphic"){
				setTableHeadGraphic();
				dataSetFlg = 5;
			}else if ($("#swType").val() =="cad"){
				setTableHeadCad();
				dataSetFlg = 6;
			}else if ($("#swType").val() =="swEtc"){
				setTableHeadSwEtc();
				dataSetFlg = 7;
			}
		}
		
		
		setTableMiddleData(dataSetFlg);

		$.ajax({
			type : "post",
			url : "searchSwManageRegister.do",
			async : true,
			data : {
				orgFlag	: $("#orgFlag").val(),
				highOrgCode	: document.getElementById("divisionCheck").checked == true ? $("#highOrgCode").val() :"",
				lowOrgCode	: document.getElementById("teamCheck").checked == true ? $("#lowOrgCode").val() :"",
				swType 		: document.getElementById("swTypeCheck").checked == true ? $("#swType").val() :""
			},
			success : function(searchData){
				var str = "";
				console.log(searchData);
				if(searchData.length==0){
					PNotifyAlert("info","","검색결과가 존재하지 않습니다.");
				}else{
					$.each(searchData, function(index) {
						str += "<tr>";
						str += "	<td hidden='true'>"+ searchData[index].highOrgCode +"</td>";
				    	str += "	<td>"+ searchData[index].highOrgName +"</td>";
				    	str += "	<td hidden='true'>"+ searchData[index].lowOrgCode +"</td>";
				    	str += "	<td>"+ searchData[index].lowOrgName +"</td>";
				    	
				    	if((dataSetFlg==1) ||(dataSetFlg==2)){
				    		if(searchData[index].m2016Pro == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2016Pro +"</td>";
					    	}
				    		
				    		if(searchData[index].m2016Std == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2016Std +"</td>";
					    	}
				    		
				    		if(searchData[index].m2013Pro == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2013Pro +"</td>";
					    	}
				    		
				    		if(searchData[index].m2013Std == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2013Std +"</td>";
					    	}
				    		
				    		if(searchData[index].m2010Std == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2010Std +"</td>";
					    	}
				    		
				    		if(searchData[index].m2007Pro == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2007Pro +"</td>";
					    	}
				    		
				    		if(searchData[index].m2007Std == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2007Std +"</td>";
					    	}
				    		
				    		if(searchData[index].m2003Pro == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2003Pro +"</td>";
					    	}
				    		
				    		if(searchData[index].m2003Std == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2003Std +"</td>";
					    	}
				    		
				    		if(searchData[index].m2002Std == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2002Std +"</td>";
					    	}
				    		
				    		if(searchData[index].m2002Excel == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m2002Excel +"</td>";
					    	}
				    		
				    		if(searchData[index].m97Pro == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m97Pro +"</td>";
					    	}
				    		
				    		if(searchData[index].m97Excel == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].m97Excel +"</td>";
					    	}
				    		
				    		
				    	}
						
				    	if((dataSetFlg==1) ||(dataSetFlg==3)){
				    		if(searchData[index].h2014Neo == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h2014Neo +"</td>";
					    	}
				    		
				    		if(searchData[index].h2014Vp == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h2014Vp +"</td>";
					    	}
				    		
				    		if(searchData[index].h2014 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h2014 +"</td>";
					    	}
				    		
				    		if(searchData[index].h2010 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h2010 +"</td>";
					    	}
				    		
				    		if(searchData[index].h2007 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h2007 +"</td>";
					    	}
				    		
				    		if(searchData[index].h2005 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h2005 +"</td>";
					    	}
				    		
				    		if(searchData[index].h2002 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h2002 +"</td>";
					    	}
				    		
				    		if(searchData[index].h97 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].h97 +"</td>";
					    	}
				    		
				    	}

				    	if((dataSetFlg==1) ||(dataSetFlg==4)){
				    		if(searchData[index].A_ill_CC == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_ill_CC +"</td>";
					    	}
				    		
				    		if(searchData[index].A_PS_CC == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_PS_CC +"</td>";
					    	}
				    		
				    		if(searchData[index].DW_CC == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].DW_CC +"</td>";
					    	}
				    		
				    		if(searchData[index].A_Compl == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_Compl +"</td>";
					    	}
				    		
				    		if(searchData[index].A_CS6 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_CS6 +"</td>";
					    	}
				    		
				    		if(searchData[index].A_CS5 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_CS5 +"</td>";
					    	}
				    		
				    		if(searchData[index].PS_CS5 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].PS_CS5 +"</td>";
					    	}
				    		
				    		if(searchData[index].CS4Pre == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].CS4Pre +"</td>";
					    	}
				    		
				    		if(searchData[index].A_CS4 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_CS4 +"</td>";
					    	}
				    		
				    		if(searchData[index].ill_CS4 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].ill_CS4 +"</td>";
					    	}
				    		

				    		if(searchData[index].A_CS3 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_CS3 +"</td>";
					    	}
				    		
				    		if(searchData[index].A_CS2 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_CS2 +"</td>";
					    	}
				    		
				    		if(searchData[index].A_CS == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].A_CS +"</td>";
					    	}
				    		
				    		if(searchData[index].PS_CS3 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].PS_CS3 +"</td>";
					    	}
				    		
				    		if(searchData[index].PS_CS2 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].PS_CS2 +"</td>";
					    	}
				    		
				    		if(searchData[index].PS_CS == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].PS_CS +"</td>";
					    	}
				    		
				    		if(searchData[index].ill_10 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].ill_10 +"</td>";
					    	}
				    	
				    	}

				    	if((dataSetFlg==1) ||(dataSetFlg==5)){
				    		
				    		if(searchData[index].g3DMax == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].g3DMax +"</td>";
					    	}
				    		
				    		if(searchData[index].Sketchup7 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].Sketchup7 +"</td>";
					    	}
				    		
				    		if(searchData[index].Vray3 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].Vray3 +"</td>";
					    	}
				    		
				    		
				    		
				    	}

				    	if((dataSetFlg==1) ||(dataSetFlg==6)){
				    		
				    		if(searchData[index].c2014 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].c2014 +"</td>";
					    	}
				    		
				    		if(searchData[index].c2007 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].c2007 +"</td>";
					    	}
				    		
				    		if(searchData[index].R14 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].R14 +"</td>";
					    	}
				    		
				    		
				    	}

				    	if((dataSetFlg==1) ||(dataSetFlg==7)){
				    		
				    		if(searchData[index].VS2008 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].VS2008 +"</td>";
					    	}
				    		
				    		if(searchData[index].VS2013 == 0){
				    			str += "	<td></td>";
					    	}else{
				    			str += "	<td>"+ searchData[index].VS2013 +"</td>";
					    	}
				    	}
				    	
				    	str += "</tr>";
						
			    	});
				}
				$("#swm103TableBody").html(str);
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
	}
		
	function swm103Excel(){
		document.swm103form01.submit();	
	}
	
	function setTableHeadAllData(){
		var str = "";
		
		str += "<tr class='headings center' bgcolor='#EEEEEE'>";
		str += "	<th width='100px' hidden='true'>부서코드</th>";
		str += "	<th width='100px'>부서명</th>";
		str += "	<th width='100px' hidden='true'>팀코드</th>";
		str += "	<th width='100px'>팀명</th>";
		str += "	<th width='60px'>오피스 2016 PRO</th>";
		str += "	<th width='60px'>오피스 2016 STD</th>";
		str += "	<th width='60px'>오피스 2013 PRO</th>";
		str += "	<th width='60px'>오피스 2013 STD</th>";
		str += "	<th width='60px'>오피스 2010 STD</th>";
		str += "	<th width='60px'>오피스 2007 PRO</th>";
		str += "	<th width='60px'>오피스 2007 STD</th>";
		str += "	<th width='60px'>오피스 2003 PRO</th>";
		str += "	<th width='60px'>오피스 2003 STD</th>";
		str += "	<th width='60px'>오피스 2002 STD</th>";
		str += "	<th width='60px'>엑셀 2002</th>";
		str += "	<th width='60px'>오피스 97 Pro</th>";
		str += "	<th width='60px'>엑셀 97</th>";

		str += "	<th width='60px'>한글 2014 Neo</th>";
		str += "	<th width='60px'>한글 2014 Vp</th>";
		str += "	<th width='60px'>한글 2014</th>";
		str += "	<th width='60px'>한글 2010</th>";
		str += "	<th width='60px'>한글 2007</th>";
		str += "	<th width='60px'>한글 2005</th>";
		str += "	<th width='60px'>한글 2002</th>";
		str += "	<th width='60px'>한글 97</th>";

		str += "	<th width='60px'>Adobe ill CC</th>";
		str += "	<th width='60px'>Adobe PS CC</th>";
		str += "	<th width='60px'>Dream Weaver CC</th>";
		str += "	<th width='60px'>Adobe Compl</th>";
		str += "	<th width='60px'>Adobe CS6</th>";
		str += "	<th width='60px'>Adobe CS5</th>";
		str += "	<th width='60px'>Photo Shop CS5.5</th>";
		str += "	<th width='60px'>CS4 Web Premi</th>";
		str += "	<th width='60px'>Adobe CS4</th>";
		str += "	<th width='60px'>Illust CS4</th>";
		str += "	<th width='60px'>Adobe CS3</th>";
		str += "	<th width='60px'>Adobe CS2</th>";
		str += "	<th width='60px'>Adobe CS</th>";
		str += "	<th width='60px'>Photo Shop CS3</th>";
		str += "	<th width='60px'>Photo Shop CS2</th>";
		str += "	<th width='60px'>Photo Shop CS</th>";
		str += "	<th width='60px'>Illust10</th>";

		str += "	<th width='60px'>3D Max</th>";
		str += "	<th width='60px'>Sketch up 7</th>";
		str += "	<th width='60px'>V-RAY 3</th>";

		str += "	<th width='60px'>캐드 2014</th>";
		str += "	<th width='60px'>캐드 2007</th>";
		str += "	<th width='60px'>캐드 R14</th>";

		str += "	<th width='60px'>VS2008</th>";
		str += "	<th width='60px'>VS2013</th>";

		str += "</tr>";
		
		$("#swm103TableHead").html(str);
 		
 	}
	
	function setTableHeadMSoffice(){
		var str = "";
		
		str += "<tr class='headings center' bgcolor='#EEEEEE'>";
		str += "	<th width='100px' hidden='true'>부서코드</th>";
		str += "	<th width='100px'>부서명</th>";
		str += "	<th width='100px' hidden='true'>팀코드</th>";
		str += "	<th width='100px'>팀명</th>";
		str += "	<th width='60px'>오피스 2016 PRO</th>";
		str += "	<th width='60px'>오피스 2016 STD</th>";
		str += "	<th width='60px'>오피스 2013 PRO</th>";
		str += "	<th width='60px'>오피스 2013 STD</th>";
		str += "	<th width='60px'>오피스 2010 STD</th>";
		str += "	<th width='60px'>오피스 2007 PRO</th>";
		str += "	<th width='60px'>오피스 2007 STD</th>";
		str += "	<th width='60px'>오피스 2003 PRO</th>";
		str += "	<th width='60px'>오피스 2003 STD</th>";
		str += "	<th width='60px'>오피스 2002 STD</th>";
		str += "	<th width='60px'>엑셀 2002</th>";
		str += "	<th width='60px'>오피스 97 Pro</th>";
		str += "	<th width='60px'>엑셀 97</th>";
		str += "</tr>";
		
		$("#swm103TableHead").html(str);
	}
	
	function setTableHeadHangul(){
		var str = "";
		
		str += "<tr class='headings center' bgcolor='#EEEEEE'>";
		str += "	<th width='100px' hidden='true'>부서코드</th>";
		str += "	<th width='100px'>부서명</th>";
		str += "	<th width='100px'hidden='true' >팀코드</th>";
		str += "	<th width='100px'>팀명</th>";
		str += "	<th width='60px'>한글 2014 Neo</th>";
		str += "	<th width='60px'>한글 2014 Vp</th>";
		str += "	<th width='60px'>한글 2014</th>";
		str += "	<th width='60px'>한글 2010</th>";
		str += "	<th width='60px'>한글 2007</th>";
		str += "	<th width='60px'>한글 2005</th>";
		str += "	<th width='60px'>한글 2002</th>";
		str += "	<th width='60px'>한글 97</th>";
		str += "</tr>";
		
		$("#swm103TableHead").html(str);
	}
	
	function setTableHeadAdobe(){
		var str = "";
		
		str += "<tr class='headings center' bgcolor='#EEEEEE'>";
		str += "	<th width='100px' hidden='true'>부서코드</th>";
		str += "	<th width='100px'>부서명</th>";
		str += "	<th width='100px' hidden='true'>팀코드</th>";
		str += "	<th width='100px'>팀명</th>";
		str += "	<th width='60px'>Adobe ill CC</th>";
		str += "	<th width='60px'>Adobe PS CC</th>";
		str += "	<th width='60px'>Dream Weaver CC</th>";
		str += "	<th width='60px'>Adobe Compl</th>";
		str += "	<th width='60px'>Adobe CS6</th>";
		str += "	<th width='60px'>Adobe CS5</th>";
		str += "	<th width='60px'>Photo Shop CS5.5</th>";
		str += "	<th width='60px'>CS4 Web Premi</th>";
		str += "	<th width='60px'>Adobe CS4</th>";
		str += "	<th width='60px'>Illust CS4</th>";
		str += "	<th width='60px'>Adobe CS3</th>";
		str += "	<th width='60px'>Adobe CS2</th>";
		str += "	<th width='60px'>Adobe CS</th>";
		str += "	<th width='60px'>Photo Shop CS3</th>";
		str += "	<th width='60px'>Photo Shop CS2</th>";
		str += "	<th width='60px'>Photo Shop CS</th>";
		str += "	<th width='60px'>Illust10</th>";
		str += "</tr>";
		
		$("#swm103TableHead").html(str);
	}
	
	function setTableHeadGraphic(){
		var str = "";
		
		str += "<tr class='headings center' bgcolor='#EEEEEE'>";
		str += "	<th width='100px' hidden='true'>부서코드</th>";
		str += "	<th width='100px'>부서명</th>";
		str += "	<th width='100px' hidden='true'>팀코드</th>";
		str += "	<th width='100px'>팀명</th>";
		str += "	<th width='60px'>3D Max</th>";
		str += "	<th width='60px'>Sketch up 7</th>";
		str += "	<th width='60px'>V-RAY 3</th>";
		str += "</tr>";
		
		$("#swm103TableHead").html(str);
	}
	
	function setTableHeadCad(){
		var str = "";
		
		str += "<tr class='headings center' bgcolor='#EEEEEE'>";
		str += "	<th width='100px' hidden='true'>부서코드</th>";
		str += "	<th width='100px'>부서명</th>";
		str += "	<th width='100px' hidden='true'>팀코드</th>";
		str += "	<th width='100px'>팀명</th>";
		str += "	<th width='60px'>캐드 2014</th>";
		str += "	<th width='60px'>캐드 2007</th>";
		str += "	<th width='60px'>캐드 R14</th>";
		str += "</tr>";
		
		$("#swm103TableHead").html(str);
	}
	
	function setTableHeadSwEtc(){
		var str = "";
		
		str += "<tr class='headings center' bgcolor='#EEEEEE'>";
		str += "	<th width='100px' hidden='true'>부서코드</th>";
		str += "	<th width='100px'>부서명</th>";
		str += "	<th width='100px' hidden='true'>팀코드</th>";
		str += "	<th width='100px'>팀명</th>";
		str += "	<th width='60px'>VS2008</th>";
		str += "	<th width='60px'>VS2013</th>";
		str += "</tr>";
		
		$("#swm103TableHead").html(str);
	}
	
	function setTableMiddleData(dataSetFlg){
		//console.log("setTableMiddleData");
		var str = $("#swm103TableHead").html();
		//console.log(headStr);
		$.ajax({
			type : "post",
			url : "swm103MiddleData.do",
			async : true,
			success : function(data){
				$.each(data, function(index) {
					str += "<tr bgcolor='#EEEEEE'>";
					str += "	<th hidden='true'></th>";
					str += "	<th >"+ data[index].Flag +"</th>";
					str += "	<th hidden='true'></th>";
					if(index==1){
						str += "	<th>조직 구분 x</th>";
					}else{
						str += "	<th></th>";	
					}
					
					if((dataSetFlg==1) ||(dataSetFlg==2)){
						str += "	<th>"+ data[index].m2016Pro +"</th>";
						str += "	<th>"+ data[index].m2016Std +"</th>";
						str += "	<th>"+ data[index].m2013Pro +"</th>";
						str += "	<th>"+ data[index].m2013Std +"</th>";
						str += "	<th>"+ data[index].m2010Std +"</th>";
						str += "	<th>"+ data[index].m2007Pro +"</th>";
						str += "	<th>"+ data[index].m2007Std +"</th>";
						str += "	<th>"+ data[index].m2003Pro +"</th>";
						str += "	<th>"+ data[index].m2003Std +"</th>";
						str += "	<th>"+ data[index].m2002Std +"</th>";
						str += "	<th>"+ data[index].m2002Excel +"</th>";
						str += "	<th>"+ data[index].m97Pro +"</th>";
						str += "	<th>"+ data[index].m97Excel +"</th>";
					}
											
					if((dataSetFlg==1) ||(dataSetFlg==3)){
						str += "	<th>"+ data[index].h2014Neo +"</th>";
						str += "	<th>"+ data[index].h2014Vp +"</th>";
						str += "	<th>"+ data[index].h2014 +"</th>";
						str += "	<th>"+ data[index].h2010 +"</th>";
						str += "	<th>"+ data[index].h2007 +"</th>";
						str += "	<th>"+ data[index].h2005 +"</th>";
						str += "	<th>"+ data[index].h2002 +"</th>";
						str += "	<th>"+ data[index].h97 +"</th>";
					}

					if((dataSetFlg==1) ||(dataSetFlg==4)){
						str += "	<th>"+ data[index].A_ill_CC +"</th>";
						str += "	<th>"+ data[index].A_PS_CC +"</th>";
						str += "	<th>"+ data[index].DW_CC +"</th>";
						str += "	<th>"+ data[index].A_Compl +"</th>";
						str += "	<th>"+ data[index].A_CS6 +"</th>";
						str += "	<th>"+ data[index].A_CS5 +"</th>";
						str += "	<th>"+ data[index].PS_CS5 +"</th>";
						str += "	<th>"+ data[index].CS4Pre +"</th>";
						str += "	<th>"+ data[index].A_CS4 +"</th>";
						str += "	<th>"+ data[index].ill_CS4 +"</th>";
						str += "	<th>"+ data[index].A_CS3 +"</th>";
						str += "	<th>"+ data[index].A_CS2 +"</th>";
						str += "	<th>"+ data[index].A_CS +"</th>";
						str += "	<th>"+ data[index].PS_CS3 +"</th>";
						str += "	<th>"+ data[index].PS_CS2 +"</th>";
						str += "	<th>"+ data[index].PS_CS +"</th>";
						str += "	<th>"+ data[index].ill_10 +"</th>";
					}

					if((dataSetFlg==1) ||(dataSetFlg==5)){
						str += "	<th>"+ data[index].g3DMax +"</th>";
						str += "	<th>"+ data[index].Sketchup7 +"</th>";
						str += "	<th>"+ data[index].Vray3 +"</th>";	
					}

					if((dataSetFlg==1) ||(dataSetFlg==6)){
						str += "	<th>"+ data[index].c2014 +"</th>";
						str += "	<th>"+ data[index].c2007 +"</th>";
						str += "	<th>"+ data[index].R14 +"</th>";	
					}

					if((dataSetFlg==1) ||(dataSetFlg==7)){
						str += "	<th>"+ data[index].VS2008 +"</th>";
						str += "	<th>"+ data[index].VS2013 +"</th>";
					}

					str += "</tr>";



											
			    });
				
				$("#swm103TableHead").html(str);
				
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("조회에 실패하였습니다.");
			}
			
		});
	}
</script>