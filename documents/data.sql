-- Insert faculty
INSERT INTO `student-management`.`faculty` (`name`, `code`) VALUES ('Công nghệ thông tin', 'CNTT');
INSERT INTO `student-management`.`faculty` (`name`, `code`) VALUES ('Nông học', 'NH');
INSERT INTO `student-management`.`faculty` (`name`, `code`) VALUES ('Chăn nuôi thú y', 'CNTY');

-- Insert department
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Mạng máy tính', 'MMT', '1');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Hệ thống thông tin', 'HTTT', '1');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Công nghệ phần mềm', 'CNPM', '1');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Bảo vệ thực vật', 'BVTV', '2');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Khoa học đất - phân bón', 'KHD-PB', '2');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Cây công nghiệp và dược liệu', 'CNDL', '2');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Dinh dưỡng động vật', 'DDDV', '3');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Giống động vật', 'GDV', '3');
INSERT INTO `student-management`.`department` (`name`, `code`, `faculty_id`) VALUES ('Thú y lâm sàng', 'TYLS', '3');

-- Insert subject

INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Mạng máy tính cơ bản', 'MMT', '1');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Lập trình mạng', 'LTM', '1');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Nhập môn cơ sở dữ liệu', 'NMCSDL', '2');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Phân tích và thiết kế hệ thống thông tin', 'PTTKHTTT', '2');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Cấu trúc dữ liệu và giải thuật', 'CTDLGT', '3');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Thiết kế hướng đối tượng', 'TKHDT', '3');

INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Di truyền và chọn tạo giống', 'DTTD', '4');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Quản lý tưới tiêu', 'QLTT', '4');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Đất và phân bón', 'DPB', '5');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Nông nghiệp hữu cơ', 'NNHC', '5');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Tự động hóa trong sản xuất cây trồng', 'TDHSXCT', '6');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Trồng cây không đất', 'TCKD', '6');

INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Nhập môn dinh dưỡng động vật', 'NMDDDV', '7');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Môi trường và sức khỏe vật nuôi', 'MTSK', '7');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Giống động vật đại cương', 'GDVDC', '8');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Truyền tinh truyền Phôi', 'TTTP', '8');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Dược lý thú y', 'DLTY', '9');
INSERT INTO `student-management`.`subject` (`name`, `code`, `department_id`) VALUES ('Dịch tể thú y', 'DTTY', '9');

-- Insert semester
INSERT INTO `student-management`.`semester` (`name`, `code`) VALUES ('Năm học 2020-2021 - Học kỳ 1', '2020-2021-HK1');
INSERT INTO `student-management`.`semester` (`name`, `code`) VALUES ('Năm học 2020-2021 - Học kỳ 2', '2020-2021-HK2');

-- Insert role
INSERT INTO `student-management`.`role` (`name`, `code`) VALUES ('Quản trị viên', 'ADMIN');
INSERT INTO `student-management`.`role` (`name`, `code`) VALUES ('Giảng viên', 'LECTURER');
INSERT INTO `student-management`.`role` (`name`, `code`) VALUES ('Sinh viên', 'STUDENT');

-- Insert degree
INSERT INTO `student-management`.`degree` (`name`, `code`) VALUES ('Giáo sư', 'GS');
INSERT INTO `student-management`.`degree` (`name`, `code`) VALUES ('Phó giáo sư', 'PGS');
INSERT INTO `student-management`.`degree` (`name`, `code`) VALUES ('Tiến sĩ', 'TS');
INSERT INTO `student-management`.`degree` (`name`, `code`) VALUES ('Thạc sĩ', 'ThS');

-- Insert class
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Công nghệ thông tin A', 'DH20DTA', '2020-2024', '1');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Công nghệ thông tin B', 'DH20DTB', '2020-2024', '1');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Công nghệ thông tin C', 'DH20DTC', '2020-2024', '1');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Nông học A', 'DH20NHA', '2020-2024', '2');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Nông học B', 'DH20NHB', '2020-2024', '2');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Nông học C', 'DH20NHC', '2020-2024', '2');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Chăn nuôi thú y A', 'DH20TYA', '2020-2024', '3');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Chăn nuôi thú y B', 'DH20TYB', '2020-2024', '3');
INSERT INTO `student-management`.`class` (`name`, `code`, `school_year`, `faculty_id`) VALUES ('Chăn nuôi thú y C', 'DH20TYC', '2020-2024', '3');

-- Insert admin
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', 'Huy Phước', '1975-3-23', 'Nam', 'hp@gmail.com', '0939882348', 1, NOW(), 1);
		
