<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JWAt</title>
</head>
<body>
	<div class="row justify-content-end mb-5">
		<c:if test="${not empty message}">
			<div class="alert alert-${alert} text-center small mb-0">
				<span>${message}</span> <a href="#" class="close"
					data-dismiss="alert" aria-label="close">&times;</a>
			</div>
		</c:if>
	</div>
	<div class="d-sm-flex align-items-center justify-content-center mb-4">
		<h1 class="h3 mb-0 text-gray-800">Đổi mật khẩu</h1>
	</div>
	<form id="formSubmit">
		<div class="form-group row justify-content-center">
			<label for="oldPassword" class="col-sm-3 col-form-label">Mật khẩu cũ</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="oldPassword" name="oldPassword" required minlength="6"
						oninvalid="this.setCustomValidity('Mật khẩu từ 6 ký tự.')"
                           oninput="this.setCustomValidity('')">
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<label for="newPassword" class="col-sm-3 col-form-label">Mật khẩu mới</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="newPassword" name="newPassword" required minlength="6"
				oninvalid="this.setCustomValidity('Mật khẩu từ 6 ký tự.')"
                           oninput="this.setCustomValidity('')">
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<label for="newPasswordConfirm" class="col-sm-3 col-form-label">Nhập lại mật
				khẩu mới</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="newPasswordConfirm" name="newPasswordConfirm" required minlength="6" 
						oninvalid="this.setCustomValidity('Mật khẩu không khớp.')"
                           oninput="this.setCustomValidity('')">
			</div>
		</div>
		<div class="form-group row justify-content-center mt-4">
			<button class="btn btn-primary btn-icon-split" id="update" type="submit">
				<span class="icon text-white-50"> <i class="fa fa-key"></i>
				</span> <span class="text">Đổi mật khẩu</span>
			</button>
		</div>
		<input type="hidden" value="${USER.id}" id="userId" name="userId" />
	</form>
	<input type="hidden" value="${USER.role.code}" id="role" />
	<script type="text/javascript">
		const items = $(".nav-item")
		for (let element of items) {
			if(element.innerHTML.includes('Đổi mật khẩu'))
				element.classList.add("active")
			else 
				element.classList.remove("active")
		}
	 	window.onload = function () {
	        document.getElementById("newPassword").onchange = validatePassword;
	        document.getElementById("newPasswordConfirm").onchange = validatePassword;
	    }

	    function validatePassword() {
	        var pass2 = document.getElementById("newPassword").value;
	        var pass1 = document.getElementById("newPasswordConfirm").value;
	        if (pass1 != pass2)
	            document.getElementById("newPasswordConfirm").setCustomValidity("Passwords Don't Match");
	        else
	            document.getElementById("newPasswordConfirm").setCustomValidity('');
	    }
	    
	    $('#update').click(function (e) {
			if($('#formSubmit')[0].checkValidity()) {
			    e.preventDefault();
			    let data = {}; // mang object name: value
			    let formData = $('#formSubmit').serializeArray();
			    // vong lap
			    $.each(formData, function(i,v) {
			        data[''+v.name] = v.value
			    });
			    console.log(data)
			   changePassword(data);
			}
		})
		
		function changePassword(data) {
		    $('.load').show();
		    $.ajax({
		        url: '${APIurl}',
		        type: 'POST',
		        contentType: 'application/json',
		        data: JSON.stringify(data),
		        dataType: 'json',
		        success: function (result) {
		            $('.load').hide();
		            const role = $('#role').val();
		            let url = '';
		            if(role === 'ADMIN')
		            	url = '/quan-tri/doi-mat-khau'
	            	else if (role === 'LECTURER')
	            		url = '/giang-vien/doi-mat-khau'
	           		else if (role === 'STUDENT')
	           			url = '/sinh-vien/doi-mat-khau'
		            if(result)
		                window.location.href = url+"?message=change_password_sucess&alert=success";
		            else
		                window.location.href = url+"?message=current_password_wrong&alert=danger";
		        },
		        error: function (error) {
		            $('.load').hide();
		            const role = $('#role').val();
		            let url = '';
		            if(role === 'ADMIN')
		            	url = '/quan-tri/doi-mat-khau'
	            	else if (role === 'LECTURER')
	            		url = '/giang-vien/doi-mat-khau'
	           		else if (role === 'STUDENT')
	           			url = '/sinh-vien/doi-mat-khau'
		            window.location.href = url+"?message=system_error&alert=danger";
		        }
		    })
		}
	</script>
</body>
</html>