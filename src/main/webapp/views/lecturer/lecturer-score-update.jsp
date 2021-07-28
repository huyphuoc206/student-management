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
	<a href="lecturer-score.html" class="btn btn-info btn-icon-split mb-3">
		<span class="icon text-white-50"> <i class="fa fa-arrow-left"></i>
	</span> <span class="text">Quay lại</span>
	</a>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-8">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-keyboard mr-2"></i>Nhập điểm môn <span>Công
							nghệ phần mềm - Lớp <span>DH18DTB</span>
					</h6>
				</div>
				<div class="col-4 text-right">
					<button class="btn btn-success btn-icon-split" data-toggle="modal"
						data-target="#removeModal">
						<span class="icon text-white-50"> <i class="fa fa-save"></i>
						</span> <span class="text">Lưu</span>
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
							<th class="text-center">STT</th>
							<th class="text-center">MSSV</th>
							<th class="text-center">Họ tên</th>
							<th class="text-center">Quá trình<br>(20%)
							</th>
							<th class="text-center">Giữa kì<br>(30%)
							</th>
							<th class="text-center">Cuối kì<br>(50%)
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">18130182</td>
							<td>Phạm Huy Phước</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">18130182</td>
							<td>Phạm Huy Phước</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">18130182</td>
							<td>Phạm Huy Phước</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">18130182</td>
							<td>Phạm Huy Phước</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">18130182</td>
							<td>Phạm Huy Phước</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">18130182</td>
							<td>Phạm Huy Phước</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
							<td class="text-center">
								<div class="row justify-content-center">
									<input type="number" class="form-control input-score">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>