package com.velociter.ems.database;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommanOperations {


	//====================this method will take date in "YYYY-MM-DD" Format And Return Into "DD-MMM-YYYY" format===================
	private String dateAfterChangeFormat;
	public String changeDateFormate(String inputDate)
	{
		String getInputDate = inputDate;
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		SimpleDateFormat requireDateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		try {
			dateAfterChangeFormat = requireDateFormat.format(inputDateFormat.parse(getInputDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dateAfterChangeFormat;
	}
	
	//====================this method will return current date with 'DD-MMM-YYYY HH:MM:SS' format===================

	public String getCreationDate() throws ParseException
	{ 
		String currentdate;
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
		Date date = new Date();
		currentdate  = formatter.format(date);
		System.out.println(formatter.format(date));
     	return currentdate;
	}
	

	
}