-- Insert lecturer		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('vtanh', 'e10adc3949ba59abbe56e057f20f883e', 'Vũ Tuấn Anh', '1990-5-23', 'Nam', 'vtanh@gmail.com', '0933682348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('tvbinh', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Văn Bình', '1985-3-23', 'Nam', 'tvbinh@gmail.com', '0939262348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('ntchi', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Chi', '1989-8-23', 'Nữ', 'ntchi@gmail.com', '0939882638', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('nvduy', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Văn Duy', '1965-3-23', 'Nam', 'nvduy@gmail.com', '0934362348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('ptem', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Thị Em', '1983-3-23', 'Nữ', 'ptem@gmail.com', '0932382348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('tvduong', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Văn Dương', '1990-3-3', 'Nam', 'tvduong@gmail.com', '0939865348', 1, NOW(), 2);				
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('dtgiang', 'e10adc3949ba59abbe56e057f20f883e', 'Dương Thiên Giang', '1995-3-23', 'Nữ', 'dtgiang@gmail.com', '0936582348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('bvhuy', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Viễn Huy', '1979-3-23', 'Nam', 'bvhuy@gmail.com', '0899882348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('nvha', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Vũ Hà', '1989-3-23', 'Nam', 'nvha@gmail.com', '0129882348', 1, NOW(), 2);			
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('nlkhanh', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Lê Khánh', '1979-3-23', 'Nữ', 'nlkhanh@gmail.com', '0939652348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('pmkhoa', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Mạnh Khoa', '1977-3-23', 'Nam', 'pmkhoa@gmail.com', '0234562348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('nvloi', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Vũ Lợi', '1987-3-23', 'Nam', 'nvloi@gmail.com', '0965482348', 1, NOW(), 2);			
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('blminh', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Long Minh', '1979-3-22', 'Nam', 'blminh@gmail.com', '0939887348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('languyen', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Anh Nguyên', '1977-3-29', 'Nam', 'languyen@gmail.com', '0939457348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('qtong', 'e10adc3949ba59abbe56e057f20f883e', 'Quách Thái Ông', '1989-5-23', 'Nam', 'qtong@gmail.com', '0923382348', 1, NOW(), 2);			
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('lnphuoc', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Anh Phước', '1972-3-23', 'Nam', 'lnphuoc@gmail.com', '0933482348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('paquan', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Anh Quân', '1979-3-23', 'Nam', 'paquan@gmail.com', '0923582348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('tvroi', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Văn Rồi', '1978-3-23', 'Nam', 'tvroi@gmail.com', '0936664834', 1, NOW(), 2);							
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('pbsinh', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Bỉnh Sinh', '1989-3-14', 'Nam', 'pbsinh@gmail.com', '0933434348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('tuthu', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Uyên thu', '1989-3-21', 'Nữ', 'tuthu@gmail.com', '0923532428', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('ntuyen', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Tú Uyên', '1987-3-12', 'Nữ', 'ntuyen@gmail.com', '0936664867', 1, NOW(), 2);	
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('tvvinh', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Vũ Vinh', '1990-9-20', 'Nam', 'tvvinh@gmail.com', '0954286348', 1, NOW(), 2);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('plvu', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Long Vũ', '1978-6-23', 'Nam', 'plvu@gmail.com', '0923282348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('ptuyen', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Thị Uyển', '1992-3-23', 'Nữ', 'ptuyen@gmail.com', '0932664834', 1, NOW(), 2);	
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('tcxuan', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Chinh Xuân', '1988-6-23', 'Nữ', 'tcxuan@gmail.com', '0923222348', 1, NOW(), 2);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('ntyen', 'e10adc3949ba59abbe56e057f20f883e', 'Ngô Thanh Yến', '1988-5-23', 'Nữ', 'ntyen@gmail.com', '0923282348', 1, NOW(), 2);	
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('nhy', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hà Ý', '1987-2-15', 'Nữ', 'nhy@gmail.com', '0923282348', 1, NOW(), 2);								

INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '2', '1');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '3', '1');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('1', '4', '1');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '5', '2');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '6', '2');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '7', '2');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '8', '3');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '9', '3');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '10', '3');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '11', '4');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '12', '4');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '13', '4');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('2', '14', '5');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '15', '5');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('2', '16', '5');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '17', '6');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '18', '6');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '19', '6');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '20', '7');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '21', '7');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('2', '22', '7');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '23', '8');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '24', '8');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('2', '25', '8');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('3', '26', '9');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('4', '27', '9');
INSERT INTO `student-management`.`lecturer` (`degree_id`, `user_id`, `department_id`) VALUES ('2', '28', '9');
					
