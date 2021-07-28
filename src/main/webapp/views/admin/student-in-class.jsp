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
	<a href="class.html" class="btn btn-info btn-icon-split mb-3"> <span
		class="icon text-white-50"> <i class="fa fa-arrow-left"></i>
	</span> <span class="text">Quay lại</span>
	</a>
	<div class="card shadow mb-4">
		<a href="#collapseCardExample" class="d-block card-header py-3"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fa fa-plus-circle mr-2"></i>Thêm mới sinh viên
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form>
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="">MSSV</label> <input type="text"
								class="form-control" id="">
						</div>
						<div class="form-group col-md-4">
							<label for="">Email</label> <input type="email"
								class="form-control" id="">
						</div>
						<div class="form-group col-md-4">
							<label for="">Họ tên</label> <input type="text"
								class="form-control" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="">Mật khẩu</label> <input type="password"
								class="form-control" id="">
						</div>
						<div class="form-group col-md-6">
							<label for="">Nhập lại mật khẩu</label> <input type="password"
								class="form-control" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="inputEmail4">Số điện thoại</label> <input type="tel"
								class="form-control" id="inputEmail4">
						</div>
						<div class="form-group col-md-4">
							<label for="">Ngày sinh</label> <input type="date"
								class="form-control" id="">
						</div>
						<div class="form-group col-md-4">
							<label for="">Giới tính</label> <select id=""
								class="form-control">
								<option value="MALE">Nam</option>
								<option value="FEMALE">Nữ</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="">Lớp</label> <input type="text" readonly
								class="form-control" id="" value="DH18DTB">
						</div>
						<div class="form-group col-md-6">
							<label for="">Khoa</label> <input type="text" readonly
								class="form-control" id="" value="Công nghệ thông tin">
						</div>
					</div>
					<div class="form-group row justify-content-center mt-2">
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
				<div class="col-8">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách sinh viên - Lớp <span>DH18DTB</span>
						- Khoa <span>Công nghệ thông tin</span>
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
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">
					<thead>
						<tr>
							<th class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="selectAll"> <label
									for="selectAll"></label>
							</span></th>
							<th class="text-center">MSSV</th>
							<th class="text-center">Họ tên</th>
							<th class="text-center">Email</th>
							<th class="text-center">SĐT</th>
							<th class="text-center">Ngày sinh</th>
							<th class="text-center">Giới tính</th>
							<th class="text-center">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Direcsdsdtor</td>
							<td>New Yssssssssssssssssssssssssork</td>
							<td>Yssssssssssssssssssssssssork</td>
							<td class="text-center">1234567890</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center">Nam</td>
							<td class="text-center"><a href="student-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Direcsdsdtor</td>
							<td>New Yssssssssssssssssssssssssork</td>
							<td>Yssssssssssssssssssssssssork</td>
							<td class="text-center">1234567890</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center">Nam</td>
							<td class="text-center"><a href="student-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Direcsdsdtor</td>
							<td>New Yssssssssssssssssssssssssork</td>
							<td>Yssssssssssssssssssssssssork</td>
							<td class="text-center">1234567890</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center">Nam</td>
							<td class="text-center"><a href="student-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Direcsdsdtor</td>
							<td>New Yssssssssssssssssssssssssork</td>
							<td>Yssssssssssssssssssssssssork</td>
							<td class="text-center">1234567890</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center">Nam</td>
							<td class="text-center"><a href="student-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Direcsdsdtor</td>
							<td>New Yssssssssssssssssssssssssork</td>
							<td>Yssssssssssssssssssssssssork</td>
							<td class="text-center">1234567890</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center">Nam</td>
							<td class="text-center"><a href="student-edit.html"
								class="btn btn-info btn-circle btn-sm" title="Cập nhật"> <i
									class="fas fa-pen"></i></a></td>
						</tr>
						<tr>
							<td class="text-center"><span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="options[]"
									value="1"> <label for="checkbox1"></label>
							</span></td>
							<td>Direcsdsdtor</td>
							<td>Phạm Huy Phước</td>
							<td>Yssssssssssssssssssssssssork</td>
							<td class="text-center">1234567890</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center">Nam</td>
							<td class="text-center"><a href="student-edit.html"
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