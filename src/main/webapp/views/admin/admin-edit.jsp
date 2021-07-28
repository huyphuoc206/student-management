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
	<a href="admin.html" class="btn btn-info btn-icon-split mb-3">
	    <span class="icon text-white-50">
	        <i class="fa fa-arrow-left"></i>
	    </span>
	    <span class="text">Quay lại</span>
	</a>
	 <!-- Page Heading -->
	 <div class="d-sm-flex align-items-center justify-content-center mb-4">
	    <h1 class="h3 mb-0 text-gray-800">Cập nhật quản trị viên</h1>
	</div>
	<form>
	    <div class="form-row">
	      <div class="form-group col-md-4">
	        <label for="">Tên tài khoản</label>
	        <input type="text" readonly class="form-control" id="">
	      </div>
	      <div class="form-group col-md-4">
	        <label for="">Email</label>
	        <input type="email" class="form-control" id="">
	      </div>
	      <div class="form-group col-md-4">
	        <label for="">Họ tên</label>
	        <input type="text" class="form-control" id="">
	      </div>
	    </div>
	    <div class="form-row">
	        <div class="form-group col-md-6">
	          <label for="">Mật khẩu</label>
	          <input type="password" class="form-control" id="">
	        </div>
	        <div class="form-group col-md-6">
	          <label for="">Nhập lại mật khẩu</label>
	          <input type="password" class="form-control" id="">
	        </div>
	    </div>
	    <div class="form-row">
	        <div class="form-group col-md-4">
	            <label for="inputEmail4">Số điện thoại</label>
	            <input type="tel" class="form-control" id="inputEmail4">
	          </div>
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
	    </div>
	    <div class="form-row">
	        <div class="form-group col-md-6">
	          <label for="">Ngày tạo</label>
	          <input type="text" value="20/6/2000" readonly class="form-control" id="">
	        </div>
	        <div class="form-group col-md-6">
	          <label for="">Trạng thái</label>
	          <select id="" class="form-control">
	            <option>Hoạt động</option>
	            <option>Ngưng hoạt động</option>
	          </select>
	        </div>
	    </div>
	    <div class="form-group row justify-content-center mt-2">                      
	        <button class="btn btn-primary btn-icon-split">
	            <span class="icon text-white-50">
	                <i class="fa fa-check"></i>
	            </span>
	            <span class="text">Lưu</span>
	        </button>
	    </div>             
	</form>
</body>
</html>