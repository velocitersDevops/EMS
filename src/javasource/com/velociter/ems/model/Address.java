package com.velociter.ems.model;

public class Address {
	
	private int addressId;
	private String addressLine1;
	private int streetNumber;
	private String cityName;
	private String stateName;
	private int pincodeNumber;
	private String countryName;
	private int addressType;
	private String houseNumber;
	
	
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	
	public int getStreetNumber() {
		return streetNumber;
	}
	public void setStreetNumber(int streetNumber) {
		this.streetNumber = streetNumber;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public int getPincodeNumber() {
		return pincodeNumber;
	}
	public void setPincodeNumber(int pincodeNumber) {
		this.pincodeNumber = pincodeNumber;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public int getAddressType() {
		return addressType;
	}
	public void setAddressType(int addressType) {
		this.addressType = addressType;
	}
	public String getHouseNumber() {
		return houseNumber;
	}
	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", addressLine1=" + addressLine1 + ", streetNumber=" + streetNumber
				+ ", cityName=" + cityName + ", stateName=" + stateName + ", pincodeNumber=" + pincodeNumber
				+ ", countryName=" + countryName + ", addressType=" + addressType + ", houseNumber=" + houseNumber
				+ "]";
	}
	
	
	

}
