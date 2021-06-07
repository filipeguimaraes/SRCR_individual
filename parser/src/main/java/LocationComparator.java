import java.util.Comparator;

public class LocationComparator implements Comparator<Contentor> {

    private Contentor atual;

    public LocationComparator(Contentor atual) {
        this.atual = atual;
    }



    public int compare(Contentor contentor1,Contentor contentor2) {
        return Double.compare(
                Ligacao.distance(atual.getLatitude(),atual.getLongitude(),contentor1.getLatitude(),contentor1.getLongitude()),
                Ligacao.distance(atual.getLatitude(),atual.getLongitude(),contentor2.getLatitude(),contentor2.getLongitude()));
    }
}