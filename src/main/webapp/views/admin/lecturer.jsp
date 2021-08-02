<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-lecturer" />
<c:url var="APIuser" value="/api-user" />
<c:url var="MainURL" value="/quan-tri/giang-vien" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-end" id="notification">
		<c:if test="${not empty message}">
			<div class="alert alert-${alert} text-center small">
				<span>${message}</span> <a href="#" class="close"
					data-dismiss="alert" aria-label="close">&times;</a>
			</div>
		</c:if>
	</div>
	<div class="card shadow mb-4">
		<a href="#collapseCardExample" class="d-block card-header py-3"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fa fa-plus-circle mr-2"></i>Thêm mới giảng viên
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form id="formSubmit">
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="username">Tên tài khoản</label> <input type="text"
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
							<label for="gender">Giới tính</label> <select id="gender" name="gender"
								class="form-control">
								<option value="Nam">Nam</option>
								<option value="Nữ">Nữ</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="degree">Học vị</label> 
							<select id="degree" class="form-control" name="degreeId" required>
								<option value="" selected disabled>Chọn học vị</option>
								<c:forEach var="item" items="${degrees}">
									<option value="${item.id}">${ item.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-md-4">
							<label for="facultyListAdd">Khoa</label>
							<select id="facultyListAdd" class="form-control">
								<option value="" selected disabled>Chọn khoa</option>
								<c:forEach var="item" items="${faculties}">
									<option value="${item.id}">${ item.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-md-4">
							<label for="departmentListAdd">Bộ môn</label> 
							<select id="departmentListAdd" class="form-control" required name="departmentId">
							</select>
						</div>
					</div>
					<div class="form-group row justify-content-center mt-2">
						<button class="btn btn-success btn-icon-split" id="add"
							type="submit">
							<span class="icon text-white-50"> <i class="fa fa-plus"></i>
							</span> <span class="text">Thêm</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-12">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách giảng viên
					</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="facultyList">Khoa</label> 
						<select class="custom-select form-control" id="facultyList">
							<option value="-1">Tất cả</option>
							<c:forEach var="item" items="${faculties}">
								<option value="${item.id}">${ item.name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group col-md-6">
						<label for="departmentList">Bộ môn</label>
						 <select id="departmentList" class="form-control">
						</select>
					</div>
				</div>
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">STT</th>
							<th class="text-center">Tên tài khoản</th>
							<th class="text-center">Họ tên</th>
							<th class="text-center">Email</th>
							<th class="text-center">SĐT</th>
							<th class="text-center">Ngày sinh</th>
							<th class="text-center">Giới tính</th>
							<th class="text-center">Học vị</th>
							<th class="text-center">Bộ môn</th>
							<th class="text-center">Khoa</th>
							<th class="text-center">Ngày tạo</th>
							<th class="text-center">Trạng thái</th>
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
							<td>${item.degree.name}</td>
							<td>${ item.department.name }</td>
							<td>${ item.department.facultyName }</td>
							<td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${item.user.createdDate}" /></td>
							<td class="text-center">
								<c:if test="${item.user.status == 1}">
									<div class="btn-success btn-circle btn-sm" title="Hoạt động">
										<i class="fas fa-check"></i>
									</div>
								</c:if>
								<c:if test="${item.user.status == 0}">
									<div class="btn-danger btn-circle btn-sm" title="Ngưng hoạt động">
										<i class="fas fa-ban"></i>
									</div>
								</c:if>
							</td>
							<td class="text-center">
								<a href="<c:url value='/quan-tri/giang-vien?id=${ item.id }'/>"
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
                    <h5 class="modal-title" id="exampleModalLabel">Xóa giảng viên</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Bạn chắc chắn muốn xóa giảng viên này?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
					<button id="remove" class="btn btn-danger">Xóa</button>
                </div>
            </div>
        </div>
    </div>
     <script>
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
     	function formatDate(timestamp) {
     		const date = new Date(timestamp);
     		const year = date.getFullYear();
     		const month = ("0" + (date.getMonth() + 1)).slice(-2);
     		const day = ("0" + date.getDate()).slice(-2);
     		return day + '-' + month + '-' + year;
     	}
		$("#collapseTwo")[0].classList.add("show")
		$("#collapseTwo .collapse-item")[0].classList.add("active")
		
		$('#facultyList').on('change', function() {
			 const facultyId = this.value;
			 getDepartmentByFacultyId(facultyId, "#departmentList");
			 getLecturersByFacultyId(facultyId);
		});
		$('#facultyListAdd').on('change', function() {
			 const facultyId = this.value;
			 getDepartmentByFacultyId(facultyId, "#departmentListAdd");
		});
		$('#departmentList').on('change', function() {
			 const departmentId = this.value;
			 getLecturersByDepartmentId(departmentId);
		});
		
		function loadDepartmentsByFaculty(data, elementId) {
		   const departmentList =  $(elementId)
		   let options = '<option value="" selected disabled> Chọn bộ môn </option>';
		   data.forEach(element => {
			   options += '<option value="' + element.id + '">' + element.name +'</option>'
		   })
		   departmentList.html(options);
		}
	  	function getDepartmentByFacultyId(facultyId, elementId) {
		  	if(facultyId === '-1') 
		  		$(elementId).html('')
		  	else {
			  	$('.load').show();
		        $.get('/api-admin-department', {facultyId: facultyId}, function (data) {
		        	 $('.load').hide();
	              if (data != null)
	                 loadDepartmentsByFaculty(data, elementId);
		        });
		  	}
	    }
	  	
		function loadLecturers(data) {
			 const table =  $('#dataTable').DataTable();
			   table.clear().draw();
			   let no = 1;
			   data.forEach(element => {
				   let url = '<a href = "'+'/quan-tri/giang-vien?id=' + element.id +'" class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật"> <i class="fas fa-pen"></i></a>';
				   url = url + '<button data-toggle="modal" data-target="#removeModal" class="btn btn-danger btn-circle btn-sm m-1" title="Xóa"'
							+ 'onclick="remove(' + element.user.id + ')"><i class="fas fa-trash"></i></button>';
				   const dob = formatDate(element.user.dob);
				   const createdDate = formatDate(element.user.createdDate);
				   let status = ''
				   if(element.user.status === 1)
					   status = '<div class="btn-success btn-circle btn-sm" title="Hoạt động"><i class="fas fa-check"></i></div>'
				   else if(element.user.status === 0)
					   status = '<div class="btn-danger btn-circle btn-sm" title="Ngưng hoạt động"><i class="fas fa-ban"></i></div>'
				   const row = table.row.add( [	
			            no,
			            element.user.username,
			            element.user.fullname,
			            element.user.email,
			            element.user.phoneNumber,
			            dob,
			            element.user.gender,
			            element.degree.name,
			            element.department.name,
			            element.department.facultyName,
			            createdDate,
			            status,
			           	url
			        ] ).draw( false );
				   no++;
				   const rowNode = row.node();
				   $( rowNode ).find('td').eq(0).addClass('text-center');
				   $( rowNode ).find('td').eq(4).addClass('text-center');
				   $( rowNode ).find('td').eq(5).addClass('text-center');
				   $( rowNode ).find('td').eq(6).addClass('text-center');
				   $( rowNode ).find('td').eq(7).addClass('text-center');
				   $( rowNode ).find('td').eq(10).addClass('text-center');
				   $( rowNode ).find('td').eq(11).addClass('text-center');
				   $( rowNode ).find('td').eq(12).addClass('text-center');
			   })
		}
	  	function getLecturersByFacultyId(facultyId) {
		  	$('.load').show();
	        $.get('/api-admin-lecturer', {facultyId: facultyId}, function (data) {
	        	 $('.load').hide();
              if (data != null)
            	  loadLecturers(data);
	        });
	    }
	  	function getLecturersByDepartmentId(departmentId) {
		  	$('.load').show();
	        $.get('/api-admin-lecturer', {departmentId: departmentId}, function (data) {
	        	 $('.load').hide();
              if (data != null)
            	  loadLecturers(data);
	        });
	    }
	  	
	  	$('#add').click(function(e) {
			if($('#formSubmit')[0].checkValidity()) {
				e.preventDefault();
				let data = {};
				data['user'] = {};
				let formData = $('#formSubmit').serializeArray();
				// vong lap
				$.each(formData, function(i, v) {
					if(v.name === 'degreeId' || v.name === 'departmentId')
			        	data[''+v.name] = v.value
			        else 
			        	data['user'][''+v.name] = v.value
				});
				addLecturer(data);
			}
		})

		function addLecturer(data) {
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
						window.location.href = "${MainURL}?message=insert_success&alert=success";
					else {
						let username_email_exist = '<div class="alert alert-danger text-center small"><span>Tên tài khoản hoặc email đã tồn tại.</span>'
						 + '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
						$("#notification").html(username_email_exist)
					}
					
				},
				error : function(error) {
					$('.load').hide();
					window.location.href = "${MainURL}?message=system_error&alert=danger";
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
	            removeLecturer(data);
	        }
	    })

	    function removeLecturer(data) {
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
	                    window.location.href = "${MainURL}?message=delete_success&alert=success";
	                else
	                    window.location.href = "${MainURL}?message=delete_fail&alert=danger";
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