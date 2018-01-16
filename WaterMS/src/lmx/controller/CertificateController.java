package lmx.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import lmx.entities.Certificate;
import lmx.entities.Page;
import lmx.service.CertificateService;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/lmx")
public class CertificateController {
	@Autowired
	private CertificateService certificateServiceImpl;
	@Autowired
	private Page<Certificate> page;
	
	@RequestMapping(value = "/saveCertificate", method = RequestMethod.POST)		//添加证书信息
	public String saveCertificate(Certificate certificate,MultipartHttpServletRequest request){
		try {
			Calendar calendar = Calendar.getInstance();
			MultipartFile file = request.getFile("accessorymaterialfile");
			String uploadFileName = file.getOriginalFilename();
			if(uploadFileName != ""){
				InputStream isRef = file.getInputStream();
				String targetDir = request.getSession().getServletContext().getRealPath("/lmx/userphotos");
				uploadFileName = calendar.getTimeInMillis() + uploadFileName.substring(uploadFileName.lastIndexOf("."), uploadFileName.length());
				File targetFile = new File(targetDir, uploadFileName);
				FileOutputStream fosRef = new FileOutputStream(targetFile);
				IOUtils.copy(isRef, fosRef);
			}else
				uploadFileName = "";
			certificate.setAccessorymaterial(uploadFileName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		certificate.setWhetherrestitution("否");
		certificateServiceImpl.save(certificate);
		return "redirect:/lmx/showCertificatelist.spring?requestpage=1";
	}
	
	@RequestMapping("/showCertificatelist")		//显示所有证书的大概信息
	public String showCertificate(@RequestParam("requestpage") int requestpage,Model model){
		page = certificateServiceImpl.getCertificateList(requestpage,null,null,null);
		certificateServiceImpl.setPageJetLag(page);
		model.addAttribute("page", page);
		return "certificatelist.jsp";
	}
	
	@RequestMapping("/getCertificate")			//显示指定id的证书详细信息
	public String getCertificate(@RequestParam("cerid") int cerid,Model model){
		Certificate certificate = certificateServiceImpl.getCertificateById(cerid);
		model.addAttribute("certificate", certificate);
		return "certificatedetail.jsp";
	}
	
	@RequestMapping("/changeCerinfo")			//将指定id证书信息显示到修改页面
	public String changeInfo(@RequestParam("cerid") int cerid,Model model){
		Certificate certificate = certificateServiceImpl.getCertificateById(cerid);
		model.addAttribute("certificate", certificate);
		return "cerinfochange.jsp";
	}
	
	@RequestMapping(value = "/changeCertificate", method = RequestMethod.POST)		//获取指定id证书需要修改的信息并修改
	public String changeCertificate(Certificate certificate,MultipartHttpServletRequest request){
		try {
			Calendar calendar = Calendar.getInstance();
			MultipartFile file = request.getFile("accessorymaterialfile");
			String uploadFileName = file.getOriginalFilename();
			if(uploadFileName != ""){
				InputStream isRef = file.getInputStream();
				String targetDir = request.getSession().getServletContext().getRealPath("/lmx/userphotos");
				uploadFileName = calendar.getTimeInMillis() + uploadFileName.substring(uploadFileName.lastIndexOf("."), uploadFileName.length());
				File targetFile = new File(targetDir, uploadFileName);
				FileOutputStream fosRef = new FileOutputStream(targetFile);
				IOUtils.copy(isRef, fosRef);
				certificate.setAccessorymaterial(uploadFileName);
			}/*else
				uploadFileName = "defaultuser.jpg";*/
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		certificateServiceImpl.update(certificate);
		return "redirect:/lmx/showCertificatelist.spring?requestpage=1";
	}
	
	@RequestMapping("/deleteCertificate")		//删除指定id信息
	public String deleteCertificate(@RequestParam("cerid") int []cerid){
		for(int i = 0;i < cerid.length;i++){
			certificateServiceImpl.delete(cerid[i]);
		}
		return "redirect:/lmx/showCertificatelist.spring?requestpage=1";
	}
	
	@RequestMapping("/downloadfileaa")
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ResponseEntity download(@RequestParam("fileName") String fileName,HttpServletRequest request) throws IOException{
		String targetDir = request.getSession().getServletContext().getRealPath("/lmx/userphotos");
		File file = new File(targetDir + "/" + fileName);
		//fileName = "sad.jpg";
		ResponseEntity responseEntity = null;
		if(file.exists()){
			String dfileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			HttpHeaders headers = new HttpHeaders(); 
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); 
			headers.setContentDispositionFormData("attachment", dfileName); 
			responseEntity = new ResponseEntity(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		}
		return responseEntity;
	}
	
	@RequestMapping(value = "/findcertificate")
	public String findcertificate(@RequestParam("userid") String userid,Model model){
		String []columns = {"userid"};
		String []arr = {userid};
		page = certificateServiceImpl.getCertificateList(1,columns,arr,null);
		model.addAttribute("page", page);
		return "certificatelist.jsp";
	}
	
	/*@RequestMapping(value = "/isExistCertificate", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String isExistCertificate(@RequestParam("jsonString") String jsonString){
		JSONObject object = JSONObject.fromObject(jsonString);
		Certificate certificate = certificateServiceImpl.find(Long.parseLong(object.getString("userid")));
		if(certificate != null)
			return JSONObject.fromObject(certificate).toString();
		return "false";
	}*/
}
