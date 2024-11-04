package com.entity;

public class PerfumeDtls {
	private int perfumeID;
	private String perfumename;
	private String author;
	private String price;
	private String perfumeCategory;
	private String status;
	private String photo;
	private String email;
	public PerfumeDtls() {
		super();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public PerfumeDtls(String perfumename,String author,String price,String perfumeCategory,String status,String photo,String email) {
		super();
		this.perfumename=perfumename;
		this.author=author;
		this.price=price;
		this.perfumeCategory=perfumeCategory;
		this.photo=photo;
		this.email=email;
		this.status=status;
	}
	public int getperfumeID() {
		return perfumeID;
	}
	public void setperfumeID(int perfumeID) {
		this.perfumeID = perfumeID;
	}
	public String getperfumename() {
		return perfumename;
	}
	public void setperfumename(String perfumename) {
		this.perfumename = perfumename;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getperfumeCategory() {
		return perfumeCategory;
	}
	public void setperfumeCategory(String perfumeCategory) {
		this.perfumeCategory = perfumeCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "perfumeDtls [perfumeID=" + perfumeID + ", perfumename=" + perfumename + ", author=" + author + ", price=" + price
				+ ", perfumeCategory=" + perfumeCategory + ", status=" + status + ", photo=" + photo + ", email=" + email
				+ "]";
	}
	
}
