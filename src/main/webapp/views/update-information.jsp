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
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-center mb-4">
		<h1 class="h3 mb-0 text-gray-800">Cập nhật thông tin</h1>
	</div>
	<form>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="">Tên tài khoản</label> <input type="text" readonly
					class="form-control" id="">
			</div>
			<div class="form-group col-md-6">
				<label for="">Email</label> <input type="email" class="form-control"
					id="">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="">Họ tên</label> <input type="text" class="form-control"
					id="">
			</div>
			<div class="form-group col-md-6">
				<label for="inputEmail4">Số điện thoại</label> <input type="tel"
					class="form-control" id="inputEmail4">
			</div>
		</div>
		<!-- student -->
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="">Ngày sinh</label> <input type="date"
					class="form-control" id="">
			</div>
			<div class="form-group col-md-6">
				<label for="">Giới tính</label> <select id="" class="form-control">
					<option value="MALE">Nam</option>
					<option value="FEMALE">Nữ</option>
				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCity">Khoa</label> <input type="text" readonly
					class="form-control" id="inputEmail4" value="Công nghệ thông tin">
			</div>
			<div class="form-group col-md-6">
				<label for="">Lớp</label> <input type="text" readonly
					class="form-control" id="inputEmail4" value="DH18DTB">
			</div>
		</div>
		<!-- lecturer -->
		<!-- <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="">Ngày sinh</label>
                                <input type="date" class="form-control" id="">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Giới tính</label>
                                <select id="" class="form-control">
                                  <option value="MALE">Nam</option>
                                  <option value="FEMALE">Nữ</option>
                                </select>
                            </div>   
                            <div class="form-group col-md-4">
                                <label for="inputCity">Học vị</label>
                                <input type="text" readonly class="form-control" id="inputEmail4" value="Tiến sĩ">
                            </div>
                        </div>       
                        <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="inputCity">Khoa</label>
                              <input type="text" readonly class="form-control" id="inputEmail4" value="Công nghệ thông tin">
                            </div>
                            <div class="form-group col-md-6">
                              <label for="">Bộ môn</label>
                              <input type="text" readonly class="form-control" id="inputEmail4" value="Công nghệ phần mềm">
                            </div>
                          </div>
                        <div class="form-group row justify-content-center mt-2">                      
                            <button class="btn btn-primary btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="fa fa-check"></i>
                                </span>
                                <span class="text">Lưu</span>
                            </button>
                        </div>              -->
	</form>
</body>
</html>