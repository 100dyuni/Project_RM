<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery.min.js"></script>


<!-- 문의 번호 -->
<!-- 우선적으론 하드코딩 -->
<div class="modal fade" id="phoneDirectory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
		                    	<th colspan="1">컴퓨터, MS 설치 문의</th>
		                    	<th></th>
		                    </tr>
		                </thead>
		                <tbody id="pdTable1">
		                	
		                </tbody>
		            </table>
            
		            <table class="table table-hover jambo_table bulk_action" id="phoneDirectTable2">
		            	<thead >
		                	<tr class="center">
		                    	<th colspan="1">Adobe, Cad 설치 문의</th>
		                    	<th></th>
		                    </tr>
		                </thead>
		                <tbody id="pdTable2">
		                	
		                </tbody>
		            </table>
		            
		            <table class="table table-hover jambo_table bulk_action" id="phoneDirectTable3">
		            	<thead >
		                	<tr class="center">
		                    	<th colspan="1">PC 포맷</th>
		                    	<th></th>
		                    </tr>
		                </thead>
		                <tbody id="pdTable3">
		                	
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



<script type="text/javascript">

$(document).ready(function(){

	$('#phoneDirectory').on('show.bs.modal', function (event) {
		$.ajax({
			type: "post",
			url: "phoneDirecSearch.do",
			success: function(data){
				var str1="";
				var str2="";
				var str3="";
				
				if(data.length>0){
					for(var i=0; i<data.length; i++){
						if((data[i].pdFlag == "pd1")||(data[i].pdFlag == "pd2")){
							str1 += "<tr>";
							str1 += "	<td width='150px'>"+ data[i].name +"</td>";
							str1 += "	<td>"+ data[i].tel +"</td>";
							str1 += "</tr>";
						}
						
						if((data[i].pdFlag == "pd3")||(data[i].pdFlag == "pd4")){
							str2 += "<tr>";
							str2 += "	<td width='150px'>"+ data[i].name +"</td>";
							str2 += "	<td>"+ data[i].tel +"</td>";
							str2 += "</tr>";
						}
						
						if((data[i].pdFlag == "pd5")||(data[i].pdFlag == "pd6")){
							str3 += "<tr>";
							str3 += "	<td width='150px'>"+ data[i].name +"</td>";
							str3 += "	<td>"+ data[i].tel +"</td>";
							str3 += "</tr>";
						}
							
					}
				}
				$("#pdTable1").html(str1);
				$("#pdTable2").html(str2);
				$("#pdTable3").html(str3);
				
			}
		});
		
	})
	
	
})



</script>