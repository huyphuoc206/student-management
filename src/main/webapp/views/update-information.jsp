<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-end mb-5">
		<c:if test="${not empty message}">
			<div class="alert alert-${alert} text-center small mb-0">
				<span>${message}</span> <a href="#" class="close"
					data-dismiss="alert" aria-label="close">&times;</a>
			</div>
		</c:if>
	</div>
	<div class="d-sm-flex align-items-center justify-content-center mb-4">
		<h1 class="h3 mb-0 text-gray-800">Thông tin cá nhân</h1>
	</div>
	<form id="formSubmit">
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="">Tên tài khoản</label> 
				<c:if test="${USER.role.code == 'ADMIN'}"> 
					<input type="text" class="form-control" value= "${ model.username }" name="username" required>
				</c:if>
				<c:if test="${USER.role.code == 'STUDENT' || USER.role.code == 'LECTURER'}"> 
					<input type="text" readonly class="form-control" value= "${ model.username }" name="username">
				</c:if>
			</div>
			<div class="form-group col-md-6">
				<label for="email">Email</label> <input type="email" class="form-control"
					id="email" required name="email" value= "${ model.email }">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="fullname">Họ tên</label> <input type="text" class="form-control"
					id="fullname" name="fullname" required value= "${ model.fullname }">
			</div>
			<div class="form-group col-md-6">
				<label for="phone">Số điện thoại</label> <input type="tel"
					class="form-control" name="phoneNumber" id="phone" value= "${ model.phoneNumber }">
			</div>
		</div>
		<c:if test="${USER.role.code == 'ADMIN'}"> 
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="dob">Ngày sinh</label> <input type="date"
						class="form-control" name="dob" id="dob" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${model.dob}" />" >
				</div>
				<div class="form-group col-md-6">
					<label for="gender">Giới tính</label> <select id="gender" class="custom-select form-control" name="gender">
						<c:if test="${empty model.gender}">
							<option value="Nam">Nam</option>
							<option value="Nữ">Nữ</option>
						</c:if>
						<c:if test="${model.gender == 'Nam'}">
							<option value="Nam" selected>Nam</option>
							<option value="Nữ">Nữ</option>
						</c:if>
						<c:if test="${model.gender == 'Nữ'}">
							<option value="Nam">Nam</option>
							<option value="Nữ" selected>Nữ</option>
						</c:if>
					</select>
				</div>
			</div>
		</c:if>
		
		<!-- student -->
		<c:if test="${USER.role.code == 'STUDENT'}">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="">Ngày sinh</label> <input type="date"
						class="form-control" name="dob" id="dob" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${model.dob}" />">
				</div>
				<div class="form-group col-md-6">
					<label for="gender">Giới tính</label> <select id="gender" class="custom-select form-control" name="gender">
						<c:if test="${empty model.gender}">
							<option value="Nam">Nam</option>
							<option value="Nữ">Nữ</option>
						</c:if>
						<c:if test="${model.gender == 'Nam'}">
							<option value="Nam" selected>Nam</option>
							<option value="Nữ">Nữ</option>
						</c:if>
						<c:if test="${model.gender == 'Nữ'}">
							<option value="Nam">Nam</option>
							<option value="Nữ" selected>Nữ</option>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">Khoa</label> <input type="text" readonly
						class="form-control" id="inputEmail4" value="Công nghệ thông tin">
				</div>
				<div class="form-group col-md-6">
					<label for="">Lớp</label> <input type="text" readonly
						class="form-control" id="inputEmail4" value="DH18DTB">
				</div>
			</div>
		</c:if>

		<!-- lecturer -->
		<c:if test="${USER.role.code == 'LECTURER'}">
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="">Ngày sinh</label> 
					<input type="date" class="form-control" name="dob" id="dob" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${model.dob}" />">
				</div>
				<div class="form-group col-md-4">
					<label for="gender">Giới tính</label> <select id="gender" class="custom-select form-control" name="gender">
						<c:if test="${empty model.gender}">
							<option value="Nam">Nam</option>
							<option value="Nữ">Nữ</option>
						</c:if>
						<c:if test="${model.gender == 'Nam'}">
							<option value="Nam" selected>Nam</option>
							<option value="Nữ">Nữ</option>
						</c:if>
						<c:if test="${model.gender == 'Nữ'}">
							<option value="Nam">Nam</option>
							<option value="Nữ" selected>Nữ</option>
						</c:if>
					</select>
				</div>
				<div class="form-group col-md-4">
					<label for="degree">Học vị</label> <input type="text" readonly
						class="form-control" id="degree" value="${ lecturer.degree.name }">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="faculty">Khoa</label> <input type="text" readonly
						class="form-control" id="faculty" value="${ lecturer.department.facultyName }">
				</div>
				<div class="form-group col-md-6">
					<label for="department">Bộ môn</label> <input type="text" readonly
						class="form-control" id="department" value="${ lecturer.department.name }">
				</div>
			</div>
		</c:if>

		<div class="form-group row justify-content-center mt-2">
			<button class="btn btn-primary btn-icon-split" id="update" type="submit">
				<span class="icon text-white-50"> <i class="fa fa-check"></i>
				</span> <span class="text">Lưu</span>
			</button>
		</div>
		<input type="hidden" value="${model.id}" id="id" name="id" />
	</form>
	<input type="hidden" value="${USER.role.code}" id="role" />
<script type="text/javascript">
	const items = $(".nav-item")
	for (let element of items) {
		if(element.innerHTML.includes('Thông tin cá nhân'))
			element.classList.add("active")
		else 
			element.classList.remove("active")
	}
	
	$('#update').click(function (e) {
		if($('#formSubmit')[0].checkValidity()) {
		    e.preventDefault();
		    let data = {}; // mang object name: value
		    let formData = $('#formSubmit').serializeArray();
		    // vong lap
		    $.each(formData, function(i,v) {
		        data[''+v.name] = v.value
		    });
		    console.log(data)
		   updateInformation(data);
		}
	})
	
	function updateInformation(data) {
	    $('.load').show();
	    $.ajax({
	        url: '${APIurl}',
	        type: 'PUT',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        dataType: 'json',
	        success: function (result) {
	            $('.load').hide();
	            const role = $('#role').val();
	            let url = '';
	            if(role === 'ADMIN')
	            	url = '/quan-tri/thong-tin-ca-nhan'
            	else if (role === 'LECTURER')
            		url = '/giang-vien'
           		else if (role === 'STUDENT')
           			url = '/sinh-vien'
	            		
	            if(result !== null) {
	            	 window.location.href = url+"?message=update_success&alert=success";
	            }
	               
	            else {
	            	let message = 'email_exist';
	            	if( role === 'ADMIN') message = 'username_email_exist';
	            	window.location.href = url+"?message="+message+"&alert=danger";
	            }
	        },
	        error: function (error) {
	            $('.load').hide();
	            let url = '';
	            if(role === 'ADMIN')
	            	url = '/quan-tri/thong-tin-ca-nhan'
            	else if (role === 'LECTURER')
            		url = '/giang-vien'
           		else if (role === 'STUDENT')
           			url = '/sinh-vien'
	            window.location.href = url+"?message=system_error&alert=danger";
	        }
	    })
	}
</script>	
</body>
</html>