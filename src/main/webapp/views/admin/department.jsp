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
	<div class="row justify-content-end">
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
				<i class="fa fa-plus-circle mr-2"></i>Thêm mới bộ môn
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form id="formSubmit">
					<div class="form-group row justify-content-center">
						<label for="name" class="col-sm-2 col-form-label">Tên bộ
							môn</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="name" name="name"
								required>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="code" class="col-sm-2 col-form-label">Mã bộ
							môn</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="code" name="code"
								required>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="faculty" class="col-sm-2 col-form-label">Khoa</label>
						<div class="col-sm-6">
							<select class="custom-select form-control" id="faculty"
								name="facultyId">
								<c:forEach var="item" items="${faculties}">
									<option value="${item.id}">${ item.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row justify-content-center mt-4">
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
						<i class="fa fa-list-alt mr-2"></i>Danh sách bộ môn
					</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="form-group row justify-content-center">
					<label for="facultyList" class="col-form-label">Khoa</label>
					<div class="col-sm-6">
						<select class="custom-select form-control" id="facultyList"
							name="facultyId">
							<option value="-1">Tất cả</option>
							<c:forEach var="item" items="${faculties}">
								<option value="${item.id}">${ item.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">STT</th>
							<th class="text-center">Tên bộ môn</th>
							<th class="text-center">Mã bộ môn</th>
							<th class="text-center">Trưởng bộ môn</th>
							<th class="text-center">Khoa</th>
							<th class="text-center">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model}" varStatus="loop">
							<tr>
								<td class="text-center">${loop.index + 1}</td>
								<td>${ item.name }</td>
								<td>${ item.code }</td>
								<td>${ item.lecturerName }</td>
								<td>${ item.facultyName }</td>
								<td class="text-center">
									<a
										href="<c:url value='/quan-tri/bo-mon?id=${ item.id }'/>"
										class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật">
											<i class="fas fa-pen"></i>
									</a>
									<button data-toggle="modal" data-target="#removeModal"
										class="btn btn-danger btn-circle btn-sm m-1" title="Xóa"
										onclick="remove(${ item.id })">
										<i class="fas fa-trash"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="removeModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xóa bộ môn</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Bạn chắc chắn muốn xóa bộ môn này?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<button id="remove" class="btn btn-danger">Xóa</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Quản lý bộ môn'))
				element.classList.add("active")
			else 
				element.classList.remove("active")
		}
		$('#add').click(function(e) {
			if($('#formSubmit')[0].checkValidity()) {
				e.preventDefault();
				let data = {};
				let formData = $('#formSubmit').serializeArray();
				// vong lap
				$.each(formData, function(i, v) {
					data['' + v.name] = v.value
				});
				addDepartment(data);
			}
		})

		function addDepartment(data) {
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
					else
						window.location.href = "${MainURL}?message=insert_fail&alert=danger";
				},
				error : function(error) {
					$('.load').hide();
					window.location.href = "${MainURL}?message=system_error&alert=danger";
				}
			})
		}
		
		let departmentId = -1;
		function remove(id) {
			departmentId = id;
		}
		 $('#remove').click(function (e) {
		        e.preventDefault();
		        let data = {}; 
		        if (departmentId  !== -1) {
		            data['id'] = departmentId;
		            removeDepartment(data);
		        }
		    })

	    function removeDepartment(data) {
	        $('.load').show();
	        $.ajax({
	            url: '${APIurl}',
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
		 
		$('#facultyList').on('change', function() {
			 const facultyId = this.value;
			 getDepartmentsByFacultyId(facultyId);
		});
		 
	   function loadDepartmentsByFaculty(data) {
		   const table =  $('#dataTable').DataTable();
		   table.clear().draw();
		   let no = 1;
		   data.forEach(element => {
			   let url = '<a href = "'+'/quan-tri/bo-mon?id=' + element.id +'" class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật"> <i class="fas fa-pen"></i></a>';
			   url = url + '<button data-toggle="modal" data-target="#removeModal" class="btn btn-danger btn-circle btn-sm m-1" title="Xóa"'
						+ 'onclick="remove(' + element.id + ')"><i class="fas fa-trash"></i></button>';
			   const row = table.row.add( [	
		            no,
		            element.name,
		            element.code,
		            element.lecturerName,
		            element.facultyName,
		           	url
		        ] ).draw( false );
			   no++;
			   const rowNode = row.node();
			   $( rowNode ).find('td').eq(0).addClass('text-center');
			   $( rowNode ).find('td').eq(5).addClass('text-center');
		   })
	   }
	   
	   function getDepartmentsByFacultyId(facultyId) {
	        $('.load').show();
	        $.get('/api-admin-department', {facultyId: facultyId}, function (data) {
	        	 $('.load').hide();
                if (data != null)
                   loadDepartmentsByFaculty(data);
	        });
	    }
	</script>
</body>
</html>