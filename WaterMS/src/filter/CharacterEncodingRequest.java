package filter;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class CharacterEncodingRequest extends HttpServletRequestWrapper {
	private HttpServletRequest request = null;

	public CharacterEncodingRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	/**
	 * 对参数重新编码
	 */
	@Override
	public String getParameter(String name) {
		String value = super.getParameter(name);
		if (value == null)
			return null;
		String method = request.getMethod();
		if ("get".equalsIgnoreCase(method)) {
			try {
				value = new String(value.getBytes("ISO8859-1"), request.getCharacterEncoding());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return value;
	}
}
