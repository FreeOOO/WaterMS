package lmx.extend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component("sendMail")
public class SendMail {
	@Autowired
	private MailSender mailSender;
	@Autowired
    private SimpleMailMessage simpleMailMessage;
	
	public void send(String subject, String content, String to){
		//simpleMailMessage.setFrom("iamluosa968@163.com");
		simpleMailMessage.setSubject(subject); //设置邮件主题
        simpleMailMessage.setTo(to);             //设定收件人
        simpleMailMessage.setText(content);  //设置邮件主题内容
        mailSender.send(simpleMailMessage); //发送邮件
	}
}
