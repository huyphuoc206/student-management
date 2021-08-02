<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-student" />
<c:url var="APIuser" value="/api-user" />
<c:url var="MainURL" value="/quan-tri/sinh-vien?classId=${ classDTO.id }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-between" id="notification">
		<div>
			<a href="<c:url value='/quan-tri/lop'/>"
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
		<a href="#collapseCardExample" class="d-block card-header py-3"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fa fa-plus-circle mr-2"></i>Thêm mới sinh viên
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form id="formSubmit">
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="username">MSSV</label> <input type="text"
								class="form-control" id="username" name="username" required>
						</div>
						<div class="form-group col-md-4">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email" required>
						</div>
						<div class="form-group col-md-4">
							<label for="fullname">Họ tên</label> <input type="text"
								class="form-control" id="fullname" name="fullname" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="password1">Mật khẩu</label> 
							<input type="password" class="form-control" id="password1" required minlength="6"
							oninvalid="this.setCustomValidity('Mật khẩu từ 6 ký tự.')"
                           oninput="this.setCustomValidity('')">
						</div>
						<div class="form-group col-md-6">
							<label for="password2">Nhập lại mật khẩu</label> 
							<input type="password" class="form-control" id="password2" name="password" required 
							oninvalid="this.setCustomValidity('Mật khẩu không khớp.')"
	                           oninput="this.setCustomValidity('')">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="phoneNumber">Số điện thoại</label> <input type="tel"
								class="form-control" id="phoneNumber" name="phoneNumber">
						</div>
						<div class="form-group col-md-4">
							<label for="dob">Ngày sinh</label> 
							<input type="date" class="form-control" id="dob" name="dob" required>
						</div>
						<div class="form-group col-md-4">
							<label for="gender">Giới tính</label> 
							<select id="gender" name="gender" class="form-control">
								<option value="Nam">Nam</option>
								<option value="Nữ">Nữ</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="class">Lớp</label> <input type="text" readonly
								class="form-control" id="class" value="${ classDTO.code }">
						</div>
						<div class="form-group col-md-6">
							<label for="faculty">Khoa</label> <input type="text" readonly
								class="form-control" id="faculty" value="${ classDTO.facultyName }">
						</div>
					</div>
					<div class="form-group row justify-content-center mt-2">
						<button class="btn btn-success btn-icon-split" id="add"
							type="submit">
							<span class="icon text-white-50"> <i class="fa fa-plus"></i>
							</span> <span class="text">Thêm</span>
						</button>
					</div>
					<input type="hidden" value="${classDTO.id}" id="classId" name="classId" />
				</form>
			</div>
		</div>
	</div>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-12">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách sinh viên - Lớp <span>${ classDTO.code }</span>
						- Khoa <span>${ classDTO.facultyName }</span>
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
							<th class="text-center">STT</th>
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
						<c:forEach var="item" items="${model}" varStatus="loop">
							<tr>
								<td class="text-center">${loop.index + 1}</td>
								<td>${item.user.username}</td>
								<td>${item.user.fullname}</td>
								<td>${item.user.email}</td>
								<td class="text-center">${item.user.phoneNumber}</td>
								<td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${item.user.dob}" /></td>
								<td class="text-center">${item.user.gender}</td>
								<td class="text-center">
									<a href="<c:url value='/quan-tri/sinh-vien?classId=${ classDTO.id }&id=${ item.id }'/>"
									class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật"> <i
										class="fas fa-pen"></i></a>
									<button data-toggle="modal" data-target="#removeModal"
									class="btn btn-danger btn-circle btn-sm m-1" title="Xóa" onclick="remove(${ item.user.id })"> 
									<i class="fas fa-trash"></i></button>
								</td>
							</tr>
						</c:forEach>
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
    <script>
	    const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Quản lý lớp'))
				element.classList.add("active")
		}
	    
	 	window.onload = function () {
	        document.getElementById("password1").onchange = validatePassword;
	        document.getElementById("password2").onchange = validatePassword;
	    }
	
	    function validatePassword() {
	        var pass2 = document.getElementById("password1").value;
	        var pass1 = document.getElementById("password2").value;
	        if (pass1 != pass2)
	            document.getElementById("password2").setCustomValidity("Passwords Don't Match");
	        else
	            document.getElementById("password2").setCustomValidity('');
	    }
	    
	    $('#add').click(function(e) {
			if($('#formSubmit')[0].checkValidity()) {
				e.preventDefault();
				let data = {};
				data['user'] = {};
				let formData = $('#formSubmit').serializeArray();
				// vong lap
				$.each(formData, function(i, v) {
					if(v.name === 'classId')
			        	data[''+v.name] = v.value
			        else 
			        	data['user'][''+v.name] = v.value
				});
				addStudent(data);
			}
		})

		function addStudent(data) {
			$('.load').show();
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					$('.load').hide();
					if (result !== null)
						window.location.href = "${MainURL}&message=insert_success&alert=success";
					else {
						let backUrl = '<div><a href="/quan-tri/lop" class="btn btn-info btn-icon-split mb-3" id="preLink"> <span class="icon text-white-50"> <i class="fa fa-arrow-left"></i>'+
							'</span> <span class="text">Quay lại</span></a></div>';
						let username_email_exist = '<div class="alert alert-danger text-center small"><span>Mã số sinh viên hoặc email đã tồn tại.</span>'
						 + '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
						$("#notification").html(backUrl + username_email_exist)
					}
				},
				error : function(error) {
					$('.load').hide();
					window.location.href = "${MainURL}&message=system_error&alert=danger";
				}
			})
		}
	    
	    let userId = -1;
		function remove(id) {
			userId = id;
		}
		 $('#remove').click(function (e) {
	        e.preventDefault();
	        let data = {}; 
	        if (userId !== -1) {
	            data['id'] = userId;
	            removeStudent(data);
	        }
	    })

	    function removeStudent(data) {
	        $('.load').show();
	        $.ajax({
	            url: '${APIuser}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	                $('.load').hide();
	                if (result)
	                    window.location.href = "${MainURL}&message=delete_success&alert=success";
	                else
	                    window.location.href = "${MainURL}&message=delete_fail&alert=danger";
	            },
	            error: function (error) {
	                $('.load').hide();
	                window.location.href = "${MainURL}&message=system_error&alert=danger";
	            }
	        })
	    }
    </script>
</body>
</html>