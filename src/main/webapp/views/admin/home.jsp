<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Trang chủ</h1>
	</div>

	<!-- Content Row -->
	<div class="row mt-5">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								Tổng số lượng khoa</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${ facultyCounter }</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-building fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								Tổng số lượng bộ môn</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${ departmentCounter }</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-window-maximize fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-info text-uppercase mb-1">
								Tổng số lượng môn học</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${ subjectCounter }</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-book fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-warning text-uppercase mb-1">
								Tổng số lượng lớp</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${ classCounter }</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-address-book fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-danger shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-danger text-uppercase mb-1">
								Tổng số lượng giảng viên</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${ lecturerCounter }</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-user fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-secondary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-secondary text-uppercase mb-1">
								Tổng số lượng sinh viên</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${ studentCounter }</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-user-md fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	const items = $(".nav-item")
	for (let element of items) {
		if(element.innerHTML.includes('Trang chủ'))
			element.classList.add("active")
	}
</script>
</body>
</html>