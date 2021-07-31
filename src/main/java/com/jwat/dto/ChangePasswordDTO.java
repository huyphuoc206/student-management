package com.jwat.dto;

public class ChangePasswordDTO {
	private Long userId;
	private String oldPassword;
	private String newPassword;
	private String newPasswordConfirm;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassord) {
		this.newPassword = newPassord;
	}

	public String getNewPasswordConfirm() {
		return newPasswordConfirm;
	}

	public void setNewPasswordConfirm(String newPassordConfirm) {
		this.newPasswordConfirm = newPassordConfirm;
	}

}
