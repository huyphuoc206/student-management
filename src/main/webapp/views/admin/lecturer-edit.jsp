<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-lecturer" />
<c:url var="MainURL" value="/quan-tri/giang-vien" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-between">
		<div>
			<a href="<c:url value='/quan-tri/giang-vien'/>"
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
		<h1 class="h3 mb-0 text-gray-800">Cập nhật giảng viên</h1>
	</div>
	<form id="formSubmit">
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="username">Tên tài khoản</label> <input type="text"
					class="form-control" id="username" name="username" value="${ model.user.username }" required>
			</div>
			<div class="form-group col-md-4">
				<label for="email">Email</label> <input type="email" class="form-control"
					id="email" name="email" value="${ model.user.email }" required>
			</div>
			<div class="form-group col-md-4">
				<label for="fullname">Họ tên</label> <input type="text" class="form-control"
					id="fullname" name="fullname" value="${ model.user.fullname }" required>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="phone">Số điện thoại</label> <input type="tel"
					class="form-control" id="phone" name="phoneNumber" value="${ model.user.phoneNumber }">
			</div>
			<div class="form-group col-md-4">
				<label for="dob">Ngày sinh</label> <input type="date"
					class="form-control" id="dob" name="dob" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${model.user.dob}" />" required>
			</div>
			<div class="form-group col-md-4">
				<label for="gender">Giới tính</label> <select id="gender" class="custom-select form-control" name="gender">
					<c:if test="${empty model.user.gender}">
						<option value="Nam">Nam</option>
						<option value="Nữ">Nữ</option>
					</c:if>
					<c:if test="${model.user.gender == 'Nam'}">
						<option value="Nam" selected>Nam</option>
						<option value="Nữ">Nữ</option>
					</c:if>
					<c:if test="${model.user.gender == 'Nữ'}">
						<option value="Nam">Nam</option>
						<option value="Nữ" selected>Nữ</option>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="degree">Học vị</label> <select id="degree" class="custom-select form-control" name="degreeId">
					<c:forEach var="item" items="${degrees}">
						<c:if test="${item.id == model.degreeId}">
							<option value="${item.id}" selected>${item.name}</option>
						</c:if>
						<c:if test="${item.id != model.degreeId}">
							<option value="${item.id}">${item.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-md-4">
				<label for="facultyList">Khoa</label> 
				<select  id="facultyList" class="custom-select form-control">
					<c:forEach var="item" items="${faculties}">
						<c:if test="${item.id == model.department.facultyId}">
							<option value="${item.id}" selected>${item.name}</option>
						</c:if>
						<c:if test="${item.id != model.department.facultyId}">
							<option value="${item.id}">${item.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-md-4">
				<label for="departmentList">Bộ môn</label> 
				<select id="departmentList" class="custom-select form-control" name="departmentId">
						<c:forEach var="item" items="${departments}">
						<c:if test="${item.id == model.departmentId}">
							<option value="${item.id}" selected>${item.name}</option>
						</c:if>
						<c:if test="${item.id != model.departmentId}">
							<option value="${item.id}">${item.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="">Ngày tạo</label> <input type="text" value="<fmt:formatDate pattern = "dd-MM-yyyy" value = "${model.user.createdDate}"/>"
					readonly class="form-control" id="">
			</div>
			<div class="form-group col-md-6">
				<label for=status"">Trạng thái</label> 
				<select id="status" class="custom-select form-control" name="status">
					<c:if test="${model.user.status == 1}">
						<option value="1" selected>Hoạt động</option>
						<option value="0">Ngưng hoạt động</option>
					</c:if>
					<c:if test="${model.user.status == 0}">
						<option value="1">Hoạt động</option>
						<option value="0" selected>Ngưng hoạt động</option>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-group row justify-content-center mt-2">
			<button class="btn btn-primary btn-icon-split" id="update" type="submit">
				<span class="icon text-white-50"> <i class="fa fa-check"></i>
				</span> <span class="text">Lưu</span>
			</button>
		</div>
		<input type="hidden" value="${model.id}" id="id" name="id" />
	</form>
	<input type="hidden" value="${model.user.id}" id="userId"/>
	<input type="hidden" value="${model.departmentId}" id="currentDepartmentId"/>
	<input type="hidden" value="${model.department.facultyId}" id="currentFacultyId"/>
	 <script>
		$("#collapseTwo")[0].classList.add("show")
		$("#collapseTwo .collapse-item")[0].classList.add("active")
		const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Quản lý người dùng'))
				element.classList.add("active")
		}
		
		$('#facultyList').on('change', function() {
			 const facultyId = this.value;
			 getDepartmentByFacultyId(facultyId);
		});
		function loadDepartmentByFaculty(data) {
			   const departmentList =  $('#departmentList')
			   let options = '';
			   options += '<option value="" disabled selected>Chọn bộ môn</option>'
			   data.forEach(element => {
				   options += '<option value="' + element.id + '">' + element.name +'</option>'
			   })
			   departmentList.html(options);
			}
		function loadDepartmentByOldFaculty(data) {
			   const departmentList =  $('#departmentList')
			   let options = '';
			   const currentDepartmentId = $('#currentDepartmentId').val();
			   data.forEach(element => {
				   if(element.id == currentDepartmentId) 
					 options += '<option value="' + element.id + '" selected>' + element.name +'</option>'
				   else
				  	 options += '<option value="' + element.id + '">' + element.name +'</option>'
			   })
			   departmentList.html(options);
		}   
	   function getDepartmentByFacultyId(facultyId) {
	        $('.load').show();
	        $.get('/api-admin-department', {facultyId: facultyId}, function (data) {
	        	 $('.load').hide();
                if (data != null) {
                	const currentFacultyId = $('#currentFacultyId').val();
                	if(facultyId == currentFacultyId)
                		loadDepartmentByOldFaculty(data);
                	else
                		loadDepartmentByFaculty(data);
                }
	        });
	    }
	   
	   $('#update').click(function (e) {
			if($('#formSubmit')[0].checkValidity()) {
			    e.preventDefault();
			    let data = {};
			    data['user'] = {};
			    let formData = $('#formSubmit').serializeArray();
			    
			    $.each(formData, function(i,v) {
			    	if(v.name === 'id' || v.name === 'degreeId' || v.name === 'departmentId')
			        	data[''+v.name] = v.value
			        else 
			        	data['user'][''+v.name] = v.value
			    });
			    data['user']['id'] = $('#userId').val();
			    if(data['departmentId'] == null) data['departmentId'] = $('#currentDepartmentId').val();
				updateLecturer(data);
			}
		})
		
		function updateLecturer(data) {
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
		                window.location.href = "${MainURL}?id="+data.id+"&message=username_email_exist&alert=danger";
		        },
		        error: function (error) {
		            $('.load').hide();
		            window.location.href = "${MainURL}?id="+data.id+"&message=system_error&alert=danger";
		        }
		    })
		}
	</script>
</body>
</html>