<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-user" />
<c:url var="MainURL" value="/quan-tri/thong-tin-ca-nhan" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-end">
		<c:if test="${not empty message}">
			<div class="alert alert-${alert} text-center small">
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
				<label for="">Tên tài khoản</label> <input type="text" readonly
					class="form-control" value= "${ model.username }">
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
						<label for="">Giới tính</label> <select id="" class="form-control" name="gender">
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
						class="form-control" id="">
				</div>
				<div class="form-group col-md-6">
					<label for="">Giới tính</label> <select id="" class="form-control">
						<option value="MALE">Nam</option>
						<option value="FEMALE">Nữ</option>
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
					<label for="">Ngày sinh</label> <input type="date"
						class="form-control" id="">
				</div>
				<div class="form-group col-md-4">
					<label for="">Giới tính</label> <select id="" class="form-control">
						<option value="MALE">Nam</option>
						<option value="FEMALE">Nữ</option>
					</select>
				</div>
				<div class="form-group col-md-4">
					<label for="inputCity">Học vị</label> <input type="text" readonly
						class="form-control" id="inputEmail4" value="Tiến sĩ">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">Khoa</label> <input type="text" readonly
						class="form-control" id="inputEmail4" value="Công nghệ thông tin">
				</div>
				<div class="form-group col-md-6">
					<label for="">Bộ môn</label> <input type="text" readonly
						class="form-control" id="inputEmail4" value="Công nghệ phần mềm">
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
	            if(result !== null)
	                window.location.href = "${MainURL}?id="+result.id+"&message=update_success&alert=success";
	            else
	                window.location.href = "${MainURL}?id="+data.id+"&message=email_exist&alert=danger";
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