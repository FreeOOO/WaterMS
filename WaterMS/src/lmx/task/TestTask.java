package lmx.task;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import lmx.entities.Certificate;
import lmx.entities.LaborContract;
import lmx.extend.SendMail;
import lmx.service.CertificateService;
import lmx.service.LaborContractService;
import lmx.service.SocialSecurityService;
import lmx.service.impl.WageServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
//@Lazy(value = false)		//当配置文件中设置default-lazy-init ="true"时需要加上@Lazy(value = false)
public class TestTask {
	@Autowired
	private CertificateService certificateServiceImpl;
	@Autowired
	private LaborContractService laborContractServiceImpl;
	@Autowired
	private WageServiceImpl wageServiceImpl;
	@Autowired
	private SocialSecurityService socialSecurityServiceImpl;
	@Autowired
	private SendMail sendMail;
	@Scheduled(cron = "0 0 1 * * ?")
	//@Scheduled(cron = "0/10 * * * * ?")
    public void reminderCer() {				//证书提醒延期
		Calendar now = Calendar.getInstance();
		Date beginTime = now.getTime();
		now.add(Calendar.DATE, 90);
		List<Certificate> listCer = certificateServiceImpl.getLimintTime(beginTime, now.getTime());
		for(Certificate certificate : listCer){
			sendMail.send("证书到期提醒",certificate.getName() + ",你的资格证书编号为" + certificate.getCertificateNumber() + "的证书即将到期，请做好延期工作。","274372835@qq.com");
			//System.out.println(certificate.getName() + certificate.getEmail());
		}
		//sendMail.send("测试邮箱","测试内容，确定是否发送11","274372835@qq.com");
        //System.out.println("发送证书到期提醒");
    }
	
	@Scheduled(cron = "0 0 2 * * ?")		//每天一点
    public void reminderLabCon() {			//提醒劳动合同到期
		Calendar now = Calendar.getInstance();
		Date beginTime = now.getTime();
		now.add(Calendar.DATE, 90);
		List<LaborContract> listCer = laborContractServiceImpl.getLimintTime(beginTime, now.getTime());
		for(LaborContract laborContract : listCer){
			sendMail.send("劳动合同到期提醒",laborContract.getName() + ",你的劳动合同编号为" + laborContract.getContractNo() + "的合同即将到期，请做好延期工作。","274372835@qq.com");
		}
		System.out.println("发送邮件");
    }
    
    @Scheduled(cron = "0 0 3 28 * ?")		//每个月最后一天三点执行
    public void fillWage() {				//生成工资
    	wageServiceImpl.fillWage();
    	System.out.println("生成工资");
    }
    
	@Scheduled(cron = "0 0 3 28 * ?")		//每个月最后一天三点执行
    public void fillSocialSecurity() {		//生成社保
    	socialSecurityServiceImpl.fillSocialSecurity();
    	System.out.println("生成社保");
    }
}