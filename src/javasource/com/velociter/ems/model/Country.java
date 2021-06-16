package com.velociter.ems.model;

public class Country
{
 private String isdCode;
 private String isoCode;
 private String countryName;
public String getIsdCode() {
	return isdCode;
}
public void setIsdCode(String isdCode) {
	this.isdCode = isdCode;
}
public String getIsoCode() {
	return isoCode;
}
public void setIsoCode(String isoCode) {
	this.isoCode = isoCode;
}
public String getCountryName() {
	return countryName;
}
public void setCountryName(String countryName) {
	this.countryName = countryName;
}
@Override
public String toString() {
	return "Country [isdCode=" + isdCode + ", isoCode=" + isoCode + ", countryName=" + countryName + "]";
}

 
}
