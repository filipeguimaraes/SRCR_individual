import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class Write {

    public static void write(List<Contentor> contentores, List<Ligacao> ligacoes){
        //criação contentores//
        try {
            File myObj = new File("contentores.pl");
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        //write contentores//
        try {
            FileWriter myWriter = new FileWriter("contentores.pl");
            myWriter.write("% contentor(idContentor,latitude,longitude,freguesia,tipo,capacidade). %\n\n");
            for (Contentor c : contentores) {
                myWriter.write(c.toString());
            }
            myWriter.close();
            System.out.println("Contentores escritos.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        //criação ligacoes//
        try {
            File myObj = new File("ligacoes.pl");
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        //write ligacoes//
        try {
            FileWriter myWriter = new FileWriter("ligacoes.pl");
            myWriter.write("% ligacao(idContentor1,idContentor2,distancia). %\n\n");
            for (Ligacao l : ligacoes) {
                myWriter.write(l.toString());
            }
            myWriter.close();
            System.out.println("Ligações escritas.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
