package com.igou.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MyTest {

	public static void main(String[] args) {
		try {
//			yyyyMMddHHmm

			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
			String c=sdf.format(new Date());
			int date = Integer.parseInt(c)+1;
			System.out.print(date);
		}catch (Exception e){
			e.printStackTrace();
		}
	}

}
