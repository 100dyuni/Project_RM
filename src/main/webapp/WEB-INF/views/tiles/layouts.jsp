<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>Enex Resource Management </title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="css/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="css/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="css/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
 
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col ">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="adminMain.do" class="site_title"><i class="fa fa-paw"></i> <span>Enex </span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/pro1.jpg" alt="..." class="img-circle profile_img" >	<!-- 이미지 프로필 파일 --> 
              </div>
              <div class="profile_info">
                <span>${sessionScope.usrDepName}</span>
                <h2>${sessionScope.usrName}</h2><!-- 프로필 이름 -->
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br/>

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <!--메인메뉴  -->
              <div class="menu_section">
              	<h3>메인화면</h3> 
              	<ul class="nav side-menu">
              		<!-- <li><a href="javascript:void(0)"><i class="fa fa-home"></i> Home</a></li>  -->
              		<li><a href="adminMain.do"><i class="fa fa-home"></i> Home</a></li> 
              	</ul>
              </div>
              
              <!--HW관리  -->
              <div class="menu_section">
              	<h3> H/W관리 </h3> 
              	<ul class="nav side-menu">
              		<li><a><i class="fa fa-desktop"></i>H/W 조회 <span class="fa fa-chevron-down"></span></a>
	                	<ul class="nav child_menu">
	                      <li><a href="hwm101.do">HW 전체조회</a></li>
	                      <li><a href="hwm106.do">부서별 HW자산조회</a></li>
	                      <li><a href="hwm107.do">연차별 자산 리스트</a></li>
	                      <li><a href="hwm102.do">이동내역 조회</a></li>
	                      <li><a href="hwm104.do">폐기리스트 조회</a></li>
	                    </ul>
                  	</li>
                  	<li><a><i class="fa fa-edit"></i>H/W 등록 <span class="fa fa-chevron-down"></span></a>
	                	<ul class="nav child_menu">
	                      <li><a href="hwm001.do">HW자산등록</a></li>
	                      <li><a href="hwm002.do">이동내역 등록</a></li>
	                      <li><a href="hwm004.do">폐기리스트 작성</a></li>
	                      <li><a href="hwm005.do">HW조직 이동</a></li>
	                    </ul>
                  	</li>
              	</ul>
              </div>
              
              <!-- SW관리 -->
              <div class="menu_section">
              	<h3> S/W관리 </h3> 
              	<ul class="nav side-menu">
              		<li><a><i class="fa fa-desktop"></i>S/W 조회 <span class="fa fa-chevron-down"></span></a>
	                	<ul class="nav child_menu">
	                      <li><a href="swm101.do">S/W 구매내역 조회</a></li>
	                      <li><a href="swm102.do">S/W 수량 조회</a></li>
	                      <li><a href="swm103.do">S/W 관리 대장</a></li>
	                      <li><a href="swm105.do">S/W 별 분포현황</a></li>
	                      <li><a href="swm104.do">부서별 S/W 내역조회</a></li>
	                      
	                    </ul>
                  	</li>
              		<li><a><i class="fa fa-edit"></i>S/W 등록 <span class="fa fa-chevron-down"></span></a>
	                	<ul class="nav child_menu">
	                      <li><a href="swm001.do">S/W 라이센스 구매</a></li>
	                      <li><a href="swm002.do">S/W 라이센스 분배(직원)</a></li>
	                      <li><a href="swm003.do">S/W 라이센스 분배(기타)</a></li>
	                      <li><a href="swm004.do">S/W 라이센스 분배(Test)</a></li>
	                    </ul>
                  	</li>
              	</ul>
              </div>
              
              <!--종합관리  -->
              <div class="menu_section">
              	<h3> 종합관리 </h3> 
              	<ul class="nav side-menu">
              		<li><a><i class="fa fa-database"></i>관리 <span class="fa fa-chevron-down"></span></a>
	                	<ul class="nav child_menu">
	                      <li><a href="tot101.do">사용자 분배 현황</a></li>
	                      <li><a href="tot102.do">퇴사자 확인</a></li>
	                      <li><a href="tot103.do">미반납 자원 회수</a></li>
	                      <li><a href="main.do">일반유저 메인화면</a></li>
	                    </ul>
                  	</li>
              	</ul>
              </div>
 			  
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="코드관리" href="com001.do">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="매장관리" href="com002.do">
                <span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="조직관리" href="com003.do">
                <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="logout.do">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/pro1.jpg" alt="">${sessionScope.usrName}
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="logout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="content">
         	<!--  메인 페이지 입니다 하아아아ㅏㅇ  -->
        	<tiles:insertAttribute name="content" />
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <a>ENEX Resource Management System</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
        <!-- 모달 사용 테스트  -->
        <tiles:insertAttribute name="modal"/>
      </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="js/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="js/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="js/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="js/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="js/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="js/skycons.js"></script>
    <!-- Flot -->
    <script src="js/jquery.flot.js"></script>
    <script src="js/jquery.flot.pie.js"></script>
    <script src="js/jquery.flot.time.js"></script>
    <script src="js/jquery.flot.stack.js"></script>
    <script src="js/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="js/jquery.flot.orderBars.js"></script>
    <script src="js/jquery.flot.spline.min.js"></script>
    <script src="js/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="js/date.js"></script>
    
   
    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>
    
	 <!-- bootstrap-daterangepicker -->
    <script src="js/moment.min.js"></script>
    <script src="js/daterangepicker.js"></script>
	<!-- bootstrap-datetimepicker -->
	<link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
	<script src="js/bootstrap-datetimepicker.min.js"></script>
	
	

	
	<script type="text/javascript">

	function getSysDate(){
 		var d = new Date();
		return getDateStr(d);
 	}
	
	function getDateStr(myDate){
		var yyyy = myDate.getFullYear() ;
		var mm = myDate.getMonth() + 1 ;
		var dd = myDate.getDate();
		if(dd<10) {
 		    dd='0'+dd
 		} 
 		if(mm<10) {
 		    mm='0'+mm
 		} 
		return yyyy+'.'+mm+'.'+dd;
	}
	
	function getLastMonth() {
		  var d = new Date();
		  var monthOfYear = d.getMonth();
		  d.setMonth(monthOfYear - 1);
		  return getDateStr(d);
	}
	
	function getLastYear(){
		var d = new Date();
		var year = d.getFullYear();
		d.setYear(year -1);
		return getDateStr(d);
	}

	function get_1Year_Later(){
		var d = new Date();
		var year = d.getFullYear();
		d.setYear(year +1);
		return getDateStr(d);
	}
	
	function setSelectBox(obj,code){
		$.ajax({
			type: "post",
			url: "createSelectBox.do",
			data: "highCode="+code,
			success: function(data){
				var str = "";
		    	$.each(data, function(index) {
		    		str += "<option value='"+data[index].lowCode +"'>"+data[index].lowCodeName+"</option>";
		    	});
				obj = "#"+obj;
				$(obj).html(str);
				
			}
		});
	}

	function PNotifyAlert(iType,iTitle,iText){
		new PNotify({
	        title: iTitle,
	        text: iText,
	        type: iType,//success info error info
	        styling: 'bootstrap3'
    	});
	}
	
	function PNotifyAlertD(iTitle,iText){
		new PNotify({
			 title: iTitle,
	         text:  iText,
	         type: 'info',
	         hide: false,
	         styling: 'bootstrap3',
	         addclass: 'dark'	
		})
	}
	
	</script>
  </body>
</html>