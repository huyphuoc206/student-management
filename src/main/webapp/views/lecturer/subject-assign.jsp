<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-6">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách môn học
					</h6>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="form-group row justify-content-center">
					<label for="semesterList" class="col-form-label">Học kì</label>
					<div class="col-sm-6">
						<select class="custom-select form-control" id="semesterList">
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
							<th class="text-center">Tên môn học</th>
							<th class="text-center">Mã môn học</th>
							<th class="text-center">Thao tác</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	 <input type="hidden" value="${lecturer.id}" id="lecturerId"/>
	<script>
	  	const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Danh sách môn học'))
				element.classList.add("active")
		}
	  	$("#semesterList").on('change', function() {
			 const semesterId = this.value;
			 const lecturerId = $('#lecturerId').val();
			 getSubjectsBySemesterAndLecturer(semesterId, lecturerId);
		});
	  	 function loadSubjectsBySemesterAndLecturer(data) {
	    	  const table =  $('#dataTable').DataTable();
			   table.clear().draw();
			   let no = 1;
			   data.forEach(element => {
				   let url = '<a href="/giang-vien/danh-sach-lop?subjectAssignId='+ element.id +'" class="btn btn-success btn-circle btn-sm" title="Danh sách lớp"><i class="fas fa-address-book"></i></a>';
				   const row = table.row.add( [	
			            no,
			            element.subject.name,
			            element.subject.code,
			           	url
			        ] ).draw( false );
				   no++;
				   const rowNode = row.node();
				   $( rowNode ).find('td').eq(0).addClass('text-center');
				   $( rowNode ).find('td').eq(2).addClass('text-center');
				   $( rowNode ).find('td').eq(3).addClass('text-center');
			   })
		   }
		   
	   function getSubjectsBySemesterAndLecturer(semesterId, lecturerId) {
	        $('.load').show();
	        $.get('/api-lecturer-subject-assign', {semesterId: semesterId, lecturerId: lecturerId}, function (data) {
	        	 $('.load').hide();
               if (data != null)
               	loadSubjectsBySemesterAndLecturer(data);
	        });
	    }
	</script>
</body>
</html>