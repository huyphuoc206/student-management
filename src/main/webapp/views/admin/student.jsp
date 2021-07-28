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
						<i class="fa fa-list-alt mr-2"></i>Danh sách sinh viên
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
							<th class="text-center">Lớp</th>
							<th class="text-center">Khoa</th>
							<th class="text-center">Ngày tạo</th>
							<th class="text-center">Trạng thái</th>
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
							<td>Hệ thống thông tin</td>
							<td>Công nghệ thông tin</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center">
								<div class="btn-success btn-circle btn-sm" title="Hoạt động">
									<i class="fas fa-check"></i>
								</div>
							</td>
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
							<td>Hệ thống thông tin</td>
							<td>Công nghệ thông tin</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center"><div
									class="btn-success btn-circle btn-sm" title="Hoạt động">
									<i class="fas fa-check"></i>
								</div></td>
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
							<td>Hệ thống thông tin</td>
							<td>Công nghệ thông tin</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center"><div
									class="btn-danger btn-circle btn-sm" title="Ngưng hoạt động">
									<i class="fas fa-ban"></i>
								</div></td>
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
							<td>Hệ thống thông tin</td>
							<td>Công nghệ thông tin</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center"><div
									class="btn-success btn-circle btn-sm" title="Hoạt động">
									<i class="fas fa-check"></i>
								</div></td>
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
							<td>Hệ thống thông tin</td>
							<td>Công nghệ thông tin</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center"><div
									class="btn-danger btn-circle btn-sm" title="Ngưng hoạt động">
									<i class="fas fa-ban"></i>
								</div></td>
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
							<td>Hệ thống thông tin</td>
							<td>Công nghệ thông tin</td>
							<td class="text-center">23/02/1999</td>
							<td class="text-center"><div
									class="btn-danger btn-circle btn-sm" title="Ngưng hoạt động">
									<i class="fas fa-ban"></i>
								</div></td>
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