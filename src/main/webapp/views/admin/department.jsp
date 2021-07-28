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
		<a href="#collapseCardExample" class="d-block card-header py-3"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fa fa-plus-circle mr-2"></i>Thêm mới bộ môn
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form>
					<div class="form-group row justify-content-center">
						<label for="" class="col-sm-2 col-form-label">Tên bộ môn</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="" name="">
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="" class="col-sm-2 col-form-label">Mã bộ môn</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="" name="">
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="" class="col-sm-2 col-form-label">Khoa</label>
						<div class="col-sm-6">
							<select class="custom-select form-control" id="">
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div>
					<div class="form-group row justify-content-center mt-4">
						<button class="btn btn-success btn-icon-split ">
							<span class="icon text-white-50"> <i class="fa fa-plus"></i>
							</span> <span class="text">Thêm</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-6">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách bộ môn
					</h6>
				</div>
				<div class="col-6 text-right">
					<button class="btn btn-danger btn-icon-split" data-toggle="modal"
						data-target="#removeModal">
						<span class="icon text-white-50"> <i class="fas fa-trash"></i>
						</span> <span class="text">Xóa</span>
					</button>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="form-group row justify-content-center">
					<label for="" class="col-form-label">Khoa</label>
					<div class="col-sm-6">
						<select class="custom-select form-control" id="">
							<option value="1">Tất cả</option>
							<option value="2">Công nghệ thông tin</option>
							<option value="3">Three</option>
						</select>
					</div>
				</div>
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">
					<thead>
						<tr>
							<th class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="selectAll"> <label
									for="selectAll"></label>
							</span></th>
							<th class="text-center">Tên bộ môn</th>
							<th class="text-center">Mã bộ môn</th>
							<th class="text-center">Trưởng bộ môn</th>
							<th class="text-center">Khoa</th>
							<th class="text-center">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Director</td>
							<td>New York</td>
							<td>Director</td>
							<td>Director</td>
							<td class="text-center"><a href="department-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Director</td>
							<td>New York</td>
							<td>Director</td>
							<td>Director</td>
							<td class="text-center"><a href="department-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Director</td>
							<td>New York</td>
							<td>Director</td>
							<td>Director</td>
							<td class="text-center"><a href="department-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Director</td>
							<td>New York</td>
							<td>Director</td>
							<td>Director</td>
							<td class="text-center"><a href="department-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>