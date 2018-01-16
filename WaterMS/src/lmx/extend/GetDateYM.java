package lmx.extend;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class GetDateYM {
	private Date dateBegin;
	private Date dateEnd;
	
	public void getDate(String string){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String []arr = string.split("-");
		int YYYY = Integer.parseInt(arr[0]);
		int M = Integer.parseInt(arr[1]);
		try {
			dateBegin = fmt.parse(YYYY + "-" + M + "-" + "1");
			int m = M + 1;
			if(m > 12){
				m = 1;
				YYYY++;
			}
			dateEnd = fmt.parse(YYYY + "-" + m + "-" + "1");
			Calendar end = Calendar.getInstance();
			end.setTime(dateEnd);
			end.add(Calendar.DATE, -1);
			dateEnd = end.getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getDateBegin() {
		return dateBegin;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

}
