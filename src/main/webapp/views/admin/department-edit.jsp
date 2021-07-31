<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-department" />
<c:url var="MainURL" value="/quan-tri/bo-mon" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-between">
		<div>
			<a href="<c:url value='/quan-tri/bo-mon'/>"
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
	
	<div class="d-sm-flex align-items-center justify-content-center mb-4">
		<h1 class="h3 mb-0 text-gray-800">Cập nhật bộ môn</h1>
	</div>
	<form id="formSubmit">
		<div class="form-group row justify-content-center">
			<label for="name" class="col-sm-2 col-form-label">Tên bộ môn</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="name" name="name" value="${ model.name }" required>
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<label for="code" class="col-sm-2 col-form-label">Mã bộ môn</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="code" name="code" value="${ model.code }" required>
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<label for="" class="col-sm-2 col-form-label">Trưởng bộ môn</label>
			<div class="col-sm-6">
				<select class="custom-select form-control" id="lecturer"
					name="lecturerId">
					<option disabled selected>Chọn giảng viên</option>
					<c:forEach var="lecturer" items="${lecturers}">
						<c:if test="${lecturer.id == model.lecturerId}">
							<option value="${lecturer.id}" selected>${lecturer.user.fullname}</option>
						</c:if>
						<c:if test="${lecturer.id != model.lecturerId}">
							<option value="${lecturer.id}">${lecturer.user.fullname}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<label for="faculty" class="col-sm-2 col-form-label">Khoa</label>
			<div class="col-sm-6">
				<select class="custom-select form-control" id="faculty"
					name="facultyId">
					<c:forEach var="item" items="${faculties}">
						<c:if test="${item.id == model.facultyId}">
							<option value="${item.id}" selected>${item.name}</option>
						</c:if>
						<c:if test="${item.id != model.facultyId}">
							<option value="${item.id}">${item.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row justify-content-center mt-4">
			<button class="btn btn-primary btn-icon-split" id="update" type="submit">
				<span class="icon text-white-50"> <i class="fa fa-check"></i>
				</span> <span class="text">Lưu</span>
			</button>
		</div>
		<input type="hidden" value="${model.id}" id="id" name="id" />
	</form>
<script>
	$('#update').click(function (e) {
		if($('#formSubmit')[0].checkValidity()) {
		    e.preventDefault();
		    let data = {}; // mang object name: value
		    let formData = $('#formSubmit').serializeArray();
		    // vong lap
		    $.each(formData, function(i,v) {
		        data[''+v.name] = v.value
		    });
		    updateDepartment(data);
		}
	})
	
	function updateDepartment(data) {
	    $('.load').show();
	    $.ajax({
	        url: '${APIurl}',
	        type: 'PUT',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        dataType: 'json',
	        success: function (result) {
	            $('.load').hide();
	            if(result !== null)
	                window.location.href = "${MainURL}?id="+result.id+"&message=update_success&alert=success";
	            else
	                window.location.href = "${MainURL}?id="+data.id+"&message=update_fail&alert=danger";
	        },
	        error: function (error) {
	            $('.load').hide();
	            window.location.href = "${MainURL}?message=system_error&alert=danger";
	        }
	    })
	}
</script>
</body>
</html>