<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Page not found</title>

    <!-- Custom fonts for this template-->
   <link href="<c:url value='/assets/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
		type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="<c:url value='/assets/css/sb-admin-2.min.css'/>" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column mt-5" style="background-color: white;">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- 404 Error Text -->
                    <div class="text-center">
                        <div class="error mx-auto" data-text="404">404</div>
                        <p class="lead text-gray-800 mb-5">Không tìm thấy trang</p>
                        <c:if test="${USER.role.code == 'STUDENT'}">
                        	<a href="<c:url value='/sinh-vien'/>">&larr; Quay lại trang chủ</a>
                        </c:if>
                         <c:if test="${USER.role.code == 'ADMIN'}">
                        	<a href="<c:url value='/quan-tri'/>">&larr; Quay lại trang chủ</a>
                        </c:if>
                         <c:if test="${USER.role.code == 'LECTURER'}">
                        	<a href="<c:url value='/giang-vien'/>">&larr; Quay lại trang chủ</a>
                        </c:if>
                        <c:if test="${empty USER}">
                        	<a href="<c:url value='/dang-nhap'/>">&larr; Quay lại trang đăng nhập</a>
                        </c:if>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Bootstrap core JavaScript-->
 <script src="<c:url value='/assets/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/assets/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value='/assets/js/sb-admin-2.min.js'/>"></script>

</body>

</html>