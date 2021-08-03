<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>JWAT</title>
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/assets/img/logo.png'/>" />
<!-- Custom fonts for this template-->
<link
	href="<c:url value='/assets/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/assets/css/sb-admin-2.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/assets/css/style.css'/>" rel="stylesheet">
<link
	href="<c:url value='/assets/vendor/datatables/dataTables.bootstrap4.min.css'/>"
	rel="stylesheet">
<script src="<c:url value='/assets/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/assets/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

<script src="<c:url value='/assets/vendor/datatables/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/assets/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>

<script src="<c:url value='/assets/js/datatables-demo.js'/>"></script>
</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="/common/menu.jsp"%>

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="/common/header.jsp"%>
				<div class="container-fluid">
					<div class="load" style="display: none">
						<img src="<c:url value='/assets/img/loading.gif'/>">
					</div>
					<dec:body />
				</div>
			</div>
		</div>
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

<script src="<c:url value='/assets/js/sb-admin-2.min.js'/>"></script>
</body>
</html>