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
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h5 font-weight-bold mb-4 text-primary">HỆ
											THỐNG QUẢN LÝ SINH VIÊN</h1>
									</div>
									<div class="text-center">
										<h1 class="h5 text-gray-900 mb-4">Đăng nhập</h1>
									</div>
									<c:if test="${not empty message}">
										<div class="alert alert-${alert} text-center small">
											<span>${message}</span> <a href="#" class="close"
												data-dismiss="alert" aria-label="close">&times;</a>
										</div>
									</c:if>

									<form class="user" action="dang-nhap" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="username" name="username" required
												oninvalid="this.setCustomValidity('Hãy nhập tên đăng nhập!')"
												oninput="this.setCustomValidity('')" autofocus
												placeholder="Tên tài khoản" value="vttuan">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="password" name="password" required
												oninvalid="this.setCustomValidity('Hãy nhập mật khẩu!')"
												oninput="this.setCustomValidity('')" placeholder="Mật khẩu" value="123456">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="remember"> <label class="custom-control-label"
													for="remember">Ghi nhớ</label>
											</div>
										</div>
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Đăng nhập
										</button>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="">Quên mật khẩu?</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>