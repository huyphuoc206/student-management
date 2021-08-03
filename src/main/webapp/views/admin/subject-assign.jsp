<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-subject-assign" />
<c:url var="APIurlClass" value="/api-admin-class-assign" />
<c:url var="MainURL" value="/quan-tri/giao-mon-hoc?subjectId=${ model.id }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-between" id="notification">
		<div>
			<a href="<c:url value='/quan-tri/mon-hoc'/>"
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
				<i class="fa fa-plus-circle mr-2"></i>Giao môn học: <span>${ model.name }</span> - Bộ môn <span>${ model.department.name }</span> - Khoa <span>${ model.department.facultyName }</span>
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form id="formSubmit">
					<div class="form-group row justify-content-center">
						<label for="semesterAdd" class="col-sm-2 col-form-label">Học kì</label>
						<div class="col-sm-6">
							<select class="custom-select form-control" id="semesterAdd" required name="semesterId">
								<option value="" selected disabled>Chọn học kì</option>
								<c:forEach var="item" items="${semesters}">
									<option value="${item.id}">${ item.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="lecturerAdd" class="col-sm-2 col-form-label">Giảng viên</label>
						<div class="col-sm-6">
							<select class="custom-select form-control" id="lecturerAdd" required name="lecturerId">
								<option value="" disabled selected>Chọn giảng viên</option>
								<c:forEach var="item" items="${lecturers}">
									<option value="${item.id}">${ item.user.fullname }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row justify-content-center mt-4">
						<button class="btn btn-success btn-icon-split" id="add"
							type="submit">
							<span class="icon text-white-50"> <i class="fa fa-plus"></i>
							</span> <span class="text">Giao</span>
						</button>
					</div>
					<input type="hidden" value="${model.id}" id="subjectId" name="subjectId" />
				</form>
			</div>
		</div>
	</div>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-12">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách giảng viên dạy môn <span>${ model.name }</span>
					</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="form-group row justify-content-center">
					<label for="semesterList" class="col-form-label">Học kì</label>
					<div class="col-sm-6">
						<select id="semesterList" class="form-control custom-select">
							<option value="" selected disabled>Chọn học kì</option>
							<c:forEach var="item" items="${semesters}">
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
							<th class="text-center">Tên giảng viên</th>
							<th class="text-center">Tên tài khoản</th>
							<th class="text-center">Email</th>
							<th class="text-center">SĐT</th>
							<th class="text-center">Giới tính</th>
							<th class="text-center">Học vị</th>
							<th class="text-center">Giao lớp</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="showClass" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Danh sách lớp
						được dạy</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-borderless" width="50%" cellspacing="0" id="classSelected">
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Quay lại</button>
					<button class="btn btn-success" id="saveClass">Lưu</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa giảng viên khỏi môn học</h5>
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
    <input type="hidden" value="${model.department.facultyId}" id="facultyId" name="facultyId" />
    <script>
	    const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Quản lý môn học'))
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
				assignSubjectForLecturer(data);
			}
		})

		function assignSubjectForLecturer(data) {
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
						window.location.href = "${MainURL}&message=subject_assign_success&alert=success";
					else
						window.location.href = "${MainURL}&message=subject_assign_exist&alert=danger";
				},
				error : function(error) {
					$('.load').hide();
					window.location.href = "${MainURL}&message=system_error&alert=danger";
				}
			})
		}
	    
	    $("#semesterList").on('change', function() {
			 const semesterId = this.value;
			 const subjectId = $('#subjectId').val();
			 getLecturersBySemesterAndSubject(semesterId, subjectId);
		});
	    
	    function loadLecturersBySemesterAndSubject(data) {
	    	  const table =  $('#dataTable').DataTable();
			   table.clear().draw();
			   let no = 1;
			   data.forEach(element => {
				   let url = '<button class="btn btn-info btn-circle btn-sm m-1" data-toggle="modal" data-target="#showClass" title="Chọn lớp" onclick="showClass('+ element.subjectAssignId +')">' +
				   	'<span class="icon text-white-50 m-1"> <i class="fas fa-plus"></i></span></button>';
				   url = url + '<button data-toggle="modal" data-target="#removeModal" class="btn btn-danger btn-circle btn-sm m-1" title="Xóa"'
							+ 'onclick="remove(' + element.subjectAssignId + ')"><i class="fas fa-trash"></i></button>';
				   const row = table.row.add( [	
			            no,
			            element.user.fullname,
			            element.user.username,
			            element.user.email,
			            element.user.phoneNumber,
			            element.user.gender,
			            element.degree.name,
			           	url
			        ] ).draw( false );
				   no++;
				   const rowNode = row.node();
				   $( rowNode ).find('td').eq(0).addClass('text-center');
				   $( rowNode ).find('td').eq(4).addClass('text-center');
				   $( rowNode ).find('td').eq(5).addClass('text-center');
				   $( rowNode ).find('td').eq(6).addClass('text-center');
				   $( rowNode ).find('td').eq(7).addClass('text-center');
			   })
		   }
		   
	   function getLecturersBySemesterAndSubject(semesterId, subjectId) {
	        $('.load').show();
	        $.get('/api-admin-subject-assign', {semesterId: semesterId, subjectId: subjectId}, function (data) {
	        	 $('.load').hide();
                if (data != null)
                	loadLecturersBySemesterAndSubject(data);
	        });
	    }
	   
		let subjectAssignId = -1;
		function remove(id) {
			subjectAssignId = id;
		}
  	 	$('#remove').click(function (e) {
	        e.preventDefault();
	        let data = {}; 
	        if (subjectAssignId !== -1) {
	            data['id'] = subjectAssignId;
	            removeSubjectAssign(data);
	        }
	    })

	    function removeSubjectAssign(data) {
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
  	 	
  	 	let classAssignId = [];
  	 	function showClass(id) {
  	 		subjectAssignId = id;
  	 		classAssignId = [];
  	 		const facultyId = $('#facultyId').val();
  	 		getAllClass(facultyId, subjectAssignId);
  	 	}
  	  	function getAllClass(facultyId, subjectAssignId) {
	        $('.load').show();
	        $.get('/api-admin-class', {facultyId: facultyId}, function (allClass) {
              if (allClass != null)	
            	  getClassAssign(allClass, subjectAssignId);
	        });
	  	}
  	  	function getClassAssign(allClass, subjectAssignId) {
  		  	$.get('/api-admin-class-assign', {subjectAssignId: subjectAssignId}, function (classAssign) {
  		  		$('.load').hide();
         	  	loadClassAssign(allClass, classAssign);
	        });
  	  	}
  	  	
  	  	function loadClassAssign(allClass, classAssign) {
  	  		const classSelected = $('#classSelected');
		  	let rows = [];
		  	if (allClass.length === 0) {
		  		classSelected.html("Danh sách lớp rỗng");
		  		return;
		  	}
		  	if (classAssign === null) {
		  		allClass.forEach(element => {
	  		  		const tr = '<tr><td class="text-center"><input type="checkbox" id="checkbox_'+ element.id +'" name="options[]" value="' + element.id +'">' +
	  		  					'<label class="mb-0 ml-3" for="checkbox_' + element.id +'">'+ element.code + '</label></td></tr>';
	  		  		rows.push(tr);
	  		  	})
	  		  	
		  	} else {
		  		classAssignId = classAssign;
		  		allClass.forEach(element => {
		  			let checked = '';
		  			if(classAssign.includes(element.id)) checked = 'checked'
	  		  		const tr = '<tr><td class="text-center"><input type="checkbox" id="checkbox_'+ element.id +'" name="options[]" value="' + element.id +'"'+checked+' >' +
	  		  					'<label class="mb-0 ml-3" for="checkbox_' + element.id +'">'+ element.code + '</label></td></tr>';
	  		  		rows.push(tr);
	  		  	})
		  	}
		  	classSelected.html(rows.join(""));
  	  	}
  	  	
  	  	$('#saveClass').click(function (e) {
	        e.preventDefault();
	        let data = {};
	        let dataArray = $('#classSelected input[type=checkbox]:checked').map(function () {
	            return parseInt($(this).val()); 
	        }).get();
	        if (dataArray.length != 0) {
	            data['classIds'] = dataArray;
	        }
	        data['subjectAssignId'] = subjectAssignId;
	        // no change class assign
	        if(JSON.stringify(dataArray) == JSON.stringify(classAssignId))
	        	 $('#showClass').modal('hide');
	        else {
	        	assignClass(data);
	        }
	    })
	    
	    function assignClass(data) {
			$('.load').show();
			$.ajax({
				url : '${APIurlClass}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					$('.load').hide();
					let notification = '<div><a href="/quan-tri/mon-hoc" class="btn btn-info btn-icon-split mb-3" id="preLink"> <span class="icon text-white-50">' + 
					'<i class="fa fa-arrow-left"></i></span> <span class="text">Quay lại</span></a></div>'
					let alert;
					let message;
					if (result) {
						alert = 'success';
						message = 'Giao lớp thành công';
					}
					else {
						alert = 'danger';
						message = 'Giao lớp thất bại';
					}
					notification += '<div class="alert alert-' + alert + ' text-center small"><span>' + message + '</span> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>';
					$("#notification").html(notification)		
					 $('#showClass').modal('hide');
				},
				error : function(error) {
					$('.load').hide();
					window.location.href = "${MainURL}&message=system_error&alert=danger";
				}
			})
		}
    </script>
</body>
</html>