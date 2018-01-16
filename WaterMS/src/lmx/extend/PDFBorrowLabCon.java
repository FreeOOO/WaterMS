package lmx.extend;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lmx.entities.BorrowlaborContract;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PDFBorrowLabCon extends AbstractITextPdfView {
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		@SuppressWarnings("unchecked")
		List<BorrowlaborContract> listBorLabCon = (List<BorrowlaborContract>) model.get("listBorLabCon");
		PdfPTable table = new PdfPTable(new float[] {0.11f, 0.1f, 0.1f, 0.15f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f });
		table.setSpacingBefore(10);
		String []arr = {"合同的员工ID","合同姓名","借用事由","借用日期","应还日期","借用人","收回人","收回日期","备注","是否归还"};
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
		for (BorrowlaborContract borLabCon : listBorLabCon) {
			PdfPCell cellt = new PdfPCell();
			cellt.setPhrase(new Phrase(String.valueOf(borLabCon.getUserid()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borLabCon.getName(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borLabCon.getSubjecttoborrow(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(fmt.format(borLabCon.getBorrowingDate()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(fmt.format(borLabCon.getDatereturn()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borLabCon.getBorrower(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borLabCon.getHandpaintedPeople(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(fmt.format(borLabCon.getDateofrecovery()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borLabCon.getRemark(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borLabCon.getWhetherrestitution(), font));
			table.addCell(cellt);
		}
		doc.add(table);
	}
}
