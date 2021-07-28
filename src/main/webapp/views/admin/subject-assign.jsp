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
	<a href="subject.html" class="btn btn-info btn-icon-split mb-3"> <span
		class="icon text-white-50"> <i class="fa fa-arrow-left"></i>
	</span> <span class="text">Quay lại</span>
	</a>
	<div class="card shadow mb-4">
		<a href="#collapseCardExample" class="d-block card-header py-3"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fa fa-plus-circle mr-2"></i>Giao môn học: <span>Lập
					trình mạng</span> - Bộ môn <span>Mạng máy tính</span> - Khoa <span>Công
					nghệ thông tin</span>
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form>
					<div class="form-group row justify-content-center">
						<label for="" class="col-sm-2 col-form-label">Học kì</label>
						<div class="col-sm-6">
							<select class="custom-select form-control" id="">
								<option disabled selected>Chọn học kì</option>
								<option value="1">2018 - 2019 HK1</option>
								<option value="2">2018 - 2019 HK2</option>
								<option value="3">2019 - 2020 HK1</option>
							</select>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="" class="col-sm-2 col-form-label">Giảng viên</label>
						<div class="col-sm-6">
							<select class="custom-select form-control" id="">
								<option disabled selected>Chọn giảng viên</option>
								<option value="1">A</option>
								<option value="2">B</option>
								<option value="3">C</option>
							</select>
						</div>
					</div>
					<div class="form-group row justify-content-center mt-4">
						<button class="btn btn-success btn-icon-split ">
							<span class="icon text-white-50"> <i class="fa fa-plus"></i>
							</span> <span class="text">Giao</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-8">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách giảng viên dạy môn <span>Lập
							trinh mạng</span>
					</h6>
				</div>
				<div class="col-4 text-right">
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
							<th class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="selectAll"> <label
									for="selectAll"></label>
							</span></th>
							<th class="text-center">Tên giảng viên</th>
							<th class="text-center">Tên tài khoản</th>
							<th class="text-center">Email</th>
							<th class="text-center">SĐT</th>
							<th class="text-center">Giới tính</th>
							<th class="text-center">Học vị</th>
							<th class="text-center">Giao lớp</th>
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
							<td>Director</td>
							<td>Director</td>
							<td class="text-center">
								<button class="btn btn-info btn-circle btn-sm"
									data-toggle="modal" data-target="#showClass" title="Chọn lớp">
									<span class="icon text-white-50"> <i class="fas fa-plus"></i>
									</span>
								</button>
							</td>
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
							<td>Director</td>
							<td>Director</td>
							<td class="text-center">
								<button class="btn btn-info btn-circle btn-sm"
									data-toggle="modal" data-target="#showClass" title="Chọn lớp">
									<span class="icon text-white-50"> <i class="fas fa-plus"></i>
									</span>
								</button>
							</td>
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
							<td>Director</td>
							<td>Director</td>
							<td class="text-center">
								<button class="btn btn-info btn-circle btn-sm"
									data-toggle="modal" data-target="#showClass" title="Chọn lớp">
									<span class="icon text-white-50"> <i class="fas fa-plus"></i>
									</span>
								</button>
							</td>
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
							<td>Director</td>
							<td>Director</td>
							<td class="text-center">
								<button class="btn btn-info btn-circle btn-sm"
									data-toggle="modal" data-target="#showClass" title="Chọn lớp">
									<span class="icon text-white-50"> <i class="fas fa-plus"></i>
									</span>
								</button>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="showClass" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Danh sách lớp
						được dạy</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-borderless" width="50%" cellspacing="0">
						<tr>
							<td class="text-center"><input type="checkbox" id="a"
								name="options[]" value="1"> <label class="mb-0 ml-3"
								for="a">DH18DTA</label></td>
						</tr>
						<tr>
							<td class="text-center"><input type="checkbox" id="b"
								name="options[]" value="1"> <label class="mb-0 ml-3"
								for="b">DH18DTB</label></td>
						</tr>
						<tr>
							<td class="text-center"><input type="checkbox" id="c"
								name="options[]" value="1"> <label class="mb-0 ml-3"
								for="c">DH18DTC</label></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Quay lại</button>
					<button class="btn btn-success" href="login.html">Lưu</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>