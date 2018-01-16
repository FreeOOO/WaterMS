package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CharacterEncodingFilter implements Filter {
	protected String encoding = "UTF-8";
	@Override
	public void destroy() {
		this.encoding = null;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		// 设置request编码
		request.setCharacterEncoding(this.encoding);
		// 设置相应信息
		response.setContentType("text/html;charset=" + this.encoding);
		response.setCharacterEncoding(this.encoding);
		chain.doFilter(new CharacterEncodingRequest(request), response);
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		String encoding = fConfig.getInitParameter("encoding");
		if (encoding != null)
			this.encoding = encoding;
	}

}
