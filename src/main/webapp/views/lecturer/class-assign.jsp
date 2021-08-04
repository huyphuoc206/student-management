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
	<div class="row justify-content-between">
		<div>
			<a href="<c:url value='/giang-vien/danh-sach-mon-hoc'/>"
				class="btn btn-info btn-icon-split mb-3" id="preLink"> <span
				class="icon text-white-50"> <i class="fa fa-arrow-left"></i>
			</span> <span class="text">Quay lại</span>
			</a>
		</div>
	</div>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-4">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách lớp
					</h6>
				</div>
				<div class="col-4 text-center">
					<h6 class="m-0 font-weight-bold text-primary">
						Môn: <span>${ subjectAssign.subject.name }</span>
					</h6>
				</div>
				<div class="col-4 text-right">
					<h6 class="m-0 font-weight-bold text-primary">${ subjectAssign.semester.name }</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover" width="100%" id="dataTable"
					cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">STT</th>
							<th class="text-center">Tên lớp</th>
							<th class="text-center">Mã lớp</th>
							<th class="text-center">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model}" varStatus="loop">
							<tr>
								<td class="text-center">${loop.index + 1}</td>
								<td>${ item.name }</td>
								<td class="text-center">${ item.code }</td>
								<td class="text-center"><a href="<c:url value='/giang-vien/bang-diem?subjectAssignId=${ subjectAssign.id }&classId=${ item.id }&type=view'/>"
									class="btn btn-success btn-circle btn-sm"
									title="Xem bảng điểm"> <i class="fas fa-keyboard"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Danh sách môn học'))
				element.classList.add("active")
		}
	</script>
</body>
</html>