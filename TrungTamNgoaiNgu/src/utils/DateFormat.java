package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	public static final String FORMAT_SV = "yyyy-MM-dd";
	public static final String FORMAT_1 = "dd/MM/yyyy";
	public static final String FORMAT_2 = "MM/dd/yyyy";
	public static final String FORMAT_3 = "MM/dd/yyyy hh:mm aa";
	public static final String FORMAT_4 = "MM/dd/yyyy HH:mm";
	public static final String FM_MY = "MM yyyy";
	public static final String FORMAT_5 = "yyyy-MM-dd HH:mm:ss.SSS";

	public String formatDate(String dateOld) {
		String dateNew;
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_SV);
		Date date = new Date();

		try {
			date = sdf.parse(dateOld);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		sdf.applyPattern(FORMAT_2);
		dateNew = sdf.format(date);

		return dateNew;
	}

	public Date getDate(String dateStr, String format) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);

		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return date;
	}

	public String getDateString(Date date, String format) {
		String dateStr;
		SimpleDateFormat sdf = new SimpleDateFormat(format);

		dateStr = sdf.format(date);

		return dateStr;
	}

	public String formatDateTime(Date date) {
		String dateStr;
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_3);

		dateStr = sdf.format(date);

		return dateStr;
	}

	public Date getDate(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_2);
		Date dateNew = new Date();

		try {
			dateNew = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dateNew;
	}

	public Date getDateTime(String dtStr) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_3);
		Date dateNew = new Date();

		try {
			dateNew = sdf.parse(dtStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dateNew;
	}

	public Date getDateTimeNoSplit(String dtStr) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_4);
		Date dateNew = new Date();

		try {
			dateNew = sdf.parse(dtStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dateNew;
	}
}
