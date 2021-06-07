import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class Main {

    public static void main(String[] args) throws IOException {
        List<Contentor> contentores = Read.read();
        List<Ligacao> ligacoes = new ArrayList<>();
        /**
        List<Contentor> lixos = contentores.stream()
                .filter(contentor -> contentor.getTipo().contains("Lixos"))
                .collect(Collectors.toList());
        List<Contentor> papelCartao = contentores.stream()
                .filter(contentor -> contentor.getTipo().contains("Papel"))
                .collect(Collectors.toList());
        List<Contentor> vidro = contentores.stream()
                .filter(contentor -> contentor.getTipo().contains("Vidro"))
                .collect(Collectors.toList());
        List<Contentor> embalagens = contentores.stream()
                .filter(contentor -> contentor.getTipo().contains("Embalagens"))
                .collect(Collectors.toList());
        List<Contentor> organicos = contentores.stream()
                .filter(contentor -> contentor.getTipo().contains("Organicos"))
                .collect(Collectors.toList());
        List<Contentor> seletiva = contentores.stream()
                .filter(contentor -> contentor.getTipo().contains("Papel") ||
                                     contentor.getTipo().contains("Vidro") ||
                                     contentor.getTipo().contains("Embalagens"))
                .collect(Collectors.toList());



        for (Contentor c: contentores) {
            LocationComparator comparator = new LocationComparator(c);
            List<Contentor> proximos = contentores.stream()
                    .sorted(comparator)
                    .collect(Collectors.toList());
            for (int i = 0; i <= VARIABLES.NUMEROLIGACOES; i++) {
                if (c.getIdContentor() == proximos.get(i).getIdContentor()){
                    continue;
                }
                Ligacao ligacao = new Ligacao(c,proximos.get(i));
                ligacoes.add(ligacao);
            }
        }
         */
        for (int i = 0; i < contentores.size()-1; i++) {
            Random r = new Random(LocalDateTime.now().getNano());
            int low = 0;
            int high = contentores.size()-1;
            int result = r.nextInt(high-low) + low;


            Ligacao ligacao = new Ligacao(contentores.get(i),contentores.get(i+1));
            if(result!=i && r.nextInt(2)==1){
                Ligacao ligacao2 = new Ligacao(contentores.get(i),contentores.get(result));
                ligacoes.add(ligacao2);
            }
            ligacoes.add(ligacao);
        }


        Write.write(contentores,ligacoes);

    }
}
