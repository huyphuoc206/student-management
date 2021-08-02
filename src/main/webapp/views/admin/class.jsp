<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-class" />
<c:url var="MainURL" value="/quan-tri/lop" />
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
				<i class="fa fa-plus-circle mr-2"></i>Thêm mới lớp
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form id="formSubmit">
					<div class="form-group row justify-content-center">
						<label for="name" class="col-sm-2 col-form-label">Tên lớp</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="name" name="name"
								required>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="code" class="col-sm-2 col-form-label">Mã lớp</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="code" name="code"
								required>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="schoolYear" class="col-sm-2 col-form-label">Khóa</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="schoolYear" name="schoolYear" required>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="" class="col-sm-2 col-form-label">Khoa</label>
						<div class="col-sm-6">
							<select class="custom-select form-control" id="faculty"
								name="facultyId" required>
								<option value="" selected disabled>Chọn khoa</option>
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
						<i class="fa fa-list-alt mr-2"></i>Danh sách lớp
					</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="form-group row justify-content-center">
					<label for="" class="col-form-label">Khoa</label>
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
				<table class="table table-bordered table-hover table-hover"
					id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">STT</th>
							<th class="text-center">Tên lớp</th>
							<th class="text-center">Mã lớp</th>
							<th class="text-center">Khóa</th>
							<th class="text-center">Khoa</th>
							<th class="text-center">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model}" varStatus="loop">
							<tr>
								<td class="text-center">${loop.index + 1}</td>
								<td>${ item.name }</td>
								<td class="text-center">${ item.code }</td>
								<td class="text-center">${ item.schoolYear }</td>
								<td>${ item.facultyName }</td>
								<td class="text-center">
									<a href="<c:url value='/quan-tri/lop?id=${ item.id }'/>"
									class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật"> <i
										class="fas fa-pen"></i></a>
									<button data-toggle="modal" data-target="#removeModal"
									class="btn btn-danger btn-circle btn-sm m-1" title="Xóa" onclick="remove(${ item.id })"> <i
										class="fas fa-trash"></i></button>
									<a href="<c:url value='/quan-tri/sinh-vien?classId=${ item.id }'/>"
									class="btn btn-success btn-circle btn-sm m-1"
									title="Danh sách sinh viên"> <i class="fas fa-list"></i></a>
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
                    <h5 class="modal-title" id="exampleModalLabel">Xóa lớp</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Bạn chắc chắn muốn xóa lớp này?</div>
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
    	
		$('#add').click(function(e) {
			if($('#formSubmit')[0].checkValidity()) {
				e.preventDefault();
				let data = {};
				let formData = $('#formSubmit').serializeArray();
				// vong lap
				$.each(formData, function(i, v) {
					data['' + v.name] = v.value
				});
				addClass(data);
			}
		})

		function addClass(data) {
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
		
		let classId = -1;
		function remove(id) {
			classId = id;
		}
		
		 $('#remove').click(function (e) {
		        e.preventDefault();
		        let data = {}; 
		        if (classId  !== -1) {
		            data['id'] = classId;
		            removeClass(data);
		        }
	    })
	    
	    function removeClass(data) {
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
			 getClassByFacultyId(facultyId);
		});
		 
	   function loadClassByFaculty(data) {
		   const table =  $('#dataTable').DataTable();
		   table.clear().draw();
		   let no = 1;
		   data.forEach(element => {
			   let url = '<a href = "'+'/quan-tri/lop?id=' + element.id +'" class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật"> <i class="fas fa-pen"></i></a>';
			   url = url + '<button data-toggle="modal" data-target="#removeModal" class="btn btn-danger btn-circle btn-sm m-1" title="Xóa"'
						+ 'onclick="remove(' + element.id + ')"><i class="fas fa-trash"></i></button>';
				url = url + '<a href="'+'sinh-vien?classId=' + element.id + '" class="btn btn-success btn-circle btn-sm m-1" title="Danh sách sinh viên"> <i class="fas fa-list"></i></a>'	;					
			   const row = table.row.add( [	
		            no,
		            element.name,
		            element.code,
		            element.schoolYear,
		            element.facultyName,
		           	url
		        ] ).draw( false );
			   no++;
			   const rowNode = row.node();
			   $( rowNode ).find('td').eq(0).addClass('text-center');
			   $( rowNode ).find('td').eq(2).addClass('text-center');
			   $( rowNode ).find('td').eq(3).addClass('text-center');
			   $( rowNode ).find('td').eq(5).addClass('text-center');
		   })
	   }
	   
	   function getClassByFacultyId(facultyId) {
	        $('.load').show();
	        $.get('/api-admin-class', {facultyId: facultyId}, function (data) {
	        	 $('.load').hide();
                if (data != null)
                   loadClassByFaculty(data);
	        });
	    }
	</script>
</body>
</html>