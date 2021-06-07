import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Read {

    public static List<Contentor> read() throws IOException {
        List<Contentor> contentores = new ArrayList<>();

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
                Double latitude = cell.getNumericCellValue();
                //longitude: float
                cell = cellIterator.next();
                Double longitude = cell.getNumericCellValue();
                //object id: int
                cell = cellIterator.next();
                int idContentor = ((Double)cell.getNumericCellValue()).intValue();
                //ponto recolha freguesia: string
                cell = cellIterator.next();
                String freguesia = cell.getStringCellValue();
                //ponto recolha local: string
                cell = cellIterator.next();
                int idRecolha = Integer.parseInt(cell.getStringCellValue().split(":")[0]);
                //System.out.println(idRecolha);
                //contentor residuos: string
                cell = cellIterator.next();
                String tipo = cell.getStringCellValue();
                //contentor tipo: string
                cell = cellIterator.next();
                cell.getStringCellValue();
                //contentor cap: int
                cell = cellIterator.next();
                cell.getNumericCellValue();
                //contentor qt: int
                cell = cellIterator.next();
                cell.getNumericCellValue();
                //contentor total litros: int
                cell = cellIterator.next();
                int capacidade = ((Double) cell.getNumericCellValue()).intValue();
                contentores.add(new Contentor(tipo,latitude,longitude,freguesia,capacidade,idContentor));
            }

        }
        return contentores;
    }
/**
    public List<Contentor> getContentoresUnicos() throws IOException {
        read();
        List<Contentor> contentoresfinal = new ArrayList<>();
        Contentor c = null;
        for (Contentor contentor : contentores) {
            if(c == null || !c.equals(contentor)){
                contentoresfinal.add(contentor);
                c = contentor;
            } else {
                c.somaCapacidade(contentor.getCapacidade());
            }
        }

        return contentoresfinal;
    }
 */
}

