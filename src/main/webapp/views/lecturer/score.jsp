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
			<a href="<c:url value='/giang-vien/danh-sach-lop?subjectAssignId=${ subjectAssign.id }'/>"
				class="btn btn-info btn-icon-split mb-3" id="preLink"> <span
				class="icon text-white-50"> <i class="fa fa-arrow-left"></i>
			</span> <span class="text">Quay lại</span>
			</a>
		</div>
		<c:if test="${not empty message}">
			<div class="alert alert-${alert} text-center small">
				<span>${message} </span> <a href="#" class="close"
					data-dismiss="alert" aria-label="close">&times;</a>
			</div>
		</c:if>
	</div>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center justify-content-end mb-4">
				<a href="<c:url value='/giang-vien/bang-diem?subjectAssignId=${ subjectAssign.id }&classId=${ classDTO.id }&type=edit'/>"
					class="btn btn-success btn-icon-split"> <span
					class="icon text-white-50"> <i class="fa fa-keyboard"></i>
				</span> <span class="text">Nhập điểm</span>
				</a>
			</div>
			<div class="row align-items-center">
				<div class="col-3">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-keyboard mr-2"></i>Bảng điểm</h6>
				</div>
				<div class="col-3 text-center">
					<h6 class="m-0 font-weight-bold text-primary">
						Môn: <span>${ subjectAssign.subject.name }</span>
					</h6>
				</div>
				<div class="col-3 text-center">
					<h6 class="m-0 font-weight-bold text-primary">Lớp: ${ classDTO.code }</h6>
				</div>
				<div class="col-3 text-right">
					<h6 class="m-0 font-weight-bold text-primary">${ subjectAssign.semester.name }</h6>
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
							<th class="text-center">Quá trình<br>(20%)</th>
							<th class="text-center">Giữa kì<br>(30%)</th>
							<th class="text-center">Cuối kì<br>(50%)</th>
							<th class="text-center">Tổng kết</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${studentScores}" varStatus="loop">
							<tr>
								<td class="text-center">${loop.index + 1}</td>
								<td class="text-center">${ item.username }</td>
								<td>${ item.fullname }</td>
								<td class="text-center">${ item.processScore }</td>
								<td class="text-center">${ item.midTermScore }</td>
								<td class="text-center">${ item.endTermScore }</td>
								<td class="text-center">${ item.finalScore }</td>
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