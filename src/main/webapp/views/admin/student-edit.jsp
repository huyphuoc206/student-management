<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-student" />
<c:url var="MainURL" value="/quan-tri/sinh-vien" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-between">
		<div>
			<a href="<c:url value='${ backUrl }'/>"
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
		<h1 class="h3 mb-0 text-gray-800">Cập nhật sinh viên</h1>
	</div>
	<c:if test="${not empty classDTOs}">
		<form id="formSubmit">
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="username">MSSV</label> <input type="text"
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
					<label for="gender">Giới tính</label> 
					<select id="gender" class="custom-select form-control" name="gender">
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
				<div class="form-group col-md-6">
					<label for="faculty">Khoa</label> 
					<select class="custom-select form-control" id="facultyList">
						<c:forEach var="item" items="${faculties}">
							<c:if test="${item.id == model.classDTO.facultyId}">
								<option value="${item.id}" selected>${item.name}</option>
							</c:if>
							<c:if test="${item.id != model.classDTO.facultyId}">
								<option value="${item.id}">${item.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="classList">Lớp</label> 
					<select id="classList" class="custom-select form-control" name="classId">
						<c:forEach var="item" items="${classDTOs}">
							<c:if test="${item.id == model.classId}">
								<option value="${item.id}" selected>${item.code}</option>
							</c:if>
							<c:if test="${item.id != model.classId}">
								<option value="${item.id}">${item.code}</option>
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
					<label for="">Trạng thái</label> 
					<select id="" class="custom-select form-control" name="status">
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
	</c:if>
		<c:if test="${empty classDTOs}">
		<form id="formSubmit">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="username">MSSV</label> <input type="text"
						class="form-control" id="username" name="username" value="${ model.user.username }" required>
				</div>
				<div class="form-group col-md-6">
					<label for="email">Email</label> <input type="email" class="form-control"
						id="email" name="email" value="${ model.user.email }" required>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="fullname">Họ tên</label> <input type="text" class="form-control"
						id="fullname" name="fullname" value="${ model.user.fullname }" required>
				</div>
				<div class="form-group col-md-6">
					<label for="phone">Số điện thoại</label> <input type="tel"
						class="form-control" id="phone" name="phoneNumber" value="${ model.user.phoneNumber }">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="dob">Ngày sinh</label> <input type="date"
						class="form-control" id="dob" name="dob" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${model.user.dob}" />" required>
				</div>
				<div class="form-group col-md-6">
					<label for="gender">Giới tính</label> 
					<select id="gender" class="custom-select form-control" name="gender">
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
				<div class="form-group col-md-6">
					<label for="faculty">Khoa</label> 
					<input type="text" value="${model.classDTO.facultyName}"
						readonly class="form-control" id="">
				</div>
				<div class="form-group col-md-6">
					<label for="classList">Lớp</label> 
					 <input type="text" value="${model.classDTO.code}"
						readonly class="form-control" id="">
				</div>
			</div>
			<div class="form-group row justify-content-center mt-2">
				<button class="btn btn-primary btn-icon-split" id="update" type="submit">
					<span class="icon text-white-50"> <i class="fa fa-check"></i>
					</span> <span class="text">Lưu</span>
				</button>
			</div>
			<input type="hidden" value="${model.id}" id="id" name="id" />
			<input type="hidden" value="${model.classId}" id="classId" name="classId" />
			<input type="hidden" value="${model.user.status}" id="status" name="status" />
		</form>
	</c:if>
	<input type="hidden" value="${model.user.id}" id="userId"/>
	<input type="hidden" value="${model.classId}" id="currentClassId"/>
	<input type="hidden" value="${model.classDTO.facultyId}" id="currentFacultyId"/>
	<input type="hidden" value="${classDTOs}" id="classDTOs"/>
	 <script>
	 	if($('#classDTOs').val() == '') {
	 		const items = $(".nav-item")
			for (let element of items) {
				if(element.innerHTML.includes('Quản lý lớp'))
					element.classList.add("active")
			}
	 	}
	 	else {
	 		$("#collapseTwo")[0].classList.add("show")
			$("#collapseTwo .collapse-item")[1].classList.add("active")
			const items = $(".nav-item")
			for (let element of items) {
				if(element.innerHTML.includes('Quản lý người dùng'))
					element.classList.add("active")
			}
	 	}
		
		$('#facultyList').on('change', function() {
			 const facultyId = this.value;
			 getClassByFacultyId(facultyId);
		});
		function loadClassByFaculty(data) {
		   const classList =  $('#classList')
		   let options = '';
		   options += '<option value="" disabled selected>Chọn lớp</option>'
		   data.forEach(element => {
			   options += '<option value="' + element.id + '">' + element.code +'</option>'
		   })
		   classList.html(options);
		}
		function loadClassByOldFaculty(data) {
			   const classList =  $('#classList')
			   let options = '';
			   const currentClassId = $('#currentClassId').val();
			   data.forEach(element => {
				   if(element.id == currentClassId) 
					 options += '<option value="' + element.id + '" selected>' + element.code +'</option>'
				   else
				  	 options += '<option value="' + element.id + '">' + element.code +'</option>'
			   })
			   classList.html(options);
		}   
	   function getClassByFacultyId(facultyId) {
	        $('.load').show();
	        $.get('/api-admin-class', {facultyId: facultyId}, function (data) {
	        	 $('.load').hide();
                if (data != null) {
                	const currentFacultyId = $('#currentFacultyId').val();
                	if(facultyId == currentFacultyId)
                		loadClassByOldFaculty(data);
                	else
                		loadClassByFaculty(data);
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
			    	if(v.name === 'id' || v.name === 'classId')
			        	data[''+v.name] = v.value
			        else 
			        	data['user'][''+v.name] = v.value
			    });
			    data['user']['id'] = $('#userId').val();
			    if(data['classId'] == null) data['classId'] = $('#currentClassId').val();
				updateStudent(data);
			}
		})
		
		function updateStudent(data) {
		    $('.load').show();
		    $.ajax({
		        url: '${APIurl}',
		        type: 'PUT',
		        contentType: 'application/json',
		        data: JSON.stringify(data),
		        dataType: 'json',
		        success: function (result) {
		            $('.load').hide();
		            let mainUrl = '';
		            if($('#classDTOs').val() == '') {
		            	let classId = result !== null ? result.classId : data.classId;
		            	let id = result !== null ? result.id : data.id;
		            	mainUrl = '/quan-tri/sinh-vien?classId='+classId+'&id='+id;
		            } else {
		            	let id = result !== null ? result.id : data.id;
		            	mainUrl = '/quan-tri/sinh-vien?id='+id;
		            }
		            if(result !== null) {
		            	window.location.href = mainUrl+"&message=update_success&alert=success";
		            }
		            else
		                window.location.href = mainUrl+"&message=username_email_exist&alert=danger";
		        },
		        error: function (error) {
		            $('.load').hide();
		            window.location.href = mainUrl+"&message=system_error&alert=danger";
		        }
		    })
		}
	   
	</script>
</body>
</html>