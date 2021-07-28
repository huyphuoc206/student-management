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
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-6">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách môn học
					</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="form-group row justify-content-center">
					<label for="" class="col-form-label">Học kì</label>
					<div class="col-sm-6">
						<select class="custom-select form-control" id="">
							<option disabled selected>Chọn học kì</option>
							<option value="1">2018 - 2019 HK1</option>
							<option value="2">2018 - 2019 HK2</option>
							<option value="3">2019 - 2020 HK1</option>
						</select>
					</div>
				</div>
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">STT</th>
							<th class="text-center">Tên môn học</th>
							<th class="text-center">Mã môn học</th>
							<th class="text-center">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">1</td>
							<td>Director</td>
							<td>New York</td>
							<td class="text-center"><a href="lecturer-class.html"
								class="btn btn-success btn-circle btn-sm" title="Danh sách lớp">
									<i class="fas fa-address-book"></i>
							</a></td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td>Director</td>
							<td>New York</td>
							<td class="text-center"><a href="lecturer-class.html"
								class="btn btn-success btn-circle btn-sm" title="Danh sách lớp">
									<i class="fas fa-address-book"></i>
							</a></td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td>Director</td>
							<td>New York</td>
							<td class="text-center"><a href="lecturer-class.html"
								class="btn btn-success btn-circle btn-sm" title="Danh sách lớp">
									<i class="fas fa-address-book"></i>
							</a></td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td>Director</td>
							<td>New York</td>
							<td class="text-center"><a href="lecturer-class.html"
								class="btn btn-success btn-circle btn-sm" title="Danh sách lớp">
									<i class="fas fa-address-book"></i>
							</a></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>