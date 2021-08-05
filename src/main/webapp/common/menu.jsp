<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">
	<!-- Sidebar - Brand -->
	<c:if test="${USER.role.code == 'STUDENT'}">
		<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="<c:url value='/sinh-vien'/>">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">JWAT</div>
		</a>
	</c:if>
	
	<c:if test="${USER.role.code == 'LECTURER'}">
		<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="<c:url value='/giang-vien'/>">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">JWAT</div>
		</a>
	</c:if>
	
	<c:if test="${USER.role.code == 'ADMIN'}">
		<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="<c:url value='/quan-tri'/>">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">JWAT</div>
		</a>
	</c:if>
	<!-- Divider -->
	<hr class="sidebar-divider my-0" />

	<!-- Student -->
	<c:if test="${USER.role.code == 'STUDENT'}">
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/sinh-vien'/>"> <i class="fas fa-fw fa-info"></i>
				<span>Thông tin cá nhân</span></a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/sinh-vien/doi-mat-khau'/>"> <i class="fas fa-fw fa-key"></i> <span>Đổi mật khẩu</span></a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/sinh-vien/xem-diem'/>"> <i class="fas fa-fw fa-book"></i> <span>Xem điểm</span></a></li>
	</c:if>

	<!-- Lecturer -->
	<c:if test="${USER.role.code == 'LECTURER'}">
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/giang-vien'/>"> <i class="fas fa-fw fa-info"></i>
				<span>Thông tin cá nhân</span></a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/giang-vien/doi-mat-khau'/>"> <i class="fas fa-fw fa-key"></i> <span>Đổi mật khẩu</span></a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/giang-vien/danh-sach-mon-hoc'/>"> <i class="fas fa-fw fa-book"></i> <span>Danh sách môn học</span></a></li>
	</c:if>

	<!-- Admin -->
	<c:if test="${USER.role.code == 'ADMIN'}">
		<li class="nav-item"><a class="nav-link" href="<c:url value='/quan-tri'/>">
				<i class="fas fa-fw fa-home"></i> <span>Trang chủ</span>
		</a></li>

		<hr class="sidebar-divider" />
		
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/quan-tri/thong-tin-ca-nhan'/>"> <i class="fas fa-fw fa-info"></i>
				<span>Thông tin cá nhân</span></a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/quan-tri/doi-mat-khau'/>"> <i class="fas fa-fw fa-key"></i> <span>Đổi mật khẩu</span></a></li>
					
		<li class="nav-item">
			<a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <i
				class="fas fa-fw fa-user"></i> <span>Quản lý người dùng</span>
			</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="<c:url value='/quan-tri/giang-vien'/>">Giảng viên</a> 
					<a class="collapse-item" href="<c:url value='/quan-tri/sinh-vien'/>">Sinh viên</a>
				</div>
			</div>
		</li>

		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/quan-tri/khoa'/>"> <i
				class="fas fa-fw fa-building"></i> <span>Quản lý khoa</span>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value='/quan-tri/bo-mon'/>"> <i
				class="fas fa-fw fa-window-maximize"></i> <span>Quản lý bộ môn</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="<c:url value='/quan-tri/mon-hoc'/>">
				<i class="fas fa-fw fa-book"></i> <span>Quản lý môn học</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="<c:url value='/quan-tri/lop'/>"> <i
				class="fas fa-fw fa-address-book"></i> <span>Quản lý lớp</span></a></li>
	</c:if>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block" />

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!-- End of Sidebar -->