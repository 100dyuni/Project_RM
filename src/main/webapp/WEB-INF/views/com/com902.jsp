<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="x_panel" style="height: 800px;">
	<!-- 타이틀 -->
	<div class="x_title">
		<h2>병원검색</h2>
		<ul class="nav navbar-right panel_toolbox"></ul>
		<div class="clearfix"></div>
	</div>
	<!-- 데이터 입력부분 -->
	<div class="x_content">
		<form method="post" id="findHospitalForm">
			<label>병원 이름 : </label> <input type="text" name="hospitalName"
				id="hospitalName"><br> <label>병원 주소 : </label> <input
				type="text" name="hospitalAddress" id="hospitalAddress"><br>
			<%-- <input type="hidden" name="petOwnerNo" value="${sessionScope.loginVO.petOwnerNo}"> --%>
			<!-- <input type="hidden" id ="petName" name="petVO[0].petName"> -->
			<input type="hidden" id="page" name="page">
			<button type="button" class="btn btn-default" id="hospitalFindBtn">검색</button>
		</form>
		<hr>
		<table
			class="table table-striped responsive-utilities jambo_table bulk_action">
			<thead id='hospitalInfo'>
				<!-- <th class="bulk-actions" colspan="7"><a class="antoo"
					style="color: #fff; font-weight: 500;">Bulk Actions ( <span
						class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
				</th> -->
			</thead>
			<!-- 페이지 부분 -->
			<tbody id='hospitalListInfo'>

			</tbody>
		</table>
	</div>
</div>

