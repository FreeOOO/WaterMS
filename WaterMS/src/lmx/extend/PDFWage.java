package lmx.extend;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lmx.entities.Wage;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PDFWage extends AbstractITextPdfView {
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		@SuppressWarnings("unchecked")
		List<Wage> listWage = (List<Wage>) model.get("listWage");
		PdfPTable table = new PdfPTable(new float[] {0.1f, 0.1f, 0.12f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f });
		table.setSpacingBefore(6);
		String []arr = {"员工ID","姓名","发放时间","基本工资","工龄工资","技能工资","岗位工资","绩效工资","津贴","其他","应发合计","医疗保险","失业保险","养老保险","住房公积金","所得税金","其它扣款","扣款合计","实发工资"};
		BaseFont chinese = BaseFont.createFont("./msyh.ttf", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);  
 
        Font font = new Font(chinese, 7, Font.NORMAL);
		
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.GRAY);
		cell.setPadding(4);
		
		for(int i = 0;i < arr.length;i++){
			cell.setPhrase(new Phrase(arr[i], font));
			table.addCell(cell);
		}
		
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		for (Wage wage : listWage) {
			PdfPCell cellt = new PdfPCell();
			cellt.setPhrase(new Phrase(String.valueOf(wage.getUserid()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(wage.getName(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(fmt.format(wage.getPayrollTime()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getBasicwage()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getSenioritywage()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getSkillwage()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getPostsalary()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getPerformancepay()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getAllowance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getOther()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getTotalsent()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getMedicalinsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getUnemploymentinsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getPension()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getHousingfund()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getIncometax()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getOtherdeductions()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getTotalcharge()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(wage.getRealwages()), font));
			table.addCell(cellt);
		}
		doc.add(table);
	}
}
