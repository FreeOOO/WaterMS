package lmx.extend;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lmx.entities.BorrowCertificate;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * @author www.codejava.net
 *
 */
public class PDFBorrowCer extends AbstractITextPdfView {

	/*@Override
	protected Document newDocument() {
		return new Document(PageSize.A2,3,3,50,50);
	}*/

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		@SuppressWarnings("unchecked")
		List<BorrowCertificate> listBorCer = (List<BorrowCertificate>) model.get("listBorCer");
		PdfPTable table = new PdfPTable(new float[] {0.11f, 0.1f, 0.1f, 0.15f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f});
		/*table.setWidthPercentage(100.0f);
		table.setWidths(new float[] {1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f});*/
		table.setSpacingBefore(10);
		
		String []arr = {"证书的员工id","证件姓名","证书类别","借用事由","投标时间","借用日期","应还日期","借用人","收证人","收证日期","备注","是否归还"};
		// define font for table header row
		
		BaseFont chinese = BaseFont.createFont("./msyh.ttf", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);  
 
        Font font = new Font(chinese, 10, Font.NORMAL);
		
		/*Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);*/
		
		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.GRAY);
		cell.setPadding(5);		//设置字与边框距离
		
		// write table header 
		for(int i = 0;i < arr.length;i++){
			cell.setPhrase(new Phrase(arr[i], font));
			table.addCell(cell);
		}
		/*cell.setPhrase(new Phrase("证书的员工id", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("证件姓名", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("证书类别", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("借用事由", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("投标时间", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("借用日期", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("应还日期", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("借用人", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("收证人", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("收证日期", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("备注", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("是否归还", font));
		table.addCell(cell);*/
		
		// write table row data
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		for (BorrowCertificate borcer : listBorCer) {
			PdfPCell cellt = new PdfPCell();
			cellt.setPhrase(new Phrase(String.valueOf(borcer.getCerid()), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borcer.getName(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borcer.getCertificateType(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borcer.getSubjecttoborrow(), font));
			table.addCell(cellt);
			if(borcer.getTenderTime() != null)
				cellt.setPhrase(new Phrase(fmt.format(borcer.getTenderTime()), font));
			else
				cellt.setPhrase(new Phrase("", font));
			table.addCell(cellt);
			if(borcer.getBorrowingDate() != null)
				cellt.setPhrase(new Phrase(fmt.format(borcer.getBorrowingDate()), font));
			else
				cellt.setPhrase(new Phrase("", font));
			table.addCell(cellt);
			if(borcer.getDatereturn() != null)
				cellt.setPhrase(new Phrase(fmt.format(borcer.getDatereturn()), font));
			else
				cellt.setPhrase(new Phrase("", font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borcer.getBorrower(), font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borcer.getIncomewitness(), font));
			table.addCell(cellt);
			if(borcer.getClosingdatecard() != null)
				cellt.setPhrase(new Phrase(fmt.format(borcer.getClosingdatecard()), font));
			else
				cellt.setPhrase(new Phrase("", font));
			table.addCell(cellt);
			cellt.setPhrase(new Phrase(borcer.getRemark(), font));
			table.addCell(cellt);
			/*if(borcer.getWhetherrestitution().equals("否"))
				font.setColor(BaseColor.RED);*/
			cellt.setPhrase(new Phrase(borcer.getWhetherrestitution(), font));
			table.addCell(cellt);
		}
		doc.add(table);
	}
	
	/*
	 * @Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// get data model which is passed by the Spring container
		@SuppressWarnings("unchecked")
		List<Book> listBooks = (List<Book>) model.get("listBooks");
		
		doc.add(new Paragraph("Recommended books for Spring framework"));
		
		PdfPTable table = new PdfPTable(5);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f, 1.0f});
		table.setSpacingBefore(10);
		
		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);
		
		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.BLUE);
		cell.setPadding(5);
		
		// write table header 
		cell.setPhrase(new Phrase("Book Title", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Author", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("ISBN", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Published Date", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Price", font));
		table.addCell(cell);
		
		// write table row data
		for (Book aBook : listBooks) {
			table.addCell(aBook.getTitle());
			table.addCell(aBook.getAuthor());
			table.addCell(aBook.getIsbn());
			table.addCell(aBook.getPublishedDate());
			table.addCell(String.valueOf(aBook.getPrice()));
		}
		
		doc.add(table);
		
	}
	 * */

}