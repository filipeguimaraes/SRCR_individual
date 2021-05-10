import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

public class Read {


    public static void read() throws IOException {
        File myFile = new File("src/main/resources/dataset.xlsx");
        FileInputStream fis = new FileInputStream(myFile);

        // Finds the workbook instance for XLSX file
        XSSFWorkbook myWorkBook = new XSSFWorkbook(fis);

        // Return first sheet from the XLSX workbook
        XSSFSheet mySheet = myWorkBook.getSheetAt(0);

        // Get iterator to all the rows in current sheet
        Iterator<Row> rowIterator = mySheet.iterator();
        rowIterator.next();
        // Traversing over each row of XLSX file
        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();

            // For each row, iterate through each columns
            Iterator<Cell> cellIterator = row.cellIterator();

            while (cellIterator.hasNext()) {
                //latitude: float
                Cell cell = cellIterator.next();
                System.out.println(cell.getNumericCellValue());
                //longitude: float
                cell = cellIterator.next();
                System.out.println(cell.getNumericCellValue());
                //object id: int
                cell = cellIterator.next();
                System.out.println(cell.getNumericCellValue());
                //ponto recolha freguesia: string
                cell = cellIterator.next();
                System.out.println(cell.getStringCellValue());
                //ponto recolha local: string
                cell = cellIterator.next();
                System.out.println(cell.getStringCellValue());
                //contentor residuos: string
                cell = cellIterator.next();
                System.out.println(cell.getStringCellValue());
                //contentor tipo: string
                cell = cellIterator.next();
                System.out.println(cell.getStringCellValue());
                //contentor cap: int
                cell = cellIterator.next();
                System.out.println(cell.getNumericCellValue());
                //contentor qt: int
                cell = cellIterator.next();
                System.out.println(cell.getNumericCellValue());
                //contentor total litros: int
                cell = cellIterator.next();
                System.out.println(cell.getNumericCellValue());
            }

        }
        System.out.println("");
    }
}

