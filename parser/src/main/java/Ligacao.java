public class Ligacao {
    private final Contentor contentor1;
    private final Contentor contentor2;
    private final Double distance;

    public Ligacao(Contentor contentor1, Contentor contentor2) {
        this.contentor1 = contentor1;
        this.contentor2 = contentor2;
        this.distance = distance(contentor1.getLatitude(),
                contentor1.getLongitude(),
                contentor2.getLatitude(),
                contentor2.getLongitude());
    }

    public static double distance(double lat1, double lon1, double lat2, double lon2) {
        if ((lat1 == lat2) && (lon1 == lon2)) {
            return 0;
        } else {
            double theta = lon1 - lon2;
            double dist = Math.sin(Math.toRadians(lat1)) * Math.sin(Math.toRadians(lat2)) + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) * Math.cos(Math.toRadians(theta));
            dist = Math.acos(dist);
            dist = Math.toDegrees(dist);
            dist = dist * 60 * 1.1515;
            dist = dist * 1.609344;
            return (dist);
        }
    }

    public Contentor getContentor1() {
        return contentor1;
    }

    public Contentor getContentor2() {
        return contentor2;
    }

    public Double getDistance() {
        return distance;
    }

    @Override
    public String toString() {
        return "ligacao("+ contentor1.getIdContentor() +
                ", " + contentor2.getIdContentor() +
                ", " + distance +
                ").\n";
    }
}
