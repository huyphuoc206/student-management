<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-faculty" />
<c:url var="MainURL" value="/quan-tri/khoa" />
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
				<i class="fa fa-plus-circle mr-2"></i>Thêm mới khoa
			</h6>
		</a>
		<div class="collapse" id="collapseCardExample">
			<div class="card-body">
				<form id="formSubmit">
					<div class="form-group row justify-content-center">
						<label for="name" class="col-sm-2 col-form-label">Tên khoa</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="name" name="name"
								required>
						</div>
					</div>
					<div class="form-group row justify-content-center">
						<label for="code" class="col-sm-2 col-form-label">Mã khoa</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="code" name="code"
								required>
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
						<i class="fa fa-list-alt mr-2"></i>Danh sách khoa
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
							<th class="text-center">Tên khoa</th>
							<th class="text-center">Mã khoa</th>
							<th class="text-center">Trưởng khoa</th>
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
								<td class="text-center"><a
									href="<c:url value='/quan-tri/khoa?id=${ item.id }'/>"
									class="btn btn-info btn-circle btn-sm m-1" title="Cập nhật">
										<i class="fas fa-pen"></i>
								</a>
									<button data-toggle="modal" data-target="#removeModal"
										class="btn btn-danger btn-circle btn-sm m-1" title="Xóa"
										onclick="remove(${ item.id })">
										<i class="fas fa-trash"></i>
									</button></td>
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
					<h5 class="modal-title" id="exampleModalLabel">Xóa khoa</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Bạn chắc chắn muốn xóa khoa này?</div>
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
			if(element.innerHTML.includes('Quản lý khoa'))
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
				addFaculty(data);
			}
		})

		function addFaculty(data) {
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
		
		let facultyId = -1;
		function remove(id) {
			facultyId = id;
		}
		 $('#remove').click(function (e) {
		        e.preventDefault();
		        let data = {}; 
		        if (facultyId  !== -1) {
		            data['id'] = facultyId;
		            removeFaculty(data);
		        }
		    })

	    function removeFaculty(data) {
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
	</script>
</body>
</html>