-- Insert student		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200101', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Bình Khiêm', '2002-5-23', 'Nam', '20200101@gmail.com', '0933682301', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200102', 'e10adc3949ba59abbe56e057f20f883e', 'Ngô Vân Anh', '2002-5-12', 'Nữ', '20200102@gmail.com', '0933682302', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200103', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Vinh Long', '2002-5-3', 'Nam', '20200103@gmail.com', '0933682303', 1, NOW(), 3);	
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200104', 'e10adc3949ba59abbe56e057f20f883e', 'Ngô Tuyết Sương', '2002-5-2', 'Nữ', '20200104@gmail.com', '093334348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200105', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Minh Phát', '2002-5-23', 'Nam', '20200105@gmail.com', '093332348', 1, NOW(), 3);	
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200106', 'e10adc3949ba59abbe56e057f20f883e', 'Đặng Cao Kiệt', '2002-2-23', 'Nam', '20200106@gmail.com', '0933623348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200107', 'e10adc3949ba59abbe56e057f20f883e', 'Đặng Tuyết Mai', '2002-1-8', 'Nữ', '20200107@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200108', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Công Huy', '2002-3-12', 'Nam', '20200108@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200109', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Thị Trinh', '2002-6-23', 'Nữ', '20200109@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200110', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Minh Anh', '2002-12-2', 'Nữ', '20200110@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200111', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Tú Uyên', '2002-11-5', 'Nữ', '20200111@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200112', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Xuân Mai', '2002-3-26', 'Nữ', '20200112@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200113', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Lợi', '2002-12-9', 'Nam', '20200113@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200114', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Minh Huy', '2002-2-23', 'Nam', '20200114@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200115', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Văn Nhất', '2002-5-23', 'Nam', '20200115@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200116', 'e10adc3949ba59abbe56e057f20f883e', 'Tô Cao Long', '2002-6-16', 'Nam', '20200116@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200117', 'e10adc3949ba59abbe56e057f20f883e', 'Quách Kim Anh', '2002-7-6', 'Nữ', '20200117@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200118', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Hải Yến', '2002-4-3', 'Nữ', '20200118@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200119', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Lưu', '2002-5-22', 'Nam', '20200119@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200120', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Xuân Mách', '2002-5-11', 'Nam', '20200120@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200121', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Tuyết Ngân', '2002-2-24', 'Nữ', '20200121@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200122', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Nguyên Nghĩa', '2002-1-23', 'Nam', '20200122@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200123', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Cẩm Tú', '2002-12-15', 'Nữ', '20200123@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200124', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Chính Minh', '2002-2-2', 'Nam', '20200124@gmail.com', '0933682348', 1, NOW(), 3);	
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200125', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Lê Minh Hoàng', '2002-6-6', 'Nam', '20200125@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200126', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Huy Minh', '2002-11-5', 'Nam', '20200126@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200127', 'e10adc3949ba59abbe56e057f20f883e', 'Cao Kỳ Duyên', '2002-10-2', 'Nữ', '20200127@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200128', 'e10adc3949ba59abbe56e057f20f883e', 'Cao Văn Tam', '2002-6-23', 'Nam', '20200128@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200129', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Như Tâm', '2002-5-22', 'Nữ', '20200129@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200130', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Tâm Đức', '2002-5-21', 'Nam', '20200130@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200131', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Diệu My', '2002-7-12', 'Nữ', '20200131@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200132', 'e10adc3949ba59abbe56e057f20f883e', 'Mộng Cẩm Vy', '2002-2-21', 'Nữ', '20200132@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200133', 'e10adc3949ba59abbe56e057f20f883e', 'Quách Tuyết Hoa', '2002-3-16', 'Nữ', '20200133@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200134', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Chí Thành', '2002-1-27', 'Nam', '20200134@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200135', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Trung Nhân', '2002-4-22', 'Nam', '20200135@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200136', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Lê Hải Linh', '2002-9-2', 'Nữ', '2020013620200136@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200137', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Thiện Long', '2002-10-5', 'Nam', '20200137@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200138', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thiện Minh', '2002-8-7', 'Nam', '20200138@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200139', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Xuân Long', '2002-5-4', 'Nam', '20200139@gmail.com', '0933682348', 1, NOW(), 3);					
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200140', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Hải Hương', '2002-6-30', 'Nữ', '20200140@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200141', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Cường', '2002-2-7', 'Nam', '20200141@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200142', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Xuân Anh', '2002-7-25', 'Nữ', '20200142@gmail.com', '0933682348', 1, NOW(), 3);					
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200143', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Hải Hoàng', '2002-5-23', 'Nam', '20200143@gmail.com', '0933682348', 1, NOW(), 3);
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200144', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Minh Tú', '2002-8-1', 'Nữ', '20200144@gmail.com', '0933682348', 1, NOW(), 3);		
INSERT INTO `student-management`.`user` (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) 
		VALUES ('20200145', 'e10adc3949ba59abbe56e057f20f883e', 'Quách Cao Long', '2002-12-12', 'Nam', '20200145@gmail.com', '0933682348', 1, NOW(), 3);	

INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('29', '1');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('30', '1');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('31', '1');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('32', '1');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('33', '1');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('34', '2');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('35', '2');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('36', '2');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('37', '2');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('38', '2');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('39', '3');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('40', '3');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('41', '3');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('42', '3');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('43', '3');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('44', '4');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('45', '4');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('46', '4');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('47', '4');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('48', '4');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('49', '5');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('50', '5');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('51', '5');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('52', '5');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('53', '5');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('54', '6');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('55', '6');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('56', '6');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('57', '6');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('58', '6');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('59', '7');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('60', '7');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('61', '7');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('62', '7');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('63', '7');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('64', '8');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('65', '8');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('66', '8');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('67', '8');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('68', '8');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('69', '9');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('70', '9');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('71', '9');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('72', '9');
INSERT INTO `student-management`.`student` (`user_id`, `class_id`) VALUES ('73', '9');

