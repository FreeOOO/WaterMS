package lmx.extend;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lmx.entities.SocialSecurity;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PDFSocSec extends AbstractITextPdfView{
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		@SuppressWarnings("unchecked")
		List<SocialSecurity> socialSecurities = (List<SocialSecurity>) model.get("listSocSec");
		PdfPTable table = new PdfPTable(new float[] {0.11f, 0.08f, 0.09f, 0.09f, 0.09f, 0.09f, 0.09f, 0.09f, 0.09f, 0.09f, 0.09f, 0.09f, 0.09f });
		table.setSpacingBefore(10);
		String []arr = {"时间","姓名","医保基数","养老基数","个人医疗保险","个人失业保险","个人养老保险","单位医疗保险","单位失业保险","单位养老保险","单位医保大病","单位生育保险","单位工伤保险"};
		BaseFont chinese = BaseFont.createFont("./msyh.ttf", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);  
 
        Font font = new Font(chinese, 10, Font.NORMAL);
		
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.GRAY);
		cell.setPadding(5);
		
		for(int i = 0;i < arr.length;i++){
			cell.setPhrase(new Phrase(arr[i], font));
			table.addCell(cell);
		}
		
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		for (SocialSecurity socSec : socialSecurities) {
			PdfPCell cellt = new PdfPCell();
			cellt.setPhrase(new Phrase(fmt.format(socSec.getTime()), font));
			table.addCell(cellt);
			/*cellt.setPhrase(new Phrase(socSec.getPersonalNumber(), font));
			table.addCell(cellt);*/
			cellt.setPhrase(new Phrase(socSec.getName(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getMedicarebase()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getPensionbase()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getIndividualhealthinsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getPersonalUnemploymentInsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getPrivatepensioninsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getMedicalInsuranceUnit()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getUnemploymentInsuranceUnit()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getEndowmentinsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getUnitillnessinsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getUnitmaternityinsurance()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(String.valueOf(socSec.getInjuryinsuranceunit()), font));
			table.addCell(cellt);
		}
		doc.add(table);
	}
}
