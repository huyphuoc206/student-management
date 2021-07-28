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
	<a href="faculty.html" class="btn btn-info btn-icon-split mb-3"
		id="preLink"> <span class="icon text-white-50"> <i
			class="fa fa-arrow-left"></i>
	</span> <span class="text">Quay lại</span>
	</a>
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-center mb-4">
		<h1 class="h3 mb-0 text-gray-800">Cập nhật khoa</h1>
	</div>
	<form>
		<div class="form-group row justify-content-center">
			<label for="" class="col-sm-2 col-form-label">Tên khoa</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="" name="">
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<label for="" class="col-sm-2 col-form-label">Mã khoa</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="" name="">
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<label for="" class="col-sm-2 col-form-label">Trưởng khoa</label>
			<div class="col-sm-6">
				<select class="custom-select form-control " id="">
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
		</div>
		<div class="form-group row justify-content-center mt-4">
			<button class="btn btn-primary btn-icon-split ">
				<span class="icon text-white-50"> <i class="fa fa-check"></i>
				</span> <span class="text">Lưu</span>
			</button>
		</div>
	</form>
</body>
</html>