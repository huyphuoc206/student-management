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
				<div class="col-12">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách sinh viên
					</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">
					<thead>
						<tr>
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
							<td class="text-center">
								<a href="admin-edit.html"
								class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật"> <i
									class="fas fa-pen"></i></a>
								<button data-toggle="modal" data-target="#removeModal"
								class="btn btn-danger btn-circle btn-sm m-1" title="Xóa"> <i
									class="fas fa-trash"></i></button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa sinh viên</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Bạn chắc chắn muốn xóa sinh viên này?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
					<button id="remove" class="btn btn-danger">Xóa</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>