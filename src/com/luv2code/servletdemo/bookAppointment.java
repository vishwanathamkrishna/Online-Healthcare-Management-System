package com.luv2code.servletdemo;

public class bookAppointment {
	
	
	private String firstName;
	private String lastName;
   private String specilization;
	private String appointment_date;
	private String Location;
	private String Timeslot;
	private String description;
	private String Mobile;
	private String Email;
	
	public bookAppointment(String firstName, String lastName,String specilization, String appointment_date, String location,
			String timeslot, String description, String mobile, String email) {
		super();
		this.firstName = firstName;
		this.lastName=lastName;
		this.specilization = specilization;
		this.appointment_date = appointment_date;
		Location = location;
		Timeslot = timeslot;
		this.description = description;
		Mobile = mobile;
		Email = email;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getSpecilization() {
		return specilization;
	}
	public void setSpecilization(String specilization) {
		this.specilization = specilization;
	}
	public String getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(String appointment_date) {
		this.appointment_date = appointment_date;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	public String getTimeslot() {
		return Timeslot;
	}
	public void setTimeslot(String timeslot) {
		Timeslot = timeslot;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	

}
