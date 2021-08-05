<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-user" />
<c:url var="MainURL" value="/quan-tri/sinh-vien" />
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
		<div class="card-header py-3">
			<div class="row align-items-center">
				<div class="col-12">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fa fa-list-alt mr-2"></i>Danh sách sinh viên
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
							<th class="text-center">Lớp</th>
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
							<td>${item.classDTO.code}</td>
							<td>${item.classDTO.facultyName}</td>
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
								<a href="<c:url value='/quan-tri/sinh-vien?id=${ item.id }'/>"
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
		$("#collapseTwo")[0].classList.add("show")
		$("#collapseTwo .collapse-item")[1].classList.add("active")
		const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Quản lý người dùng'))
				element.classList.add("active")
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