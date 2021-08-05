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
	<div class="row justify-content-center mb-3">
		<div class="card shadow">
			<div class="card-body small">
				<table class="table table-borderless table-sm mb-0">
					<tbody>
						<tr>
							<td class="text-left pr-5">Mã sinh viên</td>
							<td class="text-left font-weight-bold">${ model.user.username }</td>
						</tr>
						<tr>
							<td class="text-left">Tên sinh viên</td>
							<td class="text-left font-weight-bold">${ model.user.fullname }</td>
						</tr>
						<tr>
							<td class="text-left">Ngày sinh</td>
							<td class="text-left font-weight-bold"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${model.user.dob}" /></td>
						</tr>
						<tr>
							<td class="text-left">Giới tính</td>
							<td class="text-left font-weight-bold">${ model.user.gender }</td>
						</tr>
						<tr>
							<td class="text-left">Lớp</td>
							<td class="text-left font-weight-bold">${ model.classDTO.code } (${ model.classDTO.name })</td>
						</tr>
						<tr>
							<td class="text-left">Khoa</td>
							<td class="text-left font-weight-bold">${ model.classDTO.facultyName }</td>
						</tr>
						<tr>
							<td class="text-left">Khóa học</td>
							<td class="text-left font-weight-bold">${ model.classDTO.schoolYear }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="form-group row justify-content-center">
		<label for="" class="col-form-label">Chọn học kì xem điểm: </label>
		<div class="col-lg-4 col-sm-8">
			<select class="custom-select form-control" id="semesterList">
				<option value="" disabled selected>Chọn học kì</option>
				<c:forEach var="item" items="${semester}">
					<option value="${ item.id }">${ item.name }</option>
				</c:forEach>
					<option value="-1" >Xem tất cả</option>
			</select>
		</div>
	</div>

	<div id="dashboard">
	</div>
	<input type="hidden" value="${ model.id }" id="studentId"/>
	<script>
		const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Xem điểm'))
				element.classList.add("active")
		}
		$('#semesterList').on('change', function() {
			 const semesterId = this.value;
			 const studentId = $('#studentId').val();
			 getScoreDashboardBySemester(semesterId, studentId);
		});
		function getScoreDashboardBySemester(semesterId, studentId) {
	        $('.load').show();
	        $.get('/api-student-score', {semesterId: semesterId, studentId: studentId}, function (data) {
	        	 $('.load').hide();
                if (data != null)
                	loadScoreDashboard(data);
	        });
	    }
		function loadScoreDashboard(data) {
			$('#dashboard').html('');
		   const scoreDashboard = data['scoreDashboard'];
		   const averageScores = data['averageScores']
		   const semesters = {
			      <c:forEach items="${semester}" var="item">
			        '<c:out value="${item.id}" />': '<c:out value="${item.name}" />',  
			      </c:forEach>
		   };
			for (const property in scoreDashboard) {
				 const semesterName = semesters[property];
				 const data = {
					semester: semesterName,
					scores: scoreDashboard[property],
					averageScoreFour: averageScores[property]['averageScoreFour'],
					averageScoreTen: averageScores[property]['averageScoreTen']
				 }
				 appendView(data);
			}
		}
		
		function appendView(data) {
			const dashboard = $('#dashboard');
			let content = '<div class="card shadow mb-4"><div class="card-header py-3"><div class="row align-items-center"><div class="col-12">'
				+'<h6 class="m-0 font-weight-bold text-primary"><i class="fa fa-calendar mr-2"></i><span>' + data['semester'] + '</span></h6></div></div></div>';
			content += '<div class="card-body"><div class="table-responsive"><table class="table table-bordered table-hover" width="100%" cellspacing="0"><thead>'
				+'<tr><th class="text-center">STT</th><th class="text-center">Tên môn học</th><th class="text-center">Quá trình<br>(20%)</th>'
				+'<th class="text-center">Giữa kì<br>(30%)</th><th class="text-center">Cuối kì<br>(50%)</th><th class="text-center">Tổng kết</th></tr></thead><tbody>';
			let no = 1;
			data['scores'].forEach(e => {
				const processScore = e['processScore'] == null ? '' : e['processScore'];
				const midTermScore = e['midTermScore'] == null ? '' : e['midTermScore'];
				const endTermScore = e['endTermScore'] == null ? '' : e['endTermScore'];
				const finalScore = e['finalScore'] == null ? '' : e['finalScore'];
				
				content += '<tr><td class="text-center">' + no + '</td><td>' + e['subjectName'] + '</td><td class="text-center">' + processScore + '</td>';
				content += '<td class="text-center">' + midTermScore + '</td><td class="text-center">' + endTermScore + '</td><td class="text-center">'
							+ finalScore +'</td></tr>';
				no++;
			})
			const averageScoreTen = data['averageScoreTen'] == null ? '' : data['averageScoreTen'];
			const averageScoreFour = data['averageScoreFour'] == null ? '' : data['averageScoreFour'];
			content += '</tbody></table></div></div><div class="card-footer"><table><tr><td class="text-left pr-5 font-weight-bold">Điểm trung bình học kỳ hệ 10:</td>';
			content += '<td class="text-left font-weight-bold">' + averageScoreTen + '</td></tr><tr><td class="text-left pr-5 font-weight-bold">Điểm trung bình học kỳ hệ 4:</td>';
			content += '<td class="text-left font-weight-bold">' + averageScoreFour + '</td></tr></table></div></div>';
			
			dashboard.append(content);
		}
	</script>
</body>
</html>