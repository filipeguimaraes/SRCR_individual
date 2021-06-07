import javax.sound.midi.Soundbank;
import java.util.Objects;

public class Contentor {
    private final String tipo;
    private final Double latitude;
    private final Double longitude;
    private final String freguesia;
    private int capacidade;
    private final int idContentor;

    public Contentor(String tipo, Double latitude, Double longitude, String freguesia, int capacidade, int idContentor) {
        this.tipo = tipo;
        this.latitude = latitude;
        this.longitude = longitude;
        this.freguesia = freguesia;
        this.capacidade = capacidade;
        this.idContentor = idContentor;
    }

    public String getTipo() {
        return tipo;
    }

    public Double getLatitude() {
        return latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public String getFreguesia() {
        return freguesia;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public int getIdContentor() {
        return idContentor;
    }

    public void somaCapacidade(int valor){
        capacidade += valor;
    }

    @Override
    public String toString() {
        //contentor(idRecolha,latitude,longitude,freguesia,tipo,capacidade)
        return "contentor("+ idContentor +
                ", " + latitude +
                ", " + longitude +
                ", \"" + freguesia + '\"' +
                ", \"" + tipo + '\"' +
                ", " + capacidade +
                ").\n";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Contentor contentor = (Contentor) o;
        return tipo.equals(contentor.tipo) &&
                latitude.equals(contentor.latitude) &&
                longitude.equals(contentor.longitude);
    }

}